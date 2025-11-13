### Phase 1: Foundation & Infrastructure (4.5-6.5 weeks)

**Objective**: Reorganize repository structure and establish the build system, development environment, and code generation infrastructure required for GTK4 bindings.

#### 1.0 Repository Reorganization (Prerequisite) ✅ COMPLETED

**Tasks:**

1. **Reorganize repository to support side-by-side GTK3 and GTK4**

   Current structure (lablgtk3 at root):
   ```
   lablgtk/
   ├── src/              # GTK3 bindings
   ├── examples/         # GTK3 examples
   ├── applications/
   ├── dune-project
   ├── lablgtk3.opam
   └── ...
   ```

   New structure (both in subfolders):
   ```
   lablgtk/
   ├── lablgtk3/                    # GTK3 bindings (moved)
   │   ├── src/
   │   ├── src-sourceview3/
   │   ├── src-goocanvas2/
   │   ├── src-gtkspell3/
   │   ├── src-rsvg2/
   │   ├── examples/
   │   ├── applications/
   │   ├── dune-project
   │   ├── lablgtk3.opam
   │   └── ...
   ├── lablgtk4/                    # GTK4 bindings (new)
   │   └── (to be created in 1.1)
   ├── README.md                    # Root README
   └── .github/                     # Shared CI
   ```

2. **Move lablgtk3 files into subfolder**

   ```bash
   # Create new directory structure
   mkdir -p lablgtk3

   # Move GTK3 files into lablgtk3/
   git mv src lablgtk3/
   git mv src-* lablgtk3/
   git mv examples lablgtk3/
   git mv applications lablgtk3/
   git mv dune-project lablgtk3/
   git mv *.opam lablgtk3/
   git mv tools lablgtk3/  # if exists
   # Move other relevant files (CHANGES.md, etc.)

   # Update paths in dune files
   # Fix any absolute paths that reference old structure
   ```

3. **Update root README.md**

   Create new root README explaining the structure:
   ```markdown
   # LablGTK - OCaml interface to GTK+

   This repository contains OCaml bindings for both GTK 3 and GTK 4.

   ## Packages

   - **lablgtk3/** - GTK 3 bindings (stable, maintenance mode)
   - **lablgtk4/** - GTK 4 bindings (in development)

   ## Building

   ### LablGTK3 (GTK 3.x)
   ```bash
   cd lablgtk3
   opam install . --deps-only
   dune build
   ```

   ### LablGTK4 (GTK 4.x)
   ```bash
   cd lablgtk4
   opam install . --deps-only
   dune build
   ```

   See individual directories for detailed documentation.
   ```

4. **Update CI configuration**

   Update `.github/workflows/ci.yml` to build both versions:
   ```yaml
   jobs:
     build-gtk3:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v3
         - name: Install GTK3
           run: sudo apt-get install -y libgtk-3-dev
         - name: Build lablgtk3
           working-directory: ./lablgtk3
           run: |
             opam install . --deps-only
             dune build

     build-gtk4:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v3
         - name: Install GTK4
           run: sudo apt-get install -y libgtk-4-dev
         - name: Build lablgtk4
           working-directory: ./lablgtk4
           run: |
             opam install . --deps-only
             dune build
   ```

**Success Criteria:**
- lablgtk3/ subdirectory contains all GTK3 code
- lablgtk3 still builds successfully from its subdirectory
- Root README explains the structure
- CI builds lablgtk3 from new location
- Git history preserved (using `git mv`)

**Estimated Time**: 0.5 weeks

---

#### 1.1 Repository and Build System Setup ✅ COMPLETED

**Tasks:**

1. **Create lablgtk4 directory structure** (sibling to lablgtk3/)

   In the repository root, create:
   ```
   lablgtk4/
   ├── src/                      # Core GTK4 bindings
   │   ├── dune                  # Main library configuration
   │   ├── tools/                # Code generation tools (copied from lablgtk3)
   │   │   ├── varcc.ml4        # Enum generator (update for GTK4)
   │   │   ├── propcc.ml4       # Property generator (update for GTK4)
   │   │   └── dune
   │   └── (widget sources to be added in later phases)
   ├── examples/                 # GTK4 examples
   ├── tests/                    # Unit tests
   ├── dune-project              # Dune project configuration
   ├── lablgtk4.opam             # OPAM package definition
   └── README.md
   ```

   Copy code generation tools from lablgtk3 as starting point:
   ```bash
   mkdir -p lablgtk4/src/tools
   cp lablgtk3/tools/* lablgtk4/src/tools/
   # These will be updated in section 1.2
   ```

