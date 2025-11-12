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

See the [GTK 4 documentation](https://docs.gtk.org/gtk4/) for the underlying GTK 4 API.

## License

This library is distributed under the terms of the GNU Library General Public License version 2.1, with the special exception on linking described in file LICENSE.
