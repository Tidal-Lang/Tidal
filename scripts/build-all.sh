#!/bin/bash

echo "Cleaning...."
cargo clean

echo "Building for Linux..."
cargo run --release --target x86_64-unknown-linux-gnu --features unix

echo "Building for Windows..."
cargo run --release --target x86_64-pc-windows-gnu --features windows

# Only try macOS build if explicitly requested
if [ "$BUILD_MACOS" = "true" ]; then
    echo "Building for macOS (ARM)..."
    echo "Note: macOS builds require building on macOS directly"
    cargo run --release --target aarch64-apple-darwin --features macos
fi

echo "Done! Binaries are in:"
echo "Linux: target/x86_64-unknown-linux-gnu/release/td"
echo "Windows: target/x86_64-pc-windows-gnu/release/td.exe"
[ "$BUILD_MACOS" = "true" ] && echo "macOS: target/aarch64-apple-darwin/release/td"