# Refactoring Plan: Multi-Library Support for lablgtk4

## Goal
Restructure the lablgtk4 library to support multiple GObject-based libraries (Gtk, Gdk, Gio, etc.) by:
1. Separating hand-written common code from generated code
2. Organizing generated code by library namespace
3. Creating sub-libraries within the `lablgtk4` package

## TODO List

### Completed
- [x] Phase 1: Create Directory Structure (2025-12-18)
  - [x] Create src/common/ directory
  - [x] Create src/gtk/core/ directory
  - [x] Create src/gtk/generated/ directory
- [x] Phase 2: Move Common Hand-Written Code (2025-12-18)
  - [x] Move C files to src/common/ (wrappers.c, ml_glib.c, ml_gobject.c)
  - [x] Move OCaml files to src/common/ (gaux.ml, gpointer.ml, gError.ml, gobject.ml, glib.ml)
  - [x] Create src/common/dune file
- [x] Phase 3: Move Gtk Hand-Written Core Code (2025-12-18)
  - [x] Move C files to src/gtk/core/ (ml_gtk.c, ml_gtk_snapshot.c, ml_event_controller.c, ml_pango.c, ml_gdk.c, ml_gdkpixbuf.c, ml_gdk_clipboard.c)
  - [x] Move C headers to src/gtk/core/ (ml_gdk.h, ml_pango.h)
  - [x] Move OCaml files to src/gtk/core/ (gtk.ml/mli, gMain.ml/mli, gdk.ml/mli, pango.ml/mli, gdkPixbuf.ml/mli, gdkClipboard.ml/mli)
  - [x] Move interface files to src/common/ (gError.mli, glib.mli, gobject.mli)
  - [x] Quick fix: Create temporary src/gtk/core/dune and update src/dune to restore build
- [x] Phase 4: Update gir_gen to Support Output Directories (2025-12-18)
  - [x] Add helper function `generated_output_dir` to get generated/ subdirectory
  - [x] Add `ensure_generated_dir` to create generated/ directory
  - [x] Update all file generation functions to write to generated/ subdirectory
  - [x] Update dune_file.ml to reference correct paths (../../cflag-gtk4.sexp)
  - [x] Move dune-generated.inc generation to generated/ directory
  - [x] Rebuild gir_gen successfully
  - [x] Validate: Run gir_gen and verify generated/ directory structure
  - [x] Validate: Confirm dune-generated.inc has correct relative paths

### In Progress
- [ ] Phase 5: Create src/gtk/dune
- [ ] Phase 6: Update Main src/dune
- [ ] Phase 7: Update Generated dune-generated.inc
- [ ] Phase 8: Update gir_gen Invocation
- [ ] Phase 9: Testing and Validation
- [ ] Phase 10: Future Extensions (Gdk, Gio, Pango)

## Current Structure

```
lablgtk4/src/
├── dune                           # Main library definition
├── dune-generated.inc             # Generated C stub list
├── *.ml, *.mli                    # Mix of hand-written and generated
├── ml_*_gen.c                     # Generated C stubs
├── wrappers.c, ml_glib.c, etc.    # Hand-written C stubs
└── tools/gir_gen/                 # Code generator
```

### File Categories (Current)
1. **Hand-written common code** (library-agnostic):
   - C stubs: `wrappers.c`, `ml_glib.c`, `ml_gobject.c`
   - OCaml: `gaux.ml`, `gpointer.ml`, `gError.ml`, `gobject.ml`, `glib.ml`

2. **Hand-written Gtk-specific code**:
   - C stubs: `ml_gtk.c`, `ml_gtk_snapshot.c`, `ml_event_controller.c`, `ml_pango.c`, `ml_gdk.c`, `ml_gdkpixbuf.c`, `ml_gdk_clipboard.c`
   - OCaml: `gtk.ml`, `gMain.ml`, `gdk.ml`, `pango.ml`, `gdkPixbuf.ml`, `gdkClipboard.ml`, `eventController.ml`, `eventControllerKey.ml`, `eventControllerMotion.ml`, `gestureClick.ml`, `gtkSnapshot.ml`

3. **Generated Gtk code** (from gir_gen):
   - C stubs: `ml_*_gen.c` (e.g., `ml_button_gen.c`, `ml_gtk_enums_gen.c`)
   - OCaml bindings: `button.ml`, `entry.ml`, etc. (Layer 1)
   - OCaml wrappers: `gButton.ml`, `gEntry.ml`, etc. (Layer 2)
   - Signal classes: `gbutton_signals.ml`, etc.
   - Enums: `gtk_enums.mli`, `gdk_enums.mli`, etc.

