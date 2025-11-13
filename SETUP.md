# LablGTK Development Environment Setup

Quick setup instructions for getting the lablgtk development environment running.

## Prerequisites

This guide assumes you're working in a Linux environment (Ubuntu/Debian-based).

**Note**: If you encounter permission errors with `sudo`, you may be running in a restricted environment. See the "Running as Root" section below for alternative commands.

## Setup Steps

### 1. Download and Install Opam

```bash
# Download opam 2.4.1 binary
cd ~
curl -L https://github.com/ocaml/opam/releases/download/2.4.1/opam-2.4.1-x86_64-linux -o opam-2.4.1-x86_64-linux
chmod +x opam-2.4.1-x86_64-linux

# Option A: Install to /usr/local/bin (requires sudo)
sudo ln -sf ~/opam-2.4.1-x86_64-linux /usr/local/bin/opam

# Option B: Install to ~/bin (no sudo required)
mkdir -p ~/bin
ln -sf ~/opam-2.4.1-x86_64-linux ~/bin/opam
export PATH="$HOME/bin:$PATH"

# Verify installation
opam --version
```

### 2. Initialize Opam

```bash
# Initialize opam (disable sandboxing if running as root or in container)
opam init --disable-sandboxing -y --bare

# Create OCaml switch with 5.3.0
opam switch create default ocaml-base-compiler.5.3.0 -y

# Configure shell environment
eval $(opam env)
```

### 3. Install System Dependencies

#### For LablGTK3 (GTK 3):
```bash
sudo apt-get update
sudo apt-get install -y \
    libgtk-3-dev \
    libcairo2-dev \
    libpango1.0-dev \
    libgdk-pixbuf2.0-dev \
    libgtksourceview-3.0-dev \
    libgtkspell3-3-dev \
    librsvg2-dev \
    libgoocanvas-2.0-dev
```

#### For LablGTK4 (GTK 4):
```bash
sudo apt-get update
sudo apt-get install -y \
    libgtk-4-dev \
    libcairo2-dev \
    libpango1.0-dev \
    libgdk-pixbuf-2.0-dev
```

### 4. Install OCaml Dependencies

#### For LablGTK3:
```bash
cd lablgtk3
opam install . --deps-only --with-test -y

# Install camlp5 (required for code generation)
opam install camlp5 -y
```

#### For LablGTK4:
```bash
cd ../lablgtk4
opam install cairo2 dune alcotest -y
```

### 5. Verify Builds

#### Build LablGTK3:
```bash
cd ~/lablgtk/lablgtk3
eval $(opam env)
dune build
```

#### Build LablGTK4:
```bash
cd ~/lablgtk/lablgtk4
eval $(opam env)
dune build
```

## Quick Setup (All-in-One Script)

For a brand new environment, you can run all commands at once:

### Standard Environment (with sudo)

```bash
# Navigate to project directory
cd /home/user/lablgtk

# Download and install opam
cd ~
curl -L https://github.com/ocaml/opam/releases/download/2.4.1/opam-2.4.1-x86_64-linux -o opam-2.4.1-x86_64-linux
chmod +x opam-2.4.1-x86_64-linux
sudo ln -sf ~/opam-2.4.1-x86_64-linux /usr/local/bin/opam

# Initialize opam
opam init --disable-sandboxing -y --bare
opam switch create default ocaml-base-compiler.5.3.0 -y
eval $(opam env)

# Install system dependencies (GTK 3 + GTK 4)
sudo apt-get update
sudo apt-get install -y \
    libgtk-3-dev \
    libgtk-4-dev \
    libcairo2-dev \
    libpango1.0-dev \
    libgdk-pixbuf2.0-dev \
    libgdk-pixbuf-2.0-dev \
    libgtksourceview-3.0-dev \
    libgtkspell3-3-dev \
    librsvg2-dev \
    libgoocanvas-2.0-dev

# Install OCaml dependencies for lablgtk3
cd /home/user/lablgtk/lablgtk3
opam install . --deps-only --with-test -y
opam install camlp5 -y

# Install OCaml dependencies for lablgtk4
cd /home/user/lablgtk/lablgtk4
opam install cairo2 dune alcotest -y

# Verify builds
cd /home/user/lablgtk/lablgtk3
eval $(opam env)
dune build

cd /home/user/lablgtk/lablgtk4
eval $(opam env)
dune build

echo "Setup complete! Both lablgtk3 and lablgtk4 should build successfully."
```

