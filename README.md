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
* Support for classes, records, enumerations and bitfields
* Constructors, methods, properties and signals^[1]
* Direct C bindings and stubs ("Layer 1")
* OCaml-based class wrappers for GObject-based classes and records ("Layer 2")

Currently unsupported features:
* No support for interfaces (and methods/properties/constructors that take them as parameters)
* Signals with multiple parameters
* Functions
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


### For GTK4
- OCaml >= 4.09
- GTK 4 >= 4.10
- Cairo 2
- Dune >= 3.0

## License

Copyright (C) 2025 Chris Armstrong, with some parts derived from lablgtk3 (see [LICENSE](LICENSE)).

This library is distributed under the terms of the GNU Library General Public License v2, with the special exception on linking described in the [LICENSE](LICENSE) file.

## Documentation

📚 **[Architecture](ocgtk/architecture)** - architecture and design documentation (mix of LLM and manually written)

### Key Documents

- **Development Setup**: [SETUP.md](SETUP.md)
- **Security Guidelines**: [SECURITY_GUIDELINES.md](SECURITY_GUIDELINES.md)
- **GIR Code Generation**: [ocgtk/src/tools/README_GIR_GEN.md](ocgtk/src/tools/README_GIR_GEN.md)

## Resources

- [GTK 4 Documentation](https://docs.gtk.org/gtk4/)
- [GTK 3 → 4 Migration Guide](https://docs.gtk.org/gtk4/migrating-3to4.html)