## Proposed Structure

```
lablgtk4/
├── dune-project                   # Package definition
└── src/
    ├── dune                       # Main library with sub-libraries
    ├── common/                    # Hand-written common code
    │   ├── dune                   # lablgtk4.common sub-library
    │   ├── wrappers.c
    │   ├── ml_glib.c
    │   ├── ml_gobject.c
    │   ├── gaux.ml
    │   ├── gpointer.ml
    │   ├── gError.ml
    │   ├── gobject.ml
    │   └── glib.ml
    │
    ├── gtk/                       # Gtk library bindings
    │   ├── dune                   # lablgtk4.gtk sub-library
    │   ├── core/                  # Hand-written Gtk code
    │   │   ├── ml_gtk.c
    │   │   ├── ml_gtk_snapshot.c
    │   │   ├── ml_event_controller.c
    │   │   ├── gtk.ml
    │   │   ├── gMain.ml
    │   │   ├── eventController.ml
    │   │   └── gtkSnapshot.ml
    │   │
    │   └── generated/             # Generated Gtk code
    │       ├── dune-generated.inc
    │       ├── ml_*_gen.c
    │       ├── button.ml, entry.ml      # Layer 1 bindings
    │       ├── gButton.ml, gEntry.ml    # Layer 2 wrappers
    │       └── gtk_enums.mli
    │
    ├── gdk/                       # Gdk library bindings (future)
    │   ├── dune
    │   ├── core/
    │   │   ├── ml_gdk.c
    │   │   └── gdk.ml
    │   └── generated/
    │
    ├── gio/                       # Gio library bindings (future)
    │   ├── dune
    │   ├── core/
    │   └── generated/
    │
    └── pango/                     # Pango library bindings (future)
        ├── dune
        ├── core/
        │   ├── ml_pango.c
        │   └── pango.ml
        └── generated/
```

## Implementation Steps

### Phase 1: Create Directory Structure
1. Create new directories:
   ```
   src/common/
   src/gtk/core/
   src/gtk/generated/
   ```

2. Keep existing `src/` directory intact during migration

### Phase 2: Move Common Hand-Written Code
1. Move files to `src/common/`:
   - C: `wrappers.c`, `ml_glib.c`, `ml_gobject.c`
   - ML: `gaux.ml`, `gpointer.ml`, `gError.ml`, `gobject.ml`, `glib.ml`

2. Create `src/common/dune`:
   ```scheme
   (library
    (name lablgtk4_common)
    (public_name lablgtk4.common)
    (wrapped false)
    (foreign_stubs
     (language c)
     (names wrappers ml_glib ml_gobject)
     (flags -fPIC (:include ../cflag-gtk4.sexp) -Wno-deprecated-declarations))
    (c_library_flags (:include ../clink-gtk4.sexp))
    (modules Gaux Gpointer GError Gobject Glib))
   ```

### Phase 3: Move Gtk Hand-Written Core Code
1. Move files to `src/gtk/core/`:
   - C: `ml_gtk.c`, `ml_gtk_snapshot.c`, `ml_event_controller.c`, `ml_pango.c`, `ml_gdk.c`, `ml_gdkpixbuf.c`, `ml_gdk_clipboard.c`
   - ML: `gtk.ml`, `gMain.ml`, `eventController.ml`, `eventControllerKey.ml`, `eventControllerMotion.ml`, `gestureClick.ml`, `gtkSnapshot.ml`, `gdk.ml`, `pango.ml`, `gdkPixbuf.ml`, `gdkClipboard.ml`

2. Note: Some of these might later move to separate libraries (gdk, pango) in future phases

### Phase 4: Update gir_gen to Support Output Directories
Modify `src/tools/gir_gen/main.ml`:

1. **Add namespace parameter** to identify which library is being generated:
   ```ocaml
   let namespace_arg =
     let doc = "Library namespace (gtk, gdk, gio, pango, etc.)" in
     Arg.(value & opt string "gtk" & info ["n"; "namespace"] ~docv:"NAMESPACE" ~doc)
   ```

2. **Update file path generation** in `main.ml`:
   - Currently writes to `output_dir` directly (line 58, 108, 165, etc.)
   - Change to write to `output_dir/generated/` subdirectory
   - Update these functions:
     - `generate_ml_file` (lines 56-78)
     - `generate_high_level_class` (lines 102-151)
     - `generate_signal_class` (lines 153-167)
     - `generate_combined_ml_files` (lines 177-199)
     - `generate_combined_class_files` (lines 201-223)
     - `generate_enum_files` (lines 225-259)
     - `generate_all_record_bindings` (lines 261-344)

