# ocgtk Architecture

ocgtk generates OCaml bindings for GTK4 from GObject Introspection (GIR) files.

## Project Layout

```
ocgtk/
├── src/
│   ├── common/              # Runtime: base classes, GObject system
│   ├── cairo/               # Cairo bindings (handwritten + generated)
│   ├── gdk/                 # GDK bindings
│   ├── gio/                 # GIO bindings
│   ├── graphene/            # Graphene bindings
│   ├── gsk/                 # GSK bindings
│   ├── gtk/                 # GTK4 bindings (main library)
│   ├── pango/               # Pango bindings
│   ├── pangocairo/          # PangoCairo bindings
│   └── tools/
│       ├── gir_gen/         # Code generator
│       └── test_gir_gen/    # Generator tests
└── docs/
    ├── code_guidelines/     # [Coding standards](./code_guidelines/index.md)
    └── testing/             # Test documentation

```

Generated code lives in `src/<namespace>/generated/`:
- `ml_*_gen.c` - C FFI stubs
- `*.ml`/`*.mli` - OCaml modules
- `<ns>_enums.ml` - Enums/bitfields
- `<ns>_decls.h` - C declarations
- `ocgtk_<ns>.ml` - Library wrapper

## gir_gen Architecture

### Pipeline (4 Layers)

```
GIR XML
    │
    ├─► parse/gir_parser.ml ──► types.ml (AST)
    │                              │
    │                              ▼
    │                       type_mappings.ml
    │                              │
    ├──────────────────────────────┼──────────────────────────────┐
    ▼                              ▼                              ▼
generate/                  generate/                       generate/
c_stubs.ml                 layer1/*.ml                     class_gen*.ml
(Layer 0: C FFI)           (Layer 1: Low-level ML)         (Layer 2: High-level)
    │                              │                              │
    ▼                              ▼                              ▼
ml_*_gen.c                widget.mli/ml                   gWidget.ml
C stubs                   External functions              OCaml classes
```

**Layer 3** (Signals): `generate/signal_gen.ml` produces `gWidget_signals` classes.

### Core Modules

| Module | Purpose |
|--------|---------|
| `types.ml` | AST for GIR elements (classes, methods, enums, records) |
| `parse/gir_parser.ml` | XML parsing → AST |
| `type_mappings.ml` | C→OCaml type mapping (`gint`→`int`, etc.) + cross-namespace resolution |
| `dependency_analysis.ml` | Tarjan SCC for cyclic dependency handling |
| `filtering.ml` | Method/property filtering (out params, unknown types) |
| `exclude_list.ml` | Platform-specific skips, variadic functions |

### Generation Modules

**C Stubs (`generate/`)**:
- `c_stubs.ml` - Main C code orchestration
- `c_stub_method.ml` - Method wrappers
- `c_stub_property.ml` - Property GValue access
- `c_stub_enum.ml`/`c_stub_bitfield.ml` - Enum converters
- `c_stub_record.ml` - Boxed record converters
- `c_stub_class.ml` - Class type macros
- `<ns>_decls.h` - Per-library declaration headers

**Layer 1 (`generate/layer1/`)**:
- `layer1_main.ml` - Polymorphic variant types, module generation
- `layer1_method.ml` - External declarations
- `layer1_property.ml` - Property accessors
- `layer1_constructor.ml` - Constructor externals
- Combined modules for cyclic dependencies: `<c1>_and__<c2>.ml`

**Layer 2 (`generate/class_gen*.ml`)**:
- `class_gen.ml` - Main wrapper orchestration
- `class_gen_body.ml` - Skeleton/concrete classes
- `class_gen_method.ml` - Method wrappers
- `class_gen_property.ml` - Property methods
- `class_gen_type_resolution.ml` - Cross-namespace type handling

**Other**:
- `signal_gen.ml` - Signal handler classes (parameterless void only)
- `enum_code.ml` - Enum/bitfield type definitions
- `dune_file.ml` - Build configuration generation
- `library_module.ml` - Combined library module (`Gtk.ml`)

### Dependency Resolution

Cyclic dependencies (e.g., `Application` ↔ `Window`) are combined into single modules:
- Tarjan's SCC algorithm identifies cycles
- Generates `application_and__window_and__window_group.ml`
- Type references: simple names within cycle (`Window.t`), qualified across cycles

### Cross-Namespace Types

Resolved via reference files (`<ns>_refs.txt`):
- Classes/records: `Ocgtk_<ns>.<Ns>.Wrappers.<Module>.t`
- Enums/bitfields: `Ocgtk_<ns>.<Ns>.<enum_name>`

## Key Documentation

- **[README_GIR_GEN.md](../src/tools/README_GIR_GEN.md)** - Complete generator usage and status
- **[FFI Guidelines](./FFI_GUIDELINES.md)** - OCaml/C binding best practices
- **[SECURITY_GUIDELINES.md](../SECURITY_GUIDELINES.md)** - Security for C bindings
- **[Code Guidelines](../docs/code_guidelines/index.md)** - OCaml coding standards
