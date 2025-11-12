# LablGTK3 to LablGTK4 Migration Plan

## Executive Summary

### Overview

This document outlines a comprehensive, phased approach to porting LablGTK3 (OCaml bindings for GTK+ 3.x) to GTK 4. The migration represents a major architectural shift affecting all layers of the binding infrastructure, from low-level C FFI to high-level OCaml APIs.

### Scope and Scale

**Current State (LablGTK3):**
- 83 C stub files (~20,000 lines of C)
- 60+ OCaml modules (~21,500 lines of OCaml)
- 15 property definition files (`.props`)
- 6 enumeration definition files (`.var`)
- 4 optional extension libraries (SourceView3, GooCanvas2, GtkSpell3, RSVG2)
- 30+ example applications

**Migration Complexity:**
- **High Impact**: GTK 4 is a complete API/ABI break from GTK 3
- **Estimated Effort**: 6-12 months for experienced developers
- **Risk Level**: High - requires deep understanding of both GTK internals and OCaml FFI

### Critical Breaking Changes

The GTK 3 → GTK 4 transition introduces fundamental architectural changes that impact every layer of LablGTK:

1. **Container System Elimination** (CRITICAL)
   - `GtkContainer` and `GtkBin` abstract classes removed
   - Generic `gtk_container_add()` / `gtk_container_remove()` eliminated
   - Each container now has specialized APIs (e.g., `gtk_box_append()`, `gtk_grid_attach()`)
   - **Impact**: Complete redesign of `GContainer`, `GBin`, and all container widgets

2. **Event System Redesign** (CRITICAL)
   - Event signals (`::button-press-event`, `::key-press-event`) replaced by event controllers
   - `GtkEventBox` removed (all widgets now receive events)
   - Grabs eliminated in favor of modal dialogs and autohide
   - **Impact**: Major changes to `GObj.event_ops`, signal handling infrastructure

3. **Drawing System Transformation** (CRITICAL)
   - `GtkWidget::draw` signal removed
   - Replaced with `GtkWidget::snapshot` vfunc using `GtkSnapshot` API
   - Direct Cairo drawing still possible via `gtk_snapshot_append_cairo()`
   - **Impact**: Fundamental changes to `GDraw` module and custom widget rendering

4. **Widget API Changes** (HIGH)
   - Many widgets removed: `GtkMenu`, `GtkMenuBar`, `GtkMenuItem`, `GtkToolbar`, `GtkRadioButton`, `GtkButtonBox`
   - Replacements: `GtkPopoverMenu`, `GtkPopoverMenuBar`, grouped `GtkCheckButton`
   - **Impact**: Significant API redesign in `GMenu`, `GButton`, `GPack` modules

5. **GdkWindow → GdkSurface Rename** (MEDIUM)
   - All `GdkWindow` APIs renamed to `GdkSurface`
   - Root window concept removed
   - **Impact**: Updates throughout `Gdk` module and all window-related code

6. **Clipboard System Replacement** (MEDIUM)
   - `GtkClipboard` completely replaced by `GdkClipboard`
   - New API uses `GValue` and `GType` instead of opaque identifiers
   - **Impact**: Complete rewrite of clipboard handling

7. **CSS and Styling Changes** (MEDIUM)
   - Non-standard CSS properties removed (`-gtk-gradient`, `-gtk-icon-theme`)
   - Style context APIs simplified
   - `gtk_style_context_add_class()` moved to `gtk_widget_add_css_class()`
   - **Impact**: Updates to CSS handling and widget styling APIs

### Recommended Approach: Parallel Development

Rather than attempting an in-place migration, we recommend creating **lablgtk4** as a separate package that can coexist with lablgtk3:

**Advantages:**
- Allows applications to migrate incrementally
- Reduces risk of breaking existing lablgtk3 users
- Enables A/B testing and gradual adoption
- Maintains backward compatibility during transition period

**Package Structure:**
```
lablgtk4/                    # New GTK4 bindings
├── src/                     # Core GTK4 bindings
├── src-sourceview5/         # GtkSourceView 5 (GTK4 version)
├── examples/                # GTK4 examples
└── lablgtk4.opam

lablgtk3/                    # Existing GTK3 bindings (maintenance mode)
└── (existing structure)
```