2. **Configure dune-project for GTK4**
   ```lisp
   (lang dune 3.0)
   (name lablgtk4)
   (version 4.0.0-dev)
   (generate_opam_files true)
   (source (github garrigue/lablgtk))  ; or new repo location
   (license "LGPL-2.1-or-later WITH OCaml-LGPL-linking-exception")
   ```

3. **Create lablgtk4.opam with GTK4 dependencies**
   ```opam
   opam-version: "2.0"
   synopsis: "OCaml interface to GTK+4"
   depends: [
     "ocaml" {>= "4.09.0"}
     "dune" {>= "3.0"}
     "cairo2" {>= "0.6"}
     "conf-gtk4" {>= "4.10"}
     "camlp-streams" {>= "5.0"}
     "camlp5" {dev}
   ]
   ```

4. **Set up pkg-config detection for GTK4**
   - Create `src/dune-config` rules to detect GTK4 headers and libraries
   - Generate `cflag-gtk4.sexp` and `clink-gtk4.sexp`
   - Target `gtk4` instead of `gtk+-3.0`

**Success Criteria:**
- `dune build` successfully configures (even with empty src/)
- pkg-config correctly detects GTK4 libraries
- Basic directory structure in place

**Estimated Time**: 1 week

---

#### 1.2 Code Generation Tools Migration ✅ COMPLETED

**Tasks:**

1. **Update varcc (enum/variant generator)**

   **Changes needed:**
   - Port `tools/varcc.ml4` to work with GTK4 header locations
   - Update to handle new GTK4 enum naming conventions
   - Ensure camlp5 compatibility

   **Testing:**
   - Generate test enum from simple GTK4 header
   - Verify OCaml variant types are correct
   - Check C conversion tables are valid

2. **Update propcc (property generator)**

   **Changes needed:**
   - Adapt to GTK4 property system (GParamSpec still used but some APIs changed)
   - Handle new widget hierarchy (no GtkContainer/GtkBin base)
   - Update signal connection mechanisms

   **Key modifications:**
   - Update property accessor templates for GTK4 APIs
   - Modify signal connection code for new event controller model (Phase 3)
   - Handle deprecated property removal

   **Testing:**
   - Generate properties for simple widget (e.g., GtkLabel)
   - Verify property getters/setters compile
   - Test signal definitions

3. **Create new code generation rules in dune**

   Update `src/tools/dune`:
   ```lisp
   (executable
    (name varcc)
    (modules varcc)
    (preprocess (action (run camlp5o %{input-file}))))

   (executable
    (name propcc)
    (modules propcc)
    (preprocess (action (run camlp5o %{input-file}))))
   ```

   Create `src/dune-enum.sexp` for GTK4 enums:
   ```lisp
   (rule
    (targets gdk4_tags.h gdk4_tags.c gdk4Enums.ml)
    (deps (:source gdk4_tags.var))
    (action (run %{project_root}/src/tools/varcc.exe %{source})))
   ```

**Success Criteria:**
- varcc compiles and generates valid OCaml code from .var files
- propcc compiles and generates valid OCaml code from .props files
- Generated code compiles without errors
- Dune rules successfully invoke generators

**Estimated Time**: 1.5 weeks

---

#### 1.3 GTK4 Enumeration Bindings ✅ COMPLETED

**Tasks:**

