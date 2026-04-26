# ocgtk Architecture

ocgtk generates OCaml bindings for GTK4 from GObject Introspection (GIR) files.

## Project Layout

```
<repo root>/
├── dune-workspace           # Spans ocgtk/ and gir_gen/
├── gir/                     # Bundled GIR data files (9 namespaces)
├── gir_gen/                 # Code generator (separate dune project)
│   ├── bin/                 # gir_gen executable entry point
│   ├── lib/                 # Generator library (generate/, parse/)
│   ├── test/                # Generator test suite
│   └── README.md            # Generator usage and status
└── ocgtk/                   # GTK bindings dune project
    ├── src/
    │   ├── common/          # Runtime: base classes, GObject system
    │   ├── cairo/           # Cairo bindings (handwritten + generated)
    │   ├── gdk/             # GDK bindings
    │   ├── gio/             # GIO bindings
    │   ├── graphene/        # Graphene bindings
    │   ├── gsk/             # GSK bindings
    │   ├── gtk/             # GTK4 bindings (main library)
    │   ├── pango/           # Pango bindings
    │   └── pangocairo/      # PangoCairo bindings
    └── docs/
        ├── code_guidelines/ # [Coding standards](./code_guidelines/index.md)
        └── testing/         # Test documentation
```

Generated code lives in `src/<namespace>/generated/`:
- `ml_*_gen.c` - C FFI stubs
- `*.ml`/`*.mli` - OCaml modules
- `<ns>_enums.ml` - Enums/bitfields
- `<ns>_decls.h` - C declarations
- `ocgtk_<ns>.ml` - Library wrapper

## gir_gen Architecture

### Pipeline

```
GIR XML          overrides/<ns>.sexp
    │                    │
    ▼                    ▼
parse/gir_parser.ml   override_parser.ml
    │                    │
    └──────── AST ───────┘
                  │
           override_apply.ml   (filter ignored entities, set versions)
                  │
                  ▼
           type_mappings.ml   (build generation context)
                  │
    ┌─────────────┼──────────────────┐
    ▼             ▼                  ▼
generate/     generate/         generate/
c_stubs.ml    layer1/*.ml       class_gen*.ml
(Layer 0: C)  (Layer 1: ML)     (Layer 2: ML)
    │             │                  │
    ▼             ▼                  ▼
ml_*_gen.c    widget.mli/ml     gWidget.ml
C stubs       External decls    OCaml classes
```

**Layer 3** (Signals): `generate/signal_gen.ml` produces `gWidget_signals` classes.

### Core Modules

| Module | Purpose |
|--------|---------|
| `types.ml` | AST for GIR elements (classes, methods, enums, records) |
| `parse/gir_parser.ml` | XML parsing → AST; reads `version` XML attrs on members/fields |
| `type_mappings.ml` | C→OCaml type mapping (`gint`→`int`, etc.) + cross-namespace resolution |
| `override_types.ml` | Override type definitions (ignore, version actions) |
| `override_parser.ml` | S-expression parser for `overrides/<ns>.sexp` files |
| `override_apply.ml` | Apply overrides to AST before ctx build (filter + version) |
| `dependency_analysis.ml` | Tarjan SCC for cyclic dependency handling |
| `filtering.ml` | Method/property filtering (out params, unknown types, varargs) |
| `exclude_list.ml` | Residual structural skips (`*Private` records, etc.) |

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

### Override System

Per-namespace override files (`ocgtk/overrides/<ns>.sexp`) configure what gets
generated without modifying the generator source. Applied in `override_apply.ml`
**before** the type-mapping context is built — ignored entities are absent from
`ctx`, so methods referencing them are naturally skipped by the existing
unknown-type filter in `filtering.ml`.

Two actions are supported:
- `(ignore)` — remove the entity/component entirely from all generation stages
- `(version "X.Y")` — set a version field, which feeds into `#if` C version guards

Version guards appear at two granularities:
- **Entity-level**: wraps the entire C converter/stub (`#if MACRO(X,Y,0)`)
- **Member-level**: wraps individual `case`/`else if` branches inside a converter

See [`gir_gen/overrides.md`](gir_gen/overrides.md) for the design rationale and
[`README_GIR_GEN.md`](../../gir_gen/README.md#override-system) for the file format.

### Cross-Namespace Types

Resolved via reference files (`_build/references/<ns>-references.sexp`):
- Classes/records: `Ocgtk_<ns>.<Ns>.Wrappers.<Module>.t`
- Enums/bitfields: `Ocgtk_<ns>.<Ns>.<enum_name>`

The `gir_gen references` command also accepts `-o <ns>.sexp` so ignored entities
are excluded from reference output.

## Key Documentation

- **[README_GIR_GEN.md](../../gir_gen/README.md)** - Complete generator usage and status
- **[FFI Guidelines](./FFI_GUIDELINES.md)** - OCaml/C binding best practices
- **[SECURITY_GUIDELINES.md](../SECURITY_GUIDELINES.md)** - Security for C bindings
- **[Code Guidelines](../docs/code_guidelines/index.md)** - OCaml coding standards
- **[CI Distro Testing](./ci_distro_testing.md)** - Docker-based multi-distro build/test setup
- **[Integer Type Design](./integer_type_design.md)** - Bounded integer wrapper types: rationale, design decisions, C macro layer