3. **Update dune file generation** in `generate/dune_file.ml`:
   - Keep the generated C stubs in same library
   - Update paths to reference `generated/` subdirectory
   - Add library dependency on `lablgtk4.common` and `lablgtk4.gtk.core`

### Phase 5: Create src/gtk/dune
Create `src/gtk/dune` to define the gtk sub-library:

```scheme
; Dune build file for Gtk sub-library

; Include generated dune configuration
(include generated/dune-generated.inc)

; Configure pkg-config for GTK4 (if not already in parent)
(rule
 (targets cflag-gtk4.sexp clink-gtk4.sexp)
 (action (bash "\
pkg-config --cflags gtk4 > cflag-gtk4.tmp && \
pkg-config --libs gtk4 > clink-gtk4.tmp && \
echo \"(\" > cflag-gtk4.sexp && \
tr ' ' '\\n' < cflag-gtk4.tmp | sed 's/^\\(.*\\)$/\\1/' | tr '\\n' ' ' >> cflag-gtk4.sexp && \
echo \")\" >> cflag-gtk4.sexp && \
echo \"(\" > clink-gtk4.sexp && \
tr ' ' '\\n' < clink-gtk4.tmp | sed 's/^\\(.*\\)$/\\1/' | tr '\\n' ' ' >> clink-gtk4.sexp && \
echo \")\" >> clink-gtk4.sexp && \
rm cflag-gtk4.tmp clink-gtk4.tmp\
")))

; Hand-written core Gtk code
(library
 (name lablgtk4_gtk_core)
 (public_name lablgtk4.gtk.core)
 (wrapped false)
 (modules :standard \ <generated-modules>)  ; Exclude generated modules
 (foreign_stubs
  (language c)
  (names ml_gtk ml_gtk_snapshot ml_event_controller ml_pango ml_gdk ml_gdkpixbuf ml_gdk_clipboard)
  (flags -fPIC (:include cflag-gtk4.sexp) -Wno-deprecated-declarations))
 (c_library_flags (:include clink-gtk4.sexp))
 (libraries lablgtk4.common cairo2))

; Main Gtk library combining core and generated code
(library
 (name lablgtk4_gtk)
 (public_name lablgtk4.gtk)
 (wrapped false)
 (modules (:include generated/dune-modules.sexp))  ; Generated modules
 (libraries lablgtk4.common lablgtk4.gtk.core lablgtk4_generated_stubs))
```

### Phase 6: Update Main src/dune
Update `src/dune` to become a wrapper that re-exports sub-libraries:

```scheme
; Main lablgtk4 library - re-exports all sub-libraries

(library
 (name lablgtk4)
 (public_name lablgtk4)
 (wrapped false)
 (modules)  ; No modules - just re-export
 (libraries
   lablgtk4.common
   lablgtk4.gtk.core
   lablgtk4.gtk
   threads
   cairo2)
 (re_export
   lablgtk4.common
   lablgtk4.gtk.core
   lablgtk4.gtk))
```

### Phase 7: Update Generated dune-generated.inc
Modify `generate/dune_file.ml` to generate dune file for `src/gtk/generated/`:

```ocaml
let generate_dune_library ~stub_names ~module_names =
  let buf = Buffer.create 2048 in

  (* Generate module list file *)
  Buffer.add_string buf "(rule\n";
  Buffer.add_string buf " (targets dune-modules.sexp)\n";
  Buffer.add_string buf " (action\n";
  Buffer.add_string buf "  (with-stdout-to dune-modules.sexp\n";
  Buffer.add_string buf "    (progn\n";
  List.iter ~f:(fun name ->
    bprintf buf "      (echo \"%s\")\n" name
  ) module_names;
  Buffer.add_string buf "    )))\n";
  Buffer.add_string buf ")\n\n";

  (* Generated C stubs library *)
  Buffer.add_string buf "(library\n";
  Buffer.add_string buf " (name lablgtk4_generated_stubs)\n";
  Buffer.add_string buf " (public_name lablgtk4.generated_stubs)\n";
  Buffer.add_string buf " (wrapped false)\n";
  Buffer.add_string buf " (modules)  ; No OCaml modules\n";
  Buffer.add_string buf " (foreign_stubs\n";
  Buffer.add_string buf "  (language c)\n";
  Buffer.add_string buf "  (names\n";
  List.iter ~f:(fun name ->
    bprintf buf "   %s\n" name
  ) stub_names;
  Buffer.add_string buf "  )\n";
  Buffer.add_string buf "  (flags -fPIC (:include ../../cflag-gtk4.sexp) -Wno-deprecated-declarations))\n";
  Buffer.add_string buf " (c_library_flags (:include ../../clink-gtk4.sexp)))\n";

  Buffer.contents buf
```

