#!/usr/bin/env bash
# Run inside a CI container: builds then runs the test suite under Xvfb.
set -euo pipefail

eval $(opam env)
cd /workspace/ocgtk
exec xvfb-run dune runtest --build-dir /build
