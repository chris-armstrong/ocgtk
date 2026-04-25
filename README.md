# ocgtk - OCaml Bindings for GTK

This repository contains OCaml bindings for the GTK toolkit version 4

## Repository Structure

This repository is organized to support development of GTK 4 bindings:

```
lablgtk/
├── conf-gtk4/         # GTK 4 stub package
├── ocgtk/             # GTK 4 bindings (under active development)
```


### ocgtk - GTK 4 Bindings

**Status**: 🚧 Under active development
**Location**: [`ocgtk/`](ocgtk/)
**Documentation**: See [`ocgtk/README.md`](ocgtk/README.md)


#### Current Status

The bindings are under active development and rapidly approaching a stable release.

The following features are currently supported:
* Code generation from GIR files
* Bindings for GTK and its dependencies (GLib, GObject, Pango, Gdk, GdkPixbuf, GIO)
* Support for classes, interfaces, records, enumerations and bitfields
* Constructors, methods, properties and signals^[1]
* Direct C bindings and stubs ("Layer 1")
* OCaml-based class wrappers for GObject-based classes and records ("Layer 2")
* GObject interface implementation in the type hierarchy (`:>` coercions work)

Currently unsupported features:
* Signals with multiple parameters
* Standalone namespace-level functions (e.g. `gtk_show_uri`)
* Accessing fields of non-opaque record types
* Callbacks

^[1]: Only signals with no parameters are currently supported.


#### Quick Start (GTK 4)

```bash
cd ocgtk
opam install . --deps-only
dune build
```


## Comparison and relation to lablgtk

[lablgtk](https://github.com/garrique/lablgtk) is a GTK 3 bindings library for OCaml which served as the inspiration and some of the basis for this project. The main difference is that ocgtk uses generated bindings instead of manually written bindings. Although efforts have been made to generate code in a similar style, the APIs are different and not compatible.

## Requirements

- OCaml >= 5.3 
- GTK 4 >= 4.0 (bindings are generated up to 4.14.5 - older versions will throw runtime errors on unavailable APIs)
- Dune >= 3.13

## License

Copyright (C) 2025 Chris Armstrong, with some parts derived from lablgtk3 (see [LICENSE](LICENSE.md)).

This library is distributed under the terms of the GNU Library General Public License v2, with the special exception on linking described in the [LICENSE](LICENSE.md) file.

## Documentation

📚 **[Architecture](ocgtk/architecture)** - architecture and design documentation (mix of LLM and manually written)

### Key Documents

- **Development Setup**: [SETUP.md](SETUP.md)
- **Security Guidelines**: [SECURITY_GUIDELINES.md](SECURITY_GUIDELINES.md)
- **GIR Code Generation**: [gir_gen/docs/README_GIR_GEN.md](gir_gen/docs/README_GIR_GEN.md)
- **GIR Override Files**: [ocgtk/overrides/](ocgtk/overrides/) — per-namespace sexp files controlling entity ignores and version guards
- **CI / Distro Testing**: [ocgtk/architecture/ci_distro_testing.md](ocgtk/architecture/ci_distro_testing.md) — Docker-based multi-distro build and test (`./ci/oci`)

## Resources

- [GTK 4 Documentation](https://docs.gtk.org/gtk4/)
- [GTK 3 → 4 Migration Guide](https://docs.gtk.org/gtk4/migrating-3to4.html)

