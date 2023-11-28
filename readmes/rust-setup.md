> the following guide demonstrates how to install rust/cargo on linux

# Install Rustup and Cargo

Go [here](https://rustup.rs/) and do what it says to install `rustup`. This will give you the Cargo build tool (`cargo`) and the Rust compiler (`rustc`). You will also get `rustup`, a command line utility that you can use to install to different compiler versions.

- Rustup metadata and toolchains will be installed into the Rustup home directory, located at: `$HOME/.rustup`
- Cargo home dir is located at `$HOME/.cargo`
- The cargo, rustc, rustup and other commands will be added to Cargo's bin directory, located at: `$HOME/.cargo/bin`
- This path will then be added to your PATH environment variable by modifying the profile files located at: `$HOME/.bashrc`

# Configure Rust

After installing Rust, you should configure your editor or IDE to work with Rust. Most editors do this by talking to [rust-analyzer](https://rust-analyzer.github.io/), which provides auto-completion and jump-to-definition functionality for VS Code

# The Rust Ecosystem

The Rust ecosystem consists of a number of tools, of which the main ones are:

- `rustc`: the Rust compiler which turns `.rs` files into binaries and other intermediate formats.
- `cargo`: the Rust dependency manager and build tool. Cargo knows how to download dependencies, usually hosted on https://crates.io, and it will pass them to `rustc` when building your project. Cargo also comes with a built-in test runner which is used to execute unit tests.
- `rustup`: the Rust toolchain installer and updater. This tool is used to install and update `rustc` and `cargo` when new versions of Rust is released. In addition, `rustup` can also download documentation for the standard library. You can have multiple versions of Rust installed at once and `rustup` will let you switch between them as needed.

# Install a C compiler

On linux you probalby already have `build-essential` installed, but its good to make sure
```
sudo apt update && sudo apt install build-essential
```


# Updating Rust
```
rustup update
```

# Uninstall Rust and Rustup
```
rustup self uninstall
```
