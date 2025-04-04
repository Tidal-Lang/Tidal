.PHONY: all clean install linux windows macos-arm macos-x86 build-all test

ifeq ($(OS),Windows_NT)
    TARGET = windows
    BINARY = td.exe
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Darwin)
        TARGET = macos
        BINARY = td
    else
        TARGET = linux
        BINARY = td
    endif
endif

all: $(TARGET)

install:
	@echo "Installing dependencies..."
ifeq ($(OS),Windows_NT)
	@echo "Installing Windows dependencies..."
	@where rustc >nul 2>nul || curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
	@where gcc >nul 2>nul || choco install -y mingw
	@echo "Adding Rust targets..."
	@rustup target add x86_64-pc-windows-gnu x86_64-unknown-linux-gnu aarch64-apple-darwin x86_64-apple-darwin
else ifeq ($(UNAME_S),Darwin)
	@echo "Installing macOS dependencies..."
	@which brew >/dev/null || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	@which rustc >/dev/null || brew install rust
	@which gcc >/dev/null || brew install gcc
	@rustup target add aarch64-apple-darwin x86_64-apple-darwin
else
	@echo "Installing Linux dependencies..."
	@sudo apt update
	@which rustc >/dev/null || { \
		echo "Installing Rust..." && \
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
		. $$HOME/.cargo/env; \
	}
	@which x86_64-w64-mingw32-gcc >/dev/null || sudo apt install -y mingw-w64
	@echo "Adding Rust targets..."
	@. $$HOME/.cargo/env && rustup target add x86_64-pc-windows-gnu x86_64-unknown-linux-gnu aarch64-apple-darwin x86_64-apple-darwin
endif

linux:
	@echo "Building for Linux..."
	@cargo build --release --target x86_64-unknown-linux-gnu --features unix

windows:
	@echo "Building for Windows..."
	@cargo build --release --target x86_64-pc-windows-gnu --features windows

macos-arm:
	@echo "Building for macOS (ARM64)..."
	@cargo build --release --target aarch64-apple-darwin --features macos

macos-x86:
	@echo "Building for macOS (x86_64)..."
	@cargo build --release --target x86_64-apple-darwin --features macos

clean:
	@echo "Cleaning..."
	@cargo clean

build-all:
	@echo "Building for all platforms..."
	@$(MAKE) clean
	@$(MAKE) linux
	@$(MAKE) windows
ifeq ($(UNAME_S),Darwin)
	@$(MAKE) macos-arm
	@$(MAKE) macos-x86
endif
	@echo "Done! Binaries are in:"
	@echo "Linux: target/x86_64-unknown-linux-gnu/release/td"
	@echo "Windows: target/x86_64-pc-windows-gnu/release/td.exe"
ifeq ($(UNAME_S),Darwin)
	@echo "macOS (ARM): target/aarch64-apple-darwin/release/td"
	@echo "macOS (Intel): target/x86_64-apple-darwin/release/td"
endif

test:
	@echo "Running tests..."
ifeq ($(OS),Windows_NT)
	@cargo test --verbose --features windows --target x86_64-pc-windows-gnu
else ifeq ($(UNAME_S),Darwin)
	@if [ "$(shell uname -m)" = "arm64" ]; then \
		cargo test --verbose --features macos --target aarch64-apple-darwin; \
	else \
		cargo test --verbose --features macos --target x86_64-apple-darwin; \
	fi
else
	@cargo test --verbose --features unix --target x86_64-unknown-linux-gnu
endif
