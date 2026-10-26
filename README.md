# ocgtk - OCaml Bindings for GTK

This repository contains OCaml bindings for the GTK toolkit version 4

## Packages

Each library is its own opam package and dune library:

| Package | Main module | Binds |
|---|---|---|
| [`ocglib`](ocglib/) | `Ocglib` | GLib and GObject (hand-written) |
| [`occairo`](occairo/) | `Occairo` | Cairo's GObject types |
| [`ocgio`](ocgio/) | `Ocgio` | GIO |
| [`ocgraphene`](ocgraphene/) | `Ocgraphene` | Graphene |
| [`ocgdkpixbuf`](ocgdkpixbuf/) | `Ocgdkpixbuf` | GdkPixbuf |
| [`ocpango`](ocpango/) | `Ocpango` | Pango |
| [`ocpangocairo`](ocpangocairo/) | `Ocpangocairo` | PangoCairo |
| [`ocgdk`](ocgdk/) | `Ocgdk` | GDK 4 |
| [`ocgsk`](ocgsk/) | `Ocgsk` | GSK 4 |
| [`ocgtk`](ocgtk/) | `Ocgtk` | GTK 4 |

A class is `Ocgtk.Button`, its C externals are `Ocgtk.Raw.Button`, and
enums are under `Ocgtk.Enums`; every package has the same shape.

**The `ocgtk` package changed meaning after `0.1~preview2`.** In
`0.1~preview2` it was the umbrella for every library (`ocgtk.gtk`,
`ocgtk.gio`, ...); now it is Gtk only, and the other libraries are the
packages above. [MIGRATION.md](MIGRATION.md) maps every old module path to
its new one.

## Repository Structure

```
<repo root>/
├── dune-project       # Declares every package above
├── ocglib/ ... ocgtk/ # One directory per package (generated/, raw/, enums/, tests/)
├── conf-*/            # conf packages for the C libraries (not yet in opam-repository)
├── configurator/      # pkg-config helper used by every package's build
├── overrides/         # Per-namespace GIR override files for the generator
├── gir/               # Bundled GIR data files (9 namespaces)
├── gir_gen/           # GIR code generator (separate dune project, OCaml >= 5.3)
├── ci/                # Docker-based multi-distro CI scripts
└── scripts/           # Helper scripts (e.g. generate-bindings.sh)
```

- **[`gir_gen/`](gir_gen/)** — reads GIR XML files and generates OCaml/C FFI bindings. Only needed when regenerating bindings; not a runtime dependency of any package.
- **[`ocgtk/`](ocgtk/)** — the GTK 4 package, with the examples in [`ocgtk/examples/`](ocgtk/examples/).

## Status

The bindings are under active development and rapidly approaching a stable release.

Features currently supported:
* Bindings for GTK and its dependencies (GLib, GObject, Pango, Gdk, GdkPixbuf, GIO)
* Classes, interfaces, records, enumerations and bitfields
* Constructors, methods, properties and signals^[1]
* GObject interface implementation in the type hierarchy (`:>` coercions work)

Currently unsupported:
* Signals with boxed record parameters (e.g. `GtkTextIter`, `GdkRGBA`) or callback parameters
* Standalone namespace-level functions (e.g. `gtk_show_uri`)
* Accessing fields of non-opaque record types
* Callbacks as method parameters

^[1]: Signals with primitive, enum, bitfield, and GObject class/interface parameters are generated, including primitive/boolean return values. Signals with boxed record types (e.g. `GtkTextIter`, `GdkRGBA`), `GArray` parameters, callbacks, non-In direction parameters, or the generic `GObject.Object` meta-type are not yet generated. Detailed signals (`notify::property-name`) are deferred. Per-namespace counts are tracked in `gir_gen/test/corpus/signal_corpus_baseline.sexp`.

## Quick Start

Install system dependencies (Ubuntu/Debian):

```bash
sudo apt-get install libgtk-4-dev libcairo2-dev
```

Install OCaml dependencies and build:

```bash
# Our conf packages are not in opam-repository yet: pin them first
for p in conf-*/; do opam pin add -n -y "${p%/}" "./$p"; done

# To use the bindings only (OCaml >= 5.0):
opam install . --deps-only --with-test

# Also install the code generator (OCaml >= 5.3):
opam install . ./gir_gen --deps-only --with-test

dune build
```


## Comparison and relation to lablgtk

[lablgtk](https://github.com/garrique/lablgtk) is a GTK 3 bindings library for OCaml which served as the inspiration and some of the basis for this project. The main difference is that ocgtk uses generated bindings instead of manually written bindings. Although efforts have been made to generate code in a similar style, the APIs are different and not compatible.

## Requirements

- OCaml >= 5.0 (ocgtk); >= 5.3 (gir_gen code generator)
- GTK 4 >= 4.0 (bindings are generated up to 4.14.5 — older versions will throw runtime errors on unavailable APIs)
- Dune >= 3.13

## License

Copyright (C) 2025 Chris Armstrong, with some parts derived from lablgtk3 (see [LICENSE](LICENSE)).

This library is distributed under the terms of the GNU Library General Public License v2, with the special exception on linking described in the [LICENSE](LICENSE) file.

## Documentation

📚 **[Architecture](architecture)** - architecture and design documentation (mix of LLM and manually written)

### Key Documents

- **Development Setup**: [CONTRIBUTORS.md](CONTRIBUTORS.md)
- **Security Guidelines**: [architecture/FFI_GUIDELINES.md](architecture/FFI_GUIDELINES.md)
- **GIR Code Generation**: [gir_gen/README.md](gir_gen/README.md)
- **Migrating from 0.1~preview2**: [MIGRATION.md](MIGRATION.md)
- **GIR Override Files**: [overrides/](overrides/) — per-namespace sexp files controlling entity ignores and version guards
- **CI / Distro Testing**: [architecture/ci_distro_testing.md](architecture/ci_distro_testing.md) — Docker-based multi-distro build and test (`./ci/oci`)

## Resources

- [GTK 4 Documentation](https://docs.gtk.org/gtk4/)
- [GTK 3 → 4 Migration Guide](https://docs.gtk.org/gtk4/migrating-3to4.html)

## Sponsorship

This project has been generously sponsored via a grant from [Ahrefs](https://ahrefs.com/). 

