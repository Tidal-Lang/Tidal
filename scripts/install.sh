#!/usr/bin/bash
sudo apt update

sudo curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

rustup target add x86_64-unknown-linux-gnu
rustup target add x86_64-pc-windows-gnu
rustup target add aarch64-apple-darwin

# For Debian/Ubuntu:
sudo apt update && sudo apt install -y mingw-w64
# For Fedora:
# sudo dnf install mingw64-gcc
# For Arch:
# sudo pacman -S mingw-w64-gcc

# Verify installations
rustc --version
cargo --version
x86_64-w64-mingw32-gcc --version

sudo apt-get install -y linux-image-generic
