# LablGTK4

OCaml bindings for GTK 4.

## Status

🚧 **Under Development** - This is a work-in-progress port of LablGTK to GTK 4.

For the stable GTK 3 bindings, see the `lablgtk3/` directory.

## Building

### Prerequisites

- OCaml >= 4.09
- GTK 4 >= 4.10
- Cairo 2
- Dune >= 3.0

### Installation

```bash
opam install . --deps-only
dune build
```

## Migration from GTK 3

See the [migration plan](../port.md) for details on the GTK 3 → GTK 4 transition.

## Documentation

### Project Documentation

- 📚 **[Complete Documentation Index](../DOCUMENTATION_INDEX.md)** - All project documentation
- **Code Generation**: [src/tools/README_GIR_GEN.md](src/tools/README_GIR_GEN.md) - GIR code generator
- **FFI Guidelines**: [../FFI_GUIDELINES.md](../FFI_GUIDELINES.md) - C binding best practices
- **Security Guidelines**: [../SECURITY_GUIDELINES.md](../SECURITY_GUIDELINES.md) - Security requirements

### External Documentation

- [GTK 4 Documentation](https://docs.gtk.org/gtk4/) - Underlying GTK 4 API
- [GTK 3 → 4 Migration Guide](https://docs.gtk.org/gtk4/migrating-3to4.html) - Upstream migration guide

## License

This library is distributed under the terms of the GNU Library General Public License version 2.1, with the special exception on linking described in file LICENSE.