1. **Create GTK4 enumeration definition files**

   Port existing `.var` files to GTK4, updating for API changes:

   **Priority enums to define:**

   a. **gdk4_tags.var** (GDK enums)
   ```
   // Event types (modified in GTK4)
   type event_type = [
     | `DELETE
     | `DESTROY
     | `MOTION_NOTIFY
     | `BUTTON_PRESS
     | `BUTTON_RELEASE
     | `KEY_PRESS
     | `KEY_RELEASE
     | `ENTER_NOTIFY
     | `LEAVE_NOTIFY
     | `FOCUS_CHANGE
     | `CONFIGURE
     | `SCROLL
     | `TOUCHPAD_SWIPE
     | `TOUCHPAD_PINCH
     | `TOUCH_BEGIN
     | `TOUCH_UPDATE
     | `TOUCH_END
     | `TOUCH_CANCEL
     // Many GTK3 events removed
   ]

   // Surface edges (renamed from Window)
   type surface_edge = [
     | `NORTH_WEST
     | `NORTH
     | `NORTH_EAST
     | `WEST
     | `EAST
     | `SOUTH_WEST
     | `SOUTH
     | `SOUTH_EAST
   ]

   // Modifier types
   type modifier_type = [
     | `SHIFT_MASK
     | `LOCK_MASK
     | `CONTROL_MASK
     | `ALT_MASK        // was MOD1_MASK in GTK3
     | `META_MASK       // was MOD2_MASK in GTK3
     | `BUTTON1_MASK
     | `BUTTON2_MASK
     | `BUTTON3_MASK
     | `BUTTON4_MASK
     | `BUTTON5_MASK
   ]
   ```

   b. **gtk4_tags.var** (GTK widget enums)
   ```
   // Align (unchanged)
   type align = [
     | `FILL
     | `START
     | `END
     | `CENTER
     | `BASELINE
   ]

   // Orientation (unchanged)
   type orientation = [
     | `HORIZONTAL
     | `VERTICAL
   ]

   // Pack direction
   type pack_type = [
     | `START
     | `END
   ]

   // Selection mode (unchanged)
   type selection_mode = [
     | `NONE
     | `SINGLE
     | `BROWSE
     | `MULTIPLE
   ]

   // Window type (some removed)
   type window_type = [
     | `TOPLEVEL
     | `POPUP
   ]

   // Message type (unchanged)
   type message_type = [
     | `INFO
     | `WARNING
     | `QUESTION
     | `ERROR
   ]
   ```

   c. **glib_tags.var** (GLib enums - minimal changes)
   ```
   type log_level_flags = [
     | `FLAG_RECURSION
     | `FLAG_FATAL
     | `LEVEL_ERROR
     | `LEVEL_CRITICAL
     | `LEVEL_WARNING
     | `LEVEL_MESSAGE
     | `LEVEL_INFO
     | `LEVEL_DEBUG
   ]

   type io_condition = [
     | `IN
     | `OUT
     | `PRI
     | `ERR
     | `HUP
     | `NVAL
   ]
   ```

   d. **pango_tags.var** (Pango enums - unchanged from GTK3)

   e. **gobject_tags.var** (GObject enums - unchanged from GTK3)

2. **Generate and test enumeration modules**

   ```bash
   dune build src/gdk4Enums.ml
   dune build src/gtk4Enums.ml
   dune build src/glibEnums.ml
   ```

   Verify generated files compile correctly.

3. **Create enum documentation**

   Document major changes from GTK3:
   - Event types significantly reduced
   - Modifier mask renaming (MOD1→ALT, MOD2→META)
   - Removed window types (OFFSCREEN, POPUP_MENU)
   - New touch/gesture event types

**Success Criteria:**
- All 5 core .var files created for GTK4
- Enums successfully generated from .var files
- Generated OCaml modules compile
- C conversion tables work correctly
- Documentation of GTK3→GTK4 enum changes

**Estimated Time**: 1 week

---

#### 1.4 Testing Infrastructure ✅ COMPLETED

**Tasks:**

1. **Create test framework structure**

   ```
   tests/
   ├── dune                      # Test suite configuration
   ├── test_enums.ml             # Test enum conversions
   ├── test_glib.ml              # Test GLib bindings
   ├── test_gobject.ml           # Test GObject bindings
   └── test_widgets.ml           # Widget tests (Phase 3+)
   ```

2. **Set up test dependencies**

   In `tests/dune`:
   ```lisp
   (tests
    (names test_enums test_glib test_gobject)
    (libraries lablgtk4 alcotest))
   ```

   Add to `lablgtk4.opam`:
   ```opam
   depends: [
     ...
     "alcotest" {with-test}
   ]
   ```

3. **Write enum conversion tests**

   `tests/test_enums.ml`:
   ```ocaml
   open Alcotest

   let test_gdk_event_types () =
     let open Gdk4Enums in
     (* Test OCaml → C → OCaml round-trip *)
     let test_roundtrip event =
       let c_val = event_type_to_c event in
       let ocaml_val = event_type_of_c c_val in
       check (equal event ocaml_val) "roundtrip" event ocaml_val
     in
     test_roundtrip `DELETE;
     test_roundtrip `BUTTON_PRESS;
     test_roundtrip `KEY_PRESS

   let test_modifier_types () =
     let open Gdk4Enums in
     (* Test that ALT_MASK and META_MASK exist *)
     let _ = modifier_type_to_c `ALT_MASK in
     let _ = modifier_type_to_c `META_MASK in
     ()

   let () =
     run "Enum Tests" [
       "gdk_event_types", [ test_case "roundtrip" `Quick test_gdk_event_types ];
       "modifier_types", [ test_case "renamed" `Quick test_modifier_types ];
     ]
   ```

4. **Create minimal GLib/GObject tests**

   Tests to validate basic FFI works:
   - GLib main loop initialization
   - GObject type system
   - Memory management (ref counting)
   - Signal marshalling (basic)

5. **Set up CI pipeline**

   Create `.github/workflows/ci.yml`:
   ```yaml
   name: CI
   on: [push, pull_request]

   jobs:
     build:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v3
         - name: Install GTK4
           run: |
             sudo apt-get update
             sudo apt-get install -y libgtk-4-dev
         - name: Set up OCaml
           uses: ocaml/setup-ocaml@v2
           with:
             ocaml-compiler: 4.14.x
         - name: Install dependencies
           run: opam install . --deps-only --with-test
         - name: Build
           run: opam exec -- dune build
         - name: Test
           run: opam exec -- dune runtest
   ```

**Success Criteria:**
- Test framework compiles and runs
- Enum tests pass
- CI pipeline runs successfully on commits
- Documentation for running tests

**Estimated Time**: 1 week

---

#### 1.5 Basic C FFI Infrastructure

**Tasks:**

1. **Port wrappers.h/wrappers.c to GTK4**

   Copy from lablgtk3 and update:
   - Update GTK4 header includes (`#include <gtk/gtk.h>` now includes all)
   - Verify all wrapper macros still work
   - Update any deprecated GLib/GObject macros

   **Key macros to verify:**
   ```c
   #define Val_GdkSurface(val)     // was Val_GdkWindow
   #define GdkSurface_val(val)     // was GdkWindow_val
   ```

2. **Create minimal ml_glib.c stub for testing**

   Port basic GLib functions needed for initialization:
   ```c
   CAMLprim value ml_g_get_prgname(value unit)
   CAMLprim value ml_g_set_prgname(value name)
   CAMLprim value ml_g_get_application_name(value unit)
   ```

3. **Create minimal ml_gobject.c stub**

   Port core GObject functions:
   ```c
   CAMLprim value ml_g_object_ref(value obj)
   CAMLprim value ml_g_object_unref(value obj)
   CAMLprim value ml_g_object_get_type(value obj)
   ```

4. **Test C compilation**

   Add to `src/dune`:
   ```lisp
   (library
    (name lablgtk4)
    (public_name lablgtk4)
    (wrapped false)
    (c_names wrappers ml_glib ml_gobject)
    (c_flags (:include cflag-gtk4.sexp))
    (c_library_flags (:include clink-gtk4.sexp))
    (libraries threads cairo2))
   ```

   Verify: `dune build src/lablgtk4.a`

**Success Criteria:**
- wrappers.c/h compile with GTK4
- Basic GLib/GObject stubs compile
- Library links successfully
- No GTK4 deprecation warnings (with `-Wno-deprecated-declarations`)

**Estimated Time**: 0.5 weeks

---

#### Phase 1 Deliverables

At the end of Phase 1, the following should be complete:

**Code:**
- [ ] Repository reorganized (lablgtk3/ and lablgtk4/ subfolders)
- [ ] lablgtk3 still builds from new location
- [ ] lablgtk4 directory with build system
- [ ] Updated varcc and propcc tools
- [ ] GTK4 enumeration bindings (5 .var files + generated code)
- [ ] Basic wrappers.c/h infrastructure
- [ ] Test framework with passing enum tests
- [ ] CI pipeline running for both lablgtk3 and lablgtk4

**Documentation:**
- [ ] Root README explaining directory structure
- [ ] lablgtk4/README with build instructions
- [ ] Enum changes GTK3→GTK4 document
- [ ] Development setup guide

**Validation:**
- [ ] `dune build` succeeds
- [ ] `dune runtest` passes
- [ ] CI pipeline green
- [ ] Code generation tools work end-to-end

**Next Phase Prerequisites:**
- Build system ready for core module development
- Code generation verified working
- Testing infrastructure in place
- Team familiar with GTK4 development environment

---