### Migration Phases Overview

The migration is structured into 7 phases over an estimated 6-12 month timeline:

**Phase 1: Foundation & Infrastructure** (4-6 weeks)
- Set up build system for GTK4
- Update code generation tools (varcc, propcc)
- Create new enumeration bindings
- Establish testing framework

**Phase 2: Core Layer Migration** (6-8 weeks)
- Port GLib, GObject, GdkPixbuf (minimal changes)
- Migrate Gdk (GdkWindow → GdkSurface)
- Update Pango bindings
- Implement new GdkClipboard

**Phase 3: Base Widget Infrastructure** (6-8 weeks)
- Port GtkWidget with new snapshot rendering
- Implement event controller system
- Create new focus handling
- Update widget lifecycle management

**Phase 4: Container & Layout System** (4-6 weeks)
- Redesign container APIs (no GtkContainer/GtkBin)
- Update GtkBox, GtkGrid, GtkFixed
- Port packing and layout widgets
- Implement new constraint system

**Phase 5: High-Level Widgets** (8-12 weeks)
- Port buttons, entries, ranges, misc widgets
- Migrate GtkText (text view/buffer)
- Update GtkTree (list/tree views)
- Implement new menu system (GtkPopoverMenu)

**Phase 6: Advanced Features** (4-6 weeks)
- Port GtkBuilder (with UI file migration)
- Update action system
- Migrate file chooser to GFile API
- Port drag-and-drop to new controllers

**Phase 7: Extensions & Polish** (4-6 weeks)
- Port GtkSourceView 5
- Update/remove other extensions (GooCanvas2 may not have GTK4 version)
- Migrate all examples
- Documentation and migration guide

### Success Criteria

The migration will be considered successful when:

1. **Core Functionality**: All essential GTK4 widgets have OCaml bindings
2. **API Consistency**: High-level API maintains similar patterns to lablgtk3 where possible
3. **Examples Working**: Key examples (buttons, text editor, tree view, cairo) compile and run
4. **Build System**: Dune build with GTK4 dependencies works cleanly
5. **Documentation**: Migration guide for lablgtk3 → lablgtk4 users completed
6. **Test Coverage**: Basic test suite validates core functionality

### Risk Mitigation

**Technical Risks:**
- **GTK4 API instability**: Mitigate by targeting GTK 4.10+ (current stable)
- **Breaking user code**: Mitigate with parallel package approach
- **Incomplete bindings**: Prioritize most-used widgets; mark others as TODO
- **Performance regressions**: Benchmark against GTK3 version

**Resource Risks:**
- **Maintainer bandwidth**: Phase approach allows for incremental progress
- **Community adoption**: Clear migration guide and examples essential
- **Dependency availability**: Verify GTK4 availability on target platforms

### Next Steps

1. **Community Feedback**: Share this plan with lablgtk maintainers and users
2. **Repository Setup**: Create lablgtk4 repository with basic structure
3. **Proof of Concept**: Implement Phase 1 foundation to validate approach
4. **Continuous Integration**: Set up CI for GTK4 builds
5. **Phase 1 Execution**: Begin foundation work per detailed plan below

---

## Detailed Phase Plans

### Phase 1: Foundation & Infrastructure (4-6 weeks)

**Objective**: Establish the build system, development environment, and code generation infrastructure required for GTK4 bindings.

#### 1.1 Repository and Build System Setup

**Tasks:**

1. **Create lablgtk4 repository structure**
   ```
   lablgtk4/
   ├── src/                      # Core GTK4 bindings
   │   ├── dune                  # Main library configuration
   │   ├── tools/                # Code generation tools
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

#### 1.2 Code Generation Tools Migration

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

#### 1.3 GTK4 Enumeration Bindings

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

#### 1.4 Testing Infrastructure

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
- [ ] lablgtk4 repository with build system
- [ ] Updated varcc and propcc tools
- [ ] GTK4 enumeration bindings (5 .var files + generated code)
- [ ] Basic wrappers.c/h infrastructure
- [ ] Test framework with passing enum tests
- [ ] CI pipeline running

**Documentation:**
- [ ] README with build instructions
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

