# LablGTK - OCaml Bindings for GTK

This repository contains OCaml bindings for the GTK toolkit, supporting both GTK 3 and GTK 4.

## Repository Structure

This repository is organized to support parallel development of GTK 3 and GTK 4 bindings:

```
lablgtk/
├── lablgtk3/          # Stable GTK 3 bindings (maintenance mode)
├── lablgtk4/          # GTK 4 bindings (under active development)
├── port.md            # GTK 3 → GTK 4 migration plan
└── port-phase*.md     # Detailed migration phase documents
```

### LablGTK3 - GTK 3 Bindings

**Status**: Stable, maintenance mode
**Location**: [`lablgtk3/`](lablgtk3/)
**Documentation**: See [`lablgtk3/README.md`](lablgtk3/README.md)

The GTK 3 bindings are feature-complete and stable. Bug fixes and minor updates will continue, but major new development focuses on the GTK 4 port.

#### Quick Start (GTK 3)

```bash
cd lablgtk3
opam install . --deps-only
dune build
```

### LablGTK4 - GTK 4 Bindings

**Status**: 🚧 Under active development
**Location**: [`lablgtk4/`](lablgtk4/)
**Documentation**: See [`lablgtk4/README.md`](lablgtk4/README.md)

The GTK 4 bindings are being developed in phases. See [`port.md`](port.md) for the complete migration plan.

#### Current Status

**Phase 1: Foundation & Infrastructure** ✅ **COMPLETE**
- Repository reorganization ✅
- Build system setup ✅
- Code generation tools (varcc, propcc) ✅
- GTK 4 enumeration bindings ✅
- Testing infrastructure ✅

**Phase 2: Core Layer Migration** ✅ **COMPLETE**
- GLib module ✅
- GObject module (properties, signals, closures) ✅
- GdkPixbuf module ✅
- Gdk module (GdkWindow → GdkSurface) ✅
- Pango module ✅
- GdkClipboard (new API) ✅

**Phase 3: Base Widget Infrastructure** 🚧 **IN PROGRESS**
- Detailed specification: [`port-phase3.md`](port-phase3.md)
- Phase 3.0: Code generation infrastructure ✅ **COMPLETE**
  - GIR-based code generator (gir_gen) ✅
  - xmlm XML parser integration ✅
  - Test suite (2/2 tests passing) ✅
  - CI/CD integration ✅
- GtkWidget with GTK4 API (Pending)
- GtkSnapshot rendering system (Pending)
- Event controller bindings (Ready for generation)

#### Quick Start (GTK 4)

```bash
cd lablgtk4
opam install . --deps-only
dune build
```

## Migration Guide

If you're an existing LablGTK3 user interested in migrating to GTK 4:

1. Review the [migration plan](port.md) for an overview of changes
2. Follow the [detailed phase documents](port.md#detailed-phase-plans) for specific API changes
3. Check the [GTK 4 migration guide](https://docs.gtk.org/gtk4/migrating-3to4.html) for upstream changes

**Note**: GTK 4 introduces breaking API changes. Migration will require code updates. We recommend maintaining parallel GTK 3 and GTK 4 versions of applications during the transition.

## Development Approach

We're taking a **parallel development** approach:

- **lablgtk3** remains stable and available for existing applications
- **lablgtk4** is developed alongside as a separate package
- Both can coexist in the same opam environment
- This allows incremental migration and reduces risk

This approach was chosen because GTK 4 represents a complete API/ABI break from GTK 3, with fundamental changes to:
- Container system (GtkContainer/GtkBin removed)
- Event handling (signals → controllers)
- Drawing system (draw signal → snapshot vfunc)
- Many widget APIs

## Contributing

We welcome contributions! Areas where help is particularly valuable:

- **Testing**: Try the GTK 4 bindings and report issues
- **Examples**: Port GTK 3 examples to GTK 4
- **Documentation**: Improve migration guides and API docs
- **Widget Bindings**: Help implement GTK 4 widget bindings

See the [migration plan](port.md) for details on what needs to be done.

## Requirements

### For LablGTK3
- OCaml >= 4.09
- GTK 3 >= 3.18
- Cairo 2
- Dune >= 2.0

### For LablGTK4
- OCaml >= 4.09
- GTK 4 >= 4.10
- Cairo 2
- Dune >= 3.0

## License

This library is distributed under the terms of the GNU Library General Public License version 2.1, with the special exception on linking described in the [LICENSE](LICENSE) file.

## Documentation

📚 **[Complete Documentation Index](DOCUMENTATION_INDEX.md)** - Comprehensive guide to all project documentation

### Key Documents

- **Development Setup**: [SETUP.md](SETUP.md)
- **Migration Plan**: [port.md](port.md) and phase-specific documents
- **FFI Guidelines**: [FFI_GUIDELINES.md](FFI_GUIDELINES.md)
- **Security Guidelines**: [SECURITY_GUIDELINES.md](SECURITY_GUIDELINES.md)
- **Code Generation**: [lablgtk4/src/tools/README_GIR_GEN.md](lablgtk4/src/tools/README_GIR_GEN.md)

## Resources

- [GTK 3 Documentation](https://docs.gtk.org/gtk3/)
- [GTK 4 Documentation](https://docs.gtk.org/gtk4/)
- [GTK 3 → 4 Migration Guide](https://docs.gtk.org/gtk4/migrating-3to4.html)
- [LablGTK GitHub](https://github.com/chris-armstrong/lablgtk)
- [LablGTK Mailing List](mailto:lablgtk@math.nagoya-u.ac.jp)

## Project History

LablGTK was originally created by Jacques Garrigue and has been maintained by the OCaml community for over two decades. This GTK 4 migration ensures LablGTK remains relevant for modern GUI development in OCaml.
