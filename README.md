# Tidal
https://tidal.pranavv.co.in

<img src="logo/banner.jpeg" height="200px">  <img src="logo/logo.jpeg" height="200px"><br>
<i>PS, I have just changed the Name of the Programming Language from `Blue Lagoon` to `Tidal`, so, if you see Blue Lagoon written anywhere, just know, it was the old name of the Language!</i>

A Language Made using Rust. <br>
Made by Pranav Verma.

## Download
The Latest Compiled Build Can Be Found in the [Releases](https://github.com/PranavVerma-droid/Blue-Lagoon/releases) (For Windows and Linux)

## File Extensions
- `.td`: Tidal source files.
- `.br`: Another extension for Tidal source files.

## Features
- **Simple Syntax**: Easy-to-read and write syntax.
- **Basic Data Types**: Supports integers, floats, strings, booleans, and null.
- **Control Structures**: Includes `if-else` statements and `for` loops.
- **String Operations**: Supports concatenation, repetition, and indexing.
- **Type Checking and Conversion**: Functions for type checking and conversion.
- **Comments**: Supports block comments for better code documentation.

## Documentation
For detailed documentation, syntax, and examples, please check the [Wiki](https://github.com/PranavVerma-droid/Tidal/wiki).

## Syntax
The Sample Code Along with the Basic Syntax Can be Found in the [Code Examples](https://github.com/Tidal-Lang/Code-Examples) Repository.

## Development (Linux or WSL)

### Dependencies
Install all required dependencies with:
```bash
sudo make install
```

### Building
- Build for current platform (simplest): 
  ```bash
  make
  ```
- Build for specific platform:
  - Linux: `make linux`
  - Windows: `make windows`
  - macOS (ARM64/M1/M2): `make macos-arm`
  - macOS (Intel/x86_64): `make macos-x86`
- Build for all platforms: `make build-all`
- Clean build files: `make clean`

### Running (LINUX/WSL ONLY)
```bash
./td <FILENAME>.td
```

### Testing
```bash
make test
```

For a Detailed Guide, Please Check out the [For Developers](https://github.com/Tidal-Lang/Tidal/wiki/For-Developers) Page.