### Phase 8: Update gir_gen Invocation
Update the build script or Makefile that invokes gir_gen:

```bash
# Old:
dune exec gir_gen -- /usr/share/gir-1.0/Gtk-4.0.gir src/

# New:
dune exec gir_gen -- /usr/share/gir-1.0/Gtk-4.0.gir src/gtk/
```

### Phase 9: Testing and Validation
1. Run `dune clean`
2. Run `dune build`
3. Verify all modules are accessible
4. Run existing tests
5. Update examples to use new structure if needed

### Phase 10: Future Extensions
Once Gtk is working, add other libraries:

1. **Gdk library**:
   - Move gdk-specific code from `src/gtk/core/` to `src/gdk/core/`
   - Generate Gdk bindings: `gir_gen /usr/share/gir-1.0/Gdk-4.0.gir src/gdk/`
   - Update `src/gtk/dune` to depend on `lablgtk4.gdk`

2. **Gio library**:
   - Create `src/gio/` structure
   - Generate: `gir_gen /usr/share/gir-1.0/Gio-2.0.gir src/gio/`
   - This will solve the GMenuModel type mapping issues mentioned in KNOWN_BUGS.md

3. **Pango library**:
   - Move pango code from `src/gtk/core/` to `src/pango/core/`
   - Generate: `gir_gen /usr/share/gir-1.0/Pango-1.0.gir src/pango/`

## Key Changes Required in gir_gen

### File: `src/tools/gir_gen/main.ml`

1. **Line 58-59** (`generate_ml_file`):
   ```ocaml
   - let ml_file = Filename.concat output_dir (sprintf "%s%s" ...)
   + let ml_file = Filename.concat (Filename.concat output_dir "generated") (sprintf "%s%s" ...)
   ```

2. **Line 108-109** (`generate_high_level_class`):
   ```ocaml
   - let g_file = Filename.concat output_dir (sprintf "g%s.ml" module_name) in
   + let g_file = Filename.concat (Filename.concat output_dir "generated") (sprintf "g%s.ml" module_name) in
   ```

3. **Line 164-165** (`generate_signal_class`):
   ```ocaml
   - let signal_file = Filename.concat output_dir (sprintf "g%s_signals.ml" ...)
   + let signal_file = Filename.concat (Filename.concat output_dir "generated") (sprintf "g%s_signals.ml" ...)
   ```

4. **Line 183-184** (`generate_combined_ml_files`):
   ```ocaml
   - let mli_path = Filename.concat output_dir (combined_snake ^ ".mli") in
   + let mli_path = Filename.concat (Filename.concat output_dir "generated") (combined_snake ^ ".mli") in
   ```

5. **Similar changes** for all other file generation functions

### File: `src/tools/gir_gen/generate/dune_file.ml`

Update paths in generated dune file to reference parent directories correctly:
- Line 39: Update pkg-config include paths
- Add library dependencies on common and core

## Migration Strategy

### Option 1: Big Bang (Recommended)
- Do all changes in one go
- Easier to test as a coherent unit
- Less risk of partial states

### Option 2: Gradual Migration
- Phase 1-3: Set up structure, move common code
- Phase 4-6: Update gir_gen and Gtk structure
- Phase 7-9: Test and validate
- Phase 10: Add other libraries incrementally

## Benefits

1. **Separation of Concerns**: Clear distinction between hand-written and generated code
2. **Library Modularity**: Each GObject library gets its own namespace
3. **Easier Maintenance**: Generated code changes don't affect hand-written code
4. **Future Extensions**: Easy to add new libraries (Gio, GdkWayland, etc.)
5. **Better Organization**: Developers can quickly locate relevant code
6. **Parallel Development**: Different libraries can be worked on independently

## Risks and Mitigations

| Risk | Mitigation |
|------|-----------|
| Breaking existing code | Keep `lablgtk4` library re-exporting all modules |
| Build system complexity | Extensive testing, clear documentation |
| Path confusion | Use consistent naming conventions |
| gir_gen regressions | Add tests for generator output |

## Notes

- The `wrapped false` setting is maintained for compatibility
- Module names remain unchanged from user perspective
- The refactoring is mostly internal reorganization
- All public APIs remain accessible through `lablgtk4` library
