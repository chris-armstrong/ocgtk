#!/usr/bin/env bash
# Run inside a CI container: builds both packages from the workspace root.
# Uses /build as the dune build directory (mounted as a named volume per distro).
set -euo pipefail

eval $(opam env)
cd /workspace
exec dune build --build-dir /build
