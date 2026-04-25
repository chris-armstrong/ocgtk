# ocgtk - OCaml Bindings for GTK

This repository contains OCaml bindings for the GTK toolkit version 4

## Repository Structure

```
<repo root>/
├── gir/               # Bundled GIR data files (9 namespaces)
├── gir_gen/           # GIR code generator (standalone dune project, OCaml >= 5.3)
├── ocgtk/             # GTK 4 bindings (dune project, OCaml >= 5.0)
├── ci/                # Docker-based multi-distro CI scripts
└── scripts/           # Helper scripts (e.g. generate-bindings.sh)
```

- **[`gir_gen/`](gir_gen/)** — reads GIR XML files and generates OCaml/C FFI bindings. Only needed when regenerating bindings; not a runtime dependency of `ocgtk`.
- **[`ocgtk/`](ocgtk/)** — the GTK 4 binding library itself. Depends only on GTK system libraries.

## Status

The bindings are under active development and rapidly approaching a stable release.

Features currently supported:
* Bindings for GTK and its dependencies (GLib, GObject, Pango, Gdk, GdkPixbuf, GIO)
* Classes, interfaces, records, enumerations and bitfields
* Constructors, methods, properties and signals^[1]
* GObject interface implementation in the type hierarchy (`:>` coercions work)

Currently unsupported:
* Signals with multiple parameters
* Standalone namespace-level functions (e.g. `gtk_show_uri`)
* Accessing fields of non-opaque record types
* Callbacks

^[1]: Only signals with no parameters are currently supported.

## Quick Start

Install system dependencies (Ubuntu/Debian):

```bash
sudo apt-get install libgtk-4-dev libcairo2-dev
```

Install OCaml dependencies and build:

```bash
# To use the bindings only (OCaml >= 5.0):
opam install ./ocgtk --deps-only --with-test

# Also install the code generator (OCaml >= 5.3):
opam install ./ocgtk ./gir_gen --deps-only --with-test

dune build
```


## Comparison and relation to lablgtk

[lablgtk](https://github.com/garrique/lablgtk) is a GTK 3 bindings library for OCaml which served as the inspiration and some of the basis for this project. The main difference is that ocgtk uses generated bindings instead of manually written bindings. Although efforts have been made to generate code in a similar style, the APIs are different and not compatible.

## Requirements

- OCaml >= 5.0 (ocgtk); >= 5.3 (gir_gen code generator)
- GTK 4 >= 4.0 (bindings are generated up to 4.14.5 — older versions will throw runtime errors on unavailable APIs)
- Dune >= 3.13

## License

Copyright (C) 2025 Chris Armstrong, with some parts derived from lablgtk3 (see [LICENSE](LICENSE.md)).

This library is distributed under the terms of the GNU Library General Public License v2, with the special exception on linking described in the [LICENSE](LICENSE.md) file.

## Documentation

📚 **[Architecture](ocgtk/architecture)** - architecture and design documentation (mix of LLM and manually written)

### Key Documents

- **Development Setup**: [SETUP.md](SETUP.md)
- **Security Guidelines**: [SECURITY_GUIDELINES.md](SECURITY_GUIDELINES.md)
- **GIR Code Generation**: [gir_gen/README.md](gir_gen/README.md)
- **GIR Override Files**: [ocgtk/overrides/](ocgtk/overrides/) — per-namespace sexp files controlling entity ignores and version guards
- **CI / Distro Testing**: [ocgtk/architecture/ci_distro_testing.md](ocgtk/architecture/ci_distro_testing.md) — Docker-based multi-distro build and test (`./ci/oci`)

## Resources

- [GTK 4 Documentation](https://docs.gtk.org/gtk4/)
- [GTK 3 → 4 Migration Guide](https://docs.gtk.org/gtk4/migrating-3to4.html)