### Container/Root Environment (without sudo)

```bash
# Fix /tmp permissions first
chmod 1777 /tmp

# Download and install opam
cd ~
curl -L https://github.com/ocaml/opam/releases/download/2.4.1/opam-2.4.1-x86_64-linux -o opam-2.4.1-x86_64-linux
chmod +x opam-2.4.1-x86_64-linux
mkdir -p ~/bin
ln -sf ~/opam-2.4.1-x86_64-linux ~/bin/opam
export PATH="$HOME/bin:$PATH"

# Initialize opam
opam init --disable-sandboxing -y --bare
opam switch create default ocaml-base-compiler.5.3.0 -y
eval $(opam env)

# Install system dependencies (GTK 3 + GTK 4)
apt-get update
apt-get install -y \
    libgtk-3-dev \
    libgtk-4-dev \
    libcairo2-dev \
    libpango1.0-dev \
    libgdk-pixbuf2.0-dev \
    libgdk-pixbuf-2.0-dev \
    libgtksourceview-3.0-dev \
    libgtkspell3-3-dev \
    librsvg2-dev \
    libgoocanvas-2.0-dev \
    xdot \
    libpcre2-dev \
    m4 \
    perl \
    bash \
    which

# Install OCaml dependencies for lablgtk3
cd /home/user/lablgtk/lablgtk3
opam install . --deps-only --with-test -y
opam install camlp5 -y

# Install OCaml dependencies for lablgtk4
cd /home/user/lablgtk/lablgtk4
opam install cairo2 dune alcotest -y

# Verify builds
cd /home/user/lablgtk/lablgtk3
eval $(opam env)
dune build

cd /home/user/lablgtk/lablgtk4
eval $(opam env)
dune build

echo "Setup complete! Both lablgtk3 and lablgtk4 should build successfully."
```

## Running as Root (Docker/Container Environments)

If you're in a restricted environment where `sudo` doesn't work, you'll need to run commands differently:

### Fix /tmp Permissions

```bash
# If you see apt-get errors about temporary files, fix /tmp permissions:
chmod 1777 /tmp
```

### Install System Dependencies

```bash
# Fix tmp first
chmod 1777 /tmp

# Then install dependencies (no sudo)
apt-get update
apt-get install -y \
    libgtk-3-dev \
    libgtk-4-dev \
    libcairo2-dev \
    libpango1.0-dev \
    libgdk-pixbuf2.0-dev \
    libgdk-pixbuf-2.0-dev \
    libgtksourceview-3.0-dev \
    libgtkspell3-3-dev \
    librsvg2-dev \
    libgoocanvas-2.0-dev \
    xdot \
    libpcre2-dev \
    m4 \
    perl \
    bash \
    which
```

### Setup Opam Without Sudo

```bash
# Use ~/bin installation method
mkdir -p ~/bin
ln -sf ~/opam-2.4.1-x86_64-linux ~/bin/opam
export PATH="$HOME/bin:$PATH"
```

## Troubleshooting

### "opam: command not found"
Ensure `~/bin` is in your PATH:
```bash
export PATH="$HOME/bin:$PATH"
# Or if installed to /usr/local/bin:
export PATH="/usr/local/bin:$PATH"
```

### "dune: command not found"
Make sure you've run `eval $(opam env)` in your current shell:
```bash
eval $(opam env)
```

### Permission errors with apt-get
If you see "Couldn't create temporary file" errors:
```bash
chmod 1777 /tmp
```

### Permission errors with opam
If running as root, use `--disable-sandboxing` flag with opam commands.

### Build warnings
The lablgtk3 build may show deprecation warnings from GTK 3 - these are expected and non-fatal.

### Missing camlp5
If lablgtk3 build fails with "camlp5o: command not found":
```bash
opam install camlp5 -y
```

### Missing alcotest
If lablgtk4 tests fail to build:
```bash
opam install alcotest -y
```

## Environment Variables

For each new shell session, remember to run:
```bash
eval $(opam env)
```

Or add this to your shell profile (~/.bashrc or ~/.zshrc):
```bash
eval $(opam env --switch=default)
```

