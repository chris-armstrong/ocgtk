#!/usr/bin/env bash
# Run inside a CI container: runs both test suites from the workspace root.
# gir_gen tests run directly; ocgtk tests run under Xvfb for GTK display.
set -euo pipefail

eval $(opam env)
cd /workspace
dune test gir_gen/ --build-dir /build
exec xvfb-run dune test ocgtk/ --build-dir /build
