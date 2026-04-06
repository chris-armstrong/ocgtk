#!/usr/bin/env bash
# Run inside a CI container: builds the project.
# Uses /build as the dune build directory (mounted as a named volume per distro).
set -euo pipefail

eval $(opam env)
cd /workspace/ocgtk
exec dune build --build-dir /build
