# LablGTK Development Environment Setup

Quick setup instructions for getting the lablgtk development environment running.

## Prerequisites

This guide assumes you're working in a Linux environment (Ubuntu/Debian-based).

## Setup Steps

### 1. Download and Install Opam

```bash
# Download opam 2.4.1 binary
cd ~
curl -L https://github.com/ocaml/opam/releases/download/2.4.1/opam-2.4.1-x86_64-linux -o opam-2.4.1-x86_64-linux

# Make it executable and create symlink
chmod +x opam-2.4.1-x86_64-linux
sudo ln -sf ~/opam-2.4.1-x86_64-linux /usr/local/bin/opam

# Verify installation
opam --version
```

### 2. Initialize Opam

```bash
# Initialize opam (disable sandboxing if running as root or in container)
opam init --disable-sandboxing -y

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
```

#### For LablGTK4:
```bash
cd ../lablgtk4
opam install cairo2 dune -y
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

```bash
# Navigate to project directory
cd /home/user/lablgtk

# Download and install opam
cd ~
curl -L https://github.com/ocaml/opam/releases/download/2.4.1/opam-2.4.1-x86_64-linux -o opam-2.4.1-x86_64-linux
chmod +x opam-2.4.1-x86_64-linux
sudo ln -sf ~/opam-2.4.1-x86_64-linux /usr/local/bin/opam

# Initialize opam
opam init --disable-sandboxing -y
eval $(opam env)

# Install system dependencies (GTK 3 + GTK 4)
sudo apt-get update
sudo apt-get install -y \
    libgtk-3-dev \
    libgtk-4-dev \
    libcairo2-dev \
    libpango1.0-dev \
    libgdk-pixbuf2.0-dev \
    libgtksourceview-3.0-dev \
    libgtkspell3-3-dev \
    librsvg2-dev \
    libgoocanvas-2.0-dev

# Install OCaml dependencies for lablgtk3
cd /home/user/lablgtk/lablgtk3
opam install . --deps-only --with-test -y

# Install OCaml dependencies for lablgtk4
cd /home/user/lablgtk/lablgtk4
opam install cairo2 dune -y

# Verify builds
cd /home/user/lablgtk/lablgtk3
eval $(opam env)
dune build

cd /home/user/lablgtk/lablgtk4
eval $(opam env)
dune build

echo "Setup complete! Both lablgtk3 and lablgtk4 should build successfully."
```

## Troubleshooting

### "opam: command not found"
Ensure `/usr/local/bin` is in your PATH:
```bash
export PATH="/usr/local/bin:$PATH"
```

### "dune: command not found"
Make sure you've run `eval $(opam env)` in your current shell:
```bash
eval $(opam env)
```

### Permission errors
If running as root, use `--disable-sandboxing` flag with opam commands.

### Build warnings
The lablgtk3 build may show deprecation warnings from GTK 3 - these are expected and non-fatal.

## Environment Variables

For each new shell session, remember to run:
```bash
eval $(opam env)
```

Or add this to your shell profile (~/.bashrc or ~/.zshrc):
```bash
eval $(opam env --switch=default)
```

## Current Branch

The Phase 1 work is on branch: `claude/phase1-repository-setup-011CV4cFyYNnCvrBhir8NeAg`

```bash
git checkout claude/phase1-repository-setup-011CV4cFyYNnCvrBhir8NeAg
```
