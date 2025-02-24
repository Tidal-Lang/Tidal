# Tidal
https://tidal.pranavv.site

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
- Rust
- Cargo Toolchain (For Windows, Linux, and MacOS)

Install all dependencies with these commands:
```bash
chmod +x scripts/install.sh
./scripts/install.sh
```

### Compile
For all platforms (from Linux):
```bash
chmod +x scripts/build-all.sh
./scripts/build-all.sh
```

**Note:** Cross-compilation for macOS requires building on macOS directly due to SDK requirements. To Build Anyway, Use the Following Command:
```bash
BUILD_MACOS=true ./scripts/build-all.sh
```

### Run
```./td <FILENAME.td>```

OR 

```./td <FILENAME.br>```

For a Detailed Guide, Please Check out the [For Developers](https://github.com/Tidal-Lang/Tidal/wiki/For-Developers) Page.



