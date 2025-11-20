# GIR Code Generator (gir_gen)

GTK introspection-based code generator for LablGTK4 bindings.

## Building

```bash
# From lablgtk4 directory
dune build
```

The executable is built to `_build/default/src/tools/gir_gen.exe`

## Running

**Always run from the `lablgtk4` directory using `dune exec`:**

```bash
# Generate event controllers and widgets (recommended)
dune exec src/tools/gir_gen.exe -- -m all -f src/gtk4_controllers.controller \
  /usr/share/gir-1.0/Gtk-4.0.gir src


### Options

- `-m MODE`: `controllers`, `widgets`, or `all` (default: controllers)
- `-f FILE`: Filter file listing class names to generate (one per line)
- `GIR_FILE`: Path to GTK GIR file (usually `/usr/share/gir-1.0/Gtk-4.0.gir`)
- `OUTPUT_DIR`: Where to write generated files

## Testing

### Quick Test
```bash
# Generate test output
mkdir -p output/test
echo "Label" > output/test/filter.txt
dune exec src/tools/gir_gen.exe -- -m widgets -f output/test/filter.txt \
  /usr/share/gir-1.0/Gtk-4.0.gir output/test

# Verify files generated
ls output/test/label.mli output/test/ml_event_controllers_gen.c
```

### Verify C Compilation
```bash
# Check generated C compiles (headers only)
gcc -c output/test/ml_event_controllers_gen.c \
  -I$(ocamlc -where) $(pkg-config --cflags gtk4) \
  -fsyntax-only
```

### Full Rebuild
```bash
# Regenerate all src bindings and rebuild library
dune exec src/tools/gir_gen.exe -- -m all -f src/gtk4_controllers.controller \
  /usr/share/gir-1.0/Gtk-4.0.gir src
dune build src/lablgtk4.cma
```

## Output Files

- `ml_event_controllers_gen.c`: C FFI bindings for all classes
- `<class_name>.mli`: OCaml interface for each class (snake_case)
- `gtk_enums.mli`: Generated enum and bitfield types

## Common Issues

**Error: "Program 'src/tools/gir_gen.exe' not found"**
- Ensure you're in the `lablgtk4` directory
- Run `dune build` first

**Error: "Don't know how to build src/tools/gir_gen.exe"**
- Use `dune exec src/tools/gir_gen.exe` instead of `dune build src/tools/gir_gen.exe`
