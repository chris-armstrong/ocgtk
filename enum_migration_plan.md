# Enum Migration Transition Plan: varcc → gir_gen

**Date**: 2025-12-01
**Target**: Complete migration within 2-4 weeks
**Strategy**: Complete replacement - generate everything with gir_gen, then remove varcc
**Breaking Changes**: Acceptable (internal/experimental project)

---

## Executive Summary

Based on analysis and requirements:
- ✅ **Switch to `gtk_enums` style** (lowercase with underscore - OCaml convention)
- ✅ **Conv module NOT used** in hand-written code (only in propcc/varcc tools)
- ✅ **Urgent timeline** - complete replacement ASAP
- ✅ **Breaking changes acceptable** - no backward compatibility required
- ✅ **Performance not critical** - if-else chains are fine
- ✅ **Complete replacement** - all namespaces at once

**Key Finding**: No hand-written code uses `Gtk4Enums.Conv` module, which means we can skip generating the Conv module entirely. The enum types themselves are used via `Gtk_enums.orientation` etc., which gir_gen already generates.

---

## Phase 1: Verify Coverage (Days 1-2) ✅ COMPLETE

**Status**: ✅ **COMPLETE** - 100% Coverage Verified!
**Report**: See [enum_coverage_report.md](enum_coverage_report.md)
**Mapping**: See [enum_mapping.txt](enum_mapping.txt)

### Goal
Ensure gir_gen generates all 31 enums currently handled by varcc.

### Tasks

#### 1.1 Audit varcc enums against gir_gen output

```bash
# List all varcc enum types
grep "^type " lablgtk4/src/gtk4_tags.var
grep "^type " lablgtk4/src/gdk4_tags.var
grep "^type " lablgtk4/src/glib_tags.var
grep "^type " lablgtk4/src/pango_tags.var
grep "^type " lablgtk4/src/gobject_tags.var
grep "^type " lablgtk4/src/gdkpixbuf_tags.var

# Check what gir_gen generates
grep "^type " lablgtk4/src/gtk_enums.mli
grep "^type " lablgtk4/src/gdk_enums.mli
grep "^type " lablgtk4/src/pango_enums.mli
```

**Expected varcc enums** (31 total from gtk4_tags.var):
```
align, orientation, pack_type, baseline_position, delete_type,
direction_type, icon_size, sensitivity_type, text_direction,
justification, message_type, movement_step, position_type,
scroll_type, selection_mode, sort_type, wrap_mode, policy_type,
corner_type, input_purpose, input_hints, size_group_mode,
stack_transition_type, file_chooser_action, response,
tree_view_column_sizing, cell_renderer_mode, image_type,
entry_icon_position, tree_view_grid_lines, content_fit
```

#### 1.2 Create mapping table

Create `enum_mapping.txt` documenting any name differences:

```
# varcc name → gir_gen name
gtk4_tags.var:pack_type → gtk_enums.mli:packtype
gtk4_tags.var:baseline_position → gtk_enums.mli:baselineposition
# etc.
```

#### 1.3 Check for missing enums

If any varcc enum is NOT in gir_gen output:
- Check if it's a deprecated GTK enum not in GTK4 GIR
- Check if it's named differently in GIR
- Add manual entry to gir_parser.ml if truly missing

**Deliverable**: ✅ `enum_coverage_report.md` listing all 58 varcc enums (31 GTK + 19 GDK + 8 Pango) and their gir_gen equivalents.

### Results Summary

✅ **100% Coverage Achieved!**

- **GTK4**: 31/31 enums found (100%)
- **GDK4**: 19/19 enums found (100%)
- **Pango**: 8/8 enums found (100%)
- **Total**: 58/58 enums verified ✅

**Key Findings**:
1. All varcc enums have gir_gen equivalents
2. Pattern: Most use concatenated names (`pack_type` → `packtype`)
3. Special case: `response` → `responsetype`
4. Bonus: gir_gen provides 211 total enum types (vs varcc's 58)

See [enum_coverage_report.md](enum_coverage_report.md) for full details.

---

## Phase 2: Update Build System (Days 3-4) ✅ COMPLETE

**Status**: ✅ **COMPLETE** - Build system updated, varcc disabled
**Summary**: See [phase2_summary.md](phase2_summary.md)
**Build Log**: [phase2_build_errors.log](phase2_build_errors.log)

### Goal
Configure build to use gir_gen enums, disable varcc.

### Tasks

#### 2.1 Update dune-generated.inc

Ensure gir_gen properly lists enum modules:

```scheme
; Current: modules listed in base_modules in main.ml
; Verify these are included:
"Gtk4Enums"    ; ← OLD varcc name
"Gtk_enums"    ; ← NEW gir_gen name - add this
"Gdk_enums"
"Pango_enums"
; etc.
```

**File**: `lablgtk4/src/tools/gir_gen/main.ml` lines 481-495

**Change**:
```ocaml
let base_modules = [
  "gError"; "gpointer"; "gaux"; "gobject"; "glib"; "gdk"; "gdkPixbuf";
  (* ... other modules ... *)
  (* OLD - remove these: *)
  (* "Gtk4Enums"; "Gdk4Enums"; "GlibEnums"; "pangoEnums"; "GobjectEnums"; *)
  (* NEW - use these: *)
  "gtk_enums"; "gdk_enums"; "pango_enums";
  (* ... *)
]
```

#### 2.2 Comment out varcc rules in dune

**File**: `lablgtk4/src/dune`

```scheme
; Include enum generation rules
; (include dune-enum.sexp)  ; ← COMMENT OUT - disable varcc
```

#### 2.3 Ensure gir_gen enum files are built first

Verify dependency order in dune - enum files must be generated before C compilation.

**File**: `lablgtk4/src/dune-generated.inc` (auto-generated)

Should include:
```scheme
(foreign_stubs
  (language c)
  (names
    ml_gtk_enums_gen
    ml_gdk_enums_gen
    ml_pango_enums_gen
    ; ... other stubs
  )
)
```

#### 2.4 Test build

```bash
cd lablgtk4
dune clean
dune build
```

**Expected result**: Should fail with missing module errors (Gtk4Enums not found) - this is expected and will be fixed in Phase 3.

### Results Summary

✅ **Phase 2 Complete!**

**Changes Made**:
1. ✅ Updated `gir_gen/main.ml` - Removed old enum modules, kept new ones
2. ✅ Disabled varcc in `src/dune` - Commented out `(include dune-enum.sexp)`
3. ✅ Removed varcc C stubs from `src/dune` foreign_stubs
4. ✅ Verified gir_gen enum modules present in `dune-generated.inc`

**Build Test Results**:
- Exit code: 1 (expected - compilation errors)
- **Category A**: 5 C files missing varcc headers (`gdk4_tags.h`, etc.)
  - `ml_event_controller.c`, `ml_gdk.c`, `ml_glib.c`, `ml_gobject.c`, `ml_pango.c`
- **Category B**: 7 test files using old modules (`Gtk4Enums`, etc.)
  - `test_all_enums.ml`, `test_enum_roundtrip.ml`, `test_enum_values.ml`, etc.

All errors match expected patterns from migration plan! ✅

See [phase2_summary.md](phase2_summary.md) for detailed error analysis.

---

## Phase 3: Update Module References (Days 5-8)

### Goal
Replace all references to old enum modules with new ones.

### Tasks

#### 3.1 Create search-and-replace script

**File**: `scripts/update_enum_references.sh`

```bash
#!/bin/bash
# Update enum module references from varcc style to gir_gen style

set -e

SRC_DIR="lablgtk4/src"

# Function to update files
update_file() {
  local file="$1"
  echo "Updating $file..."

  # Gtk4Enums → Gtk_enums
  sed -i 's/Gtk4Enums\.orientation/Gtk_enums.orientation/g' "$file"
  sed -i 's/Gtk4Enums\.align/Gtk_enums.align/g' "$file"
  sed -i 's/Gtk4Enums\.pack_type/Gtk_enums.packtype/g' "$file"
  sed -i 's/Gtk4Enums\.baseline_position/Gtk_enums.baselineposition/g' "$file"
  sed -i 's/Gtk4Enums\.delete_type/Gtk_enums.deletetype/g' "$file"
  sed -i 's/Gtk4Enums\.direction_type/Gtk_enums.directiontype/g' "$file"
  sed -i 's/Gtk4Enums\.icon_size/Gtk_enums.iconsize/g' "$file"
  sed -i 's/Gtk4Enums\.sensitivity_type/Gtk_enums.sensitivitytype/g' "$file"
  sed -i 's/Gtk4Enums\.text_direction/Gtk_enums.textdirection/g' "$file"
  sed -i 's/Gtk4Enums\.justification/Gtk_enums.justification/g' "$file"
  sed -i 's/Gtk4Enums\.message_type/Gtk_enums.messagetype/g' "$file"
  sed -i 's/Gtk4Enums\.movement_step/Gtk_enums.movementstep/g' "$file"
  sed -i 's/Gtk4Enums\.position_type/Gtk_enums.positiontype/g' "$file"
  sed -i 's/Gtk4Enums\.scroll_type/Gtk_enums.scrolltype/g' "$file"
  sed -i 's/Gtk4Enums\.selection_mode/Gtk_enums.selectionmode/g' "$file"
  sed -i 's/Gtk4Enums\.sort_type/Gtk_enums.sorttype/g' "$file"
  sed -i 's/Gtk4Enums\.wrap_mode/Gtk_enums.wrapmode/g' "$file"
  sed -i 's/Gtk4Enums\.policy_type/Gtk_enums.policytype/g' "$file"
  sed -i 's/Gtk4Enums\.corner_type/Gtk_enums.cornertype/g' "$file"
  sed -i 's/Gtk4Enums\.input_purpose/Gtk_enums.inputpurpose/g' "$file"
  sed -i 's/Gtk4Enums\.input_hints/Gtk_enums.inputhints/g' "$file"
  sed -i 's/Gtk4Enums\.size_group_mode/Gtk_enums.sizegroupmode/g' "$file"
  sed -i 's/Gtk4Enums\.stack_transition_type/Gtk_enums.stacktransitiontype/g' "$file"
  sed -i 's/Gtk4Enums\.file_chooser_action/Gtk_enums.filechooseraction/g' "$file"
  sed -i 's/Gtk4Enums\.response/Gtk_enums.responsetype/g' "$file"
  sed -i 's/Gtk4Enums\.tree_view_column_sizing/Gtk_enums.treeviewcolumnsizing/g' "$file"
  sed -i 's/Gtk4Enums\.cell_renderer_mode/Gtk_enums.cellrenderermode/g' "$file"
  sed -i 's/Gtk4Enums\.image_type/Gtk_enums.imagetype/g' "$file"
  sed -i 's/Gtk4Enums\.entry_icon_position/Gtk_enums.entryiconposition/g' "$file"
  sed -i 's/Gtk4Enums\.tree_view_grid_lines/Gtk_enums.treeviewgridlines/g' "$file"
  sed -i 's/Gtk4Enums\.content_fit/Gtk_enums.contentfit/g' "$file"

  # Gdk4Enums → Gdk_enums
  sed -i 's/Gdk4Enums\./Gdk_enums./g' "$file"

  # pangoEnums → Pango_enums
  sed -i 's/pangoEnums\./Pango_enums./g' "$file"

  # GlibEnums → Glib_enums (if exists)
  sed -i 's/GlibEnums\./Glib_enums./g' "$file"

  # GobjectEnums → Gobject_enums (if exists)
  sed -i 's/GobjectEnums\./Gobject_enums./g' "$file"
}

# Update all .ml and .mli files (excluding generated and tools)
find "$SRC_DIR" -name "*.ml" -o -name "*.mli" | \
  grep -v "_build" | \
  grep -v "tools/" | \
  grep -v "Gtk4Enums.ml" | \
  grep -v "gtk_enums.mli" | \
  while read -r file; do
    if grep -q "Gtk4Enums\|Gdk4Enums\|pangoEnums\|GlibEnums\|GobjectEnums" "$file"; then
      update_file "$file"
    fi
  done

echo "✓ Module references updated"
```

#### 3.2 Run the script

```bash
chmod +x scripts/update_enum_references.sh
./scripts/update_enum_references.sh
```

#### 3.3 Manual verification

Check key files that might have been updated:
- Any hand-written widget wrappers in `lablgtk4/src/g*.ml`
- Interface files referencing enum types

```bash
# Find all files that were likely modified
git diff --name-only lablgtk4/src/
```

#### 3.4 Verify type name matches

**CRITICAL**: Check if gir_gen generates concatenated names or snake_case:

```ocaml
(* varcc style - has underscore *)
type pack_type = [ `START | `END ]

(* gir_gen style - might be concatenated *)
type packtype = [ `START | `END ]
```

If names differ, you'll need to either:
- **Option A**: Update gir_gen's `enum_code.ml` to use snake_case names
- **Option B**: Update the sed script above to handle name transformations

Check current gir_gen output:
```bash
head -50 lablgtk4/src/gtk_enums.mli | grep "^type "
```

---

## Phase 3.5: Add GdkPixbuf-2.0.gir Processing (Optional Enhancement)

**Status**: 📋 **OPTIONAL** - Not required for migration completion
**Priority**: Low - Manual converters implemented in Phase 4

### Goal
Extend gir_gen to process GdkPixbuf-2.0.gir and auto-generate GdkPixbuf enum converters.

### Background
Currently, GdkPixbuf enums (interpolation, colorspace, alpha_mode) use manual converters implemented in ml_gdkpixbuf.c. While this works correctly, it would be more maintainable to have gir_gen generate these converters automatically from the GdkPixbuf-2.0.gir file.

### Benefits
- Consistency with other generated enum converters
- Automatic updates when GdkPixbuf API changes
- Reduces manual maintenance burden
- Complete coverage of all GdkPixbuf enums

### Tasks

#### 3.5.1 Update gir_gen to process GdkPixbuf-2.0.gir

**File**: `lablgtk4/src/tools/gir_gen/main.ml`

Add GdkPixbuf-2.0.gir to the list of GIR files to process:

```ocaml
let gir_files = [
  "/usr/share/gir-1.0/Gtk-4.0.gir";
  "/usr/share/gir-1.0/Gdk-4.0.gir";
  "/usr/share/gir-1.0/Pango-1.0.gir";
  "/usr/share/gir-1.0/GdkPixbuf-2.0.gir";  (* ADD THIS *)
  (* ... other GIR files ... *)
]
```

#### 3.5.2 Update module naming

Ensure GdkPixbuf enums are exported in a `gdkpixbuf_enums` module:

```ocaml
let enum_modules = [
  "gtk_enums";
  "gdk_enums";
  "pango_enums";
  "gdkpixbuf_enums";  (* ADD THIS *)
]
```

#### 3.5.3 Expected Output

After processing, gir_gen should generate:
- `gdkpixbuf_enums.mli` - OCaml interface with enum types
- `ml_gdkpixbuf_enums_gen.c` - C converter functions
- Converters added to `generated_forward_decls.h`:
  ```c
  value Val_GdkInterpType(GdkInterpType);
  GdkInterpType GdkInterpType_val(value);
  value Val_GdkColorspace(GdkColorspace);
  GdkColorspace GdkColorspace_val(value);
  ```

#### 3.5.4 Update ml_gdkpixbuf.c

After gir_gen generates the converters, remove the manual implementation:

```c
/* Remove manual implementation from lines 34-66 */
/* Now use generated converters from generated_forward_decls.h */
```

#### 3.5.5 Update gdkPixbuf.mli

Import the generated enum module:

```ocaml
(* At the end of the file *)
include Gdkpixbuf_enums
```

### Status

**Current**: Manual converters work correctly (implemented in Phase 4)
**Future**: This enhancement can be done at any time to improve maintainability

**Note**: This is NOT a blocker for completing the varcc → gir_gen migration. The manual converters are functionally equivalent and well-tested.

---

## Phase 4: Update C Stub References (Days 9-11) ✅ COMPLETE

**Status**: ✅ **COMPLETE** - All varcc function references eliminated
**Summary**: See [phase4_completion_summary.md](phase4_completion_summary.md)
**Build Status**: ✅ Clean build (exit code 0, only pre-existing warnings)

### Goal
Replace C converter macros/functions in hand-written C stubs.

### Completion Summary

**Issues Resolved**:
1. ✅ **ml_gdkpixbuf.c** - Implemented manual GdkInterpType converter to replace `ml_table_interpolation`
2. ✅ **pango.ml** - Removed `ml_pango_get_tables` call, replaced with direct pattern matching

**Key Changes**:
- Manual GdkInterpType enum converter using variant hash pattern (45 lines)
- Replaced Pango variant_table system with direct `weight_to_int` implementation
- All C functions now use gir_gen-style converters or manual equivalents

**Build Result**: Exit code 0 ✅ (no errors, only warnings)

See [phase4_completion_summary.md](phase4_completion_summary.md) for detailed implementation notes.

### Tasks

#### 4.1 Find hand-written C files ✅ COMPLETE

```bash
# List C files not generated by gir_gen
find lablgtk4/src -name "*.c" | grep -v "_gen.c" | grep -v "_build"
```

Expected hand-written C files:
- `ml_glib.c`
- `ml_gobject.c`
- `ml_gdk.c`
- `ml_gdkpixbuf.c`
- `ml_gdk_clipboard.c`
- `ml_pango.c`
- `ml_gtk.c`
- `ml_gtk_snapshot.c`
- `ml_event_controller.c`
- `wrappers.c` (if exists)

#### 4.2 Create C conversion mapping

**Old varcc style** → **New gir_gen style**:

```c
/* varcc macros */
Val_gtk4_align(x)              → Val_GtkAlign(x)
Gtk4_align_val(x)              → GtkAlign_val(x)
Val_gtk4_orientation(x)        → Val_GtkOrientation(x)
Gtk4_orientation_val(x)        → GtkOrientation_val(x)
Val_gtk4_pack_type(x)          → Val_GtkPackType(x)
Gtk4_pack_type_val(x)          → GtkPackType_val(x)

/* Similar for all other enums... */
```

#### 4.3 Create C update script

**File**: `scripts/update_c_enum_converters.sh`

```bash
#!/bin/bash
# Update C enum converter references

set -e

SRC_DIR="lablgtk4/src"

update_c_file() {
  local file="$1"
  echo "Updating $file..."

  # Gtk converters
  sed -i 's/Val_gtk4_align/Val_GtkAlign/g' "$file"
  sed -i 's/Gtk4_align_val/GtkAlign_val/g' "$file"
  sed -i 's/Val_gtk4_orientation/Val_GtkOrientation/g' "$file"
  sed -i 's/Gtk4_orientation_val/GtkOrientation_val/g' "$file"
  sed -i 's/Val_gtk4_pack_type/Val_GtkPackType/g' "$file"
  sed -i 's/Gtk4_pack_type_val/GtkPackType_val/g' "$file"
  sed -i 's/Val_gtk4_baseline_position/Val_GtkBaselinePosition/g' "$file"
  sed -i 's/Gtk4_baseline_position_val/GtkBaselinePosition_val/g' "$file"
  sed -i 's/Val_gtk4_delete_type/Val_GtkDeleteType/g' "$file"
  sed -i 's/Gtk4_delete_type_val/GtkDeleteType_val/g' "$file"
  sed -i 's/Val_gtk4_direction_type/Val_GtkDirectionType/g' "$file"
  sed -i 's/Gtk4_direction_type_val/GtkDirectionType_val/g' "$file"
  sed -i 's/Val_gtk4_icon_size/Val_GtkIconSize/g' "$file"
  sed -i 's/Gtk4_icon_size_val/GtkIconSize_val/g' "$file"
  sed -i 's/Val_gtk4_sensitivity_type/Val_GtkSensitivityType/g' "$file"
  sed -i 's/Gtk4_sensitivity_type_val/GtkSensitivityType_val/g' "$file"
  sed -i 's/Val_gtk4_text_direction/Val_GtkTextDirection/g' "$file"
  sed -i 's/Gtk4_text_direction_val/GtkTextDirection_val/g' "$file"
  sed -i 's/Val_gtk4_justification/Val_GtkJustification/g' "$file"
  sed -i 's/Gtk4_justification_val/GtkJustification_val/g' "$file"
  sed -i 's/Val_gtk4_message_type/Val_GtkMessageType/g' "$file"
  sed -i 's/Gtk4_message_type_val/GtkMessageType_val/g' "$file"
  sed -i 's/Val_gtk4_movement_step/Val_GtkMovementStep/g' "$file"
  sed -i 's/Gtk4_movement_step_val/GtkMovementStep_val/g' "$file"
  sed -i 's/Val_gtk4_position_type/Val_GtkPositionType/g' "$file"
  sed -i 's/Gtk4_position_type_val/GtkPositionType_val/g' "$file"
  sed -i 's/Val_gtk4_scroll_type/Val_GtkScrollType/g' "$file"
  sed -i 's/Gtk4_scroll_type_val/GtkScrollType_val/g' "$file"
  sed -i 's/Val_gtk4_selection_mode/Val_GtkSelectionMode/g' "$file"
  sed -i 's/Gtk4_selection_mode_val/GtkSelectionMode_val/g' "$file"
  sed -i 's/Val_gtk4_sort_type/Val_GtkSortType/g' "$file"
  sed -i 's/Gtk4_sort_type_val/GtkSortType_val/g' "$file"
  sed -i 's/Val_gtk4_wrap_mode/Val_GtkWrapMode/g' "$file"
  sed -i 's/Gtk4_wrap_mode_val/GtkWrapMode_val/g' "$file"
  sed -i 's/Val_gtk4_policy_type/Val_GtkPolicyType/g' "$file"
  sed -i 's/Gtk4_policy_type_val/GtkPolicyType_val/g' "$file"
  sed -i 's/Val_gtk4_corner_type/Val_GtkCornerType/g' "$file"
  sed -i 's/Gtk4_corner_type_val/GtkCornerType_val/g' "$file"
  sed -i 's/Val_gtk4_input_purpose/Val_GtkInputPurpose/g' "$file"
  sed -i 's/Gtk4_input_purpose_val/GtkInputPurpose_val/g' "$file"
  sed -i 's/Val_gtk4_input_hints/Val_GtkInputHints/g' "$file"
  sed -i 's/Gtk4_input_hints_val/GtkInputHints_val/g' "$file"
  sed -i 's/Val_gtk4_size_group_mode/Val_GtkSizeGroupMode/g' "$file"
  sed -i 's/Gtk4_size_group_mode_val/GtkSizeGroupMode_val/g' "$file"
  sed -i 's/Val_gtk4_stack_transition_type/Val_GtkStackTransitionType/g' "$file"
  sed -i 's/Gtk4_stack_transition_type_val/GtkStackTransitionType_val/g' "$file"
  sed -i 's/Val_gtk4_file_chooser_action/Val_GtkFileChooserAction/g' "$file"
  sed -i 's/Gtk4_file_chooser_action_val/GtkFileChooserAction_val/g' "$file"
  sed -i 's/Val_gtk4_response/Val_GtkResponseType/g' "$file"
  sed -i 's/Gtk4_response_val/GtkResponseType_val/g' "$file"
  sed -i 's/Val_gtk4_tree_view_column_sizing/Val_GtkTreeViewColumnSizing/g' "$file"
  sed -i 's/Gtk4_tree_view_column_sizing_val/GtkTreeViewColumnSizing_val/g' "$file"
  sed -i 's/Val_gtk4_cell_renderer_mode/Val_GtkCellRendererMode/g' "$file"
  sed -i 's/Gtk4_cell_renderer_mode_val/GtkCellRendererMode_val/g' "$file"
  sed -i 's/Val_gtk4_image_type/Val_GtkImageType/g' "$file"
  sed -i 's/Gtk4_image_type_val/GtkImageType_val/g' "$file"
  sed -i 's/Val_gtk4_entry_icon_position/Val_GtkEntryIconPosition/g' "$file"
  sed -i 's/Gtk4_entry_icon_position_val/GtkEntryIconPosition_val/g' "$file"
  sed -i 's/Val_gtk4_tree_view_grid_lines/Val_GtkTreeViewGridLines/g' "$file"
  sed -i 's/Gtk4_tree_view_grid_lines_val/GtkTreeViewGridLines_val/g' "$file"
  sed -i 's/Val_gtk4_content_fit/Val_GtkContentFit/g' "$file"
  sed -i 's/Gtk4_content_fit_val/GtkContentFit_val/g' "$file"

  # Update includes - remove varcc headers
  sed -i 's/#include "gtk4_tags.h"/\/\* #include "gtk4_tags.h" - removed, using gir_gen enums \*\//g' "$file"
  sed -i 's/#include "gdk4_tags.h"/\/\* #include "gdk4_tags.h" - removed, using gir_gen enums \*\//g' "$file"
  sed -i 's/#include "pango_tags.h"/\/\* #include "pango_tags.h" - removed, using gir_gen enums \*\//g' "$file"

  # Ensure generated_forward_decls.h is included
  if ! grep -q '#include "generated_forward_decls.h"' "$file"; then
    sed -i '/#include <caml\/custom.h>/a #include "generated_forward_decls.h"' "$file"
  fi
}

# Update hand-written C files
find "$SRC_DIR" -name "*.c" | \
  grep -v "_gen.c" | \
  grep -v "_build" | \
  grep -v "gtk4_tags.c" | \
  grep -v "gdk4_tags.c" | \
  while read -r file; do
    if grep -q "Val_gtk4_\|Gtk4_.*_val\|gtk4_tags.h" "$file"; then
      update_c_file "$file"
    fi
  done

echo "✓ C converter references updated"
```

#### 4.4 Run C update script

```bash
chmod +x scripts/update_c_enum_converters.sh
./scripts/update_c_enum_converters.sh
```

#### 4.5 Update wrappers.h (if needed)

Check if `wrappers.h` defines any varcc-related macros:

```bash
grep -n "gtk4_\|Gtk4" lablgtk4/src/wrappers.h
```

If it does, comment them out or remove them.

---

## Phase 5: Update propcc Tool (Days 12-13) ✅ COMPLETE

**Status**: ✅ **COMPLETE** - propcc and varcc fully removed
**Summary**: See [phase5_completion_summary.md](phase5_completion_summary.md)
**Build Status**: ✅ Clean build (exit code 0)

### Goal
~~Update the propcc property compiler to reference new enum modules.~~
**Actual**: Remove propcc entirely (not used in lablgtk4)

### Completion Summary

**Key Finding**: propcc is NOT used in lablgtk4 (only in lablgtk3)

**Evidence**:
- ✅ No `.props` files exist in lablgtk4 directory tree
- ✅ All code generation done by gir_gen from GIR files
- ✅ propcc only used in legacy lablgtk3 (GTK3 bindings)

**Actions Taken**:
1. ✅ Removed varcc source files (varcc.ml, varcc.ml4)
2. ✅ Removed propcc source files (propcc.ml, propcc.ml4)
3. ✅ Removed build rules from lablgtk4/src/tools/dune
4. ✅ Verified clean build with only gir_gen

**Files Removed**:
- `lablgtk4/src/tools/varcc.ml4` (381 lines)
- `lablgtk4/src/tools/varcc.ml` (381 lines, generated)
- `lablgtk4/src/tools/propcc.ml4` (729 lines)
- `lablgtk4/src/tools/propcc.ml` (1008 lines, generated)
- **Total**: ~2,500 lines removed

**Build Result**: Exit code 0 ✅ (only pre-existing warnings)

See [phase5_completion_summary.md](phase5_completion_summary.md) for full details.

---

## Phase 6: Build and Fix Compilation Errors (Days 14-16)

### Goal
Get a clean compilation with gir_gen enums only.

### Tasks

#### 6.1 Clean build

```bash
cd lablgtk4
dune clean
dune build 2>&1 | tee build_errors.log
```

#### 6.2 Categorize errors

Common error types to expect:

**A. Module not found**:
```
Error: Unbound module Gtk4Enums
```

**Fix**: Missed a reference in OCaml code - grep and update:
```bash
grep -r "Gtk4Enums" lablgtk4/src --include="*.ml" --include="*.mli"
```

**B. Type mismatch**:
```
Error: This expression has type Gtk_enums.orientation
       but an expression was expected of type Gtk4Enums.orientation
```

**Fix**: Some file still references old module - update it.

**C. Undefined reference in C**:
```
undefined reference to `Val_gtk4_align'
```

**Fix**: C file still uses old converter - run the C update script on it.

**D. Type not found**:
```
Error: Unbound type constructor Gtk_enums.pack_type
```

**Fix**: gir_gen might generate `packtype` instead of `pack_type`. Check and adjust:
```bash
grep "type pack" lablgtk4/src/gtk_enums.mli
```

#### 6.3 Iterative fixes

For each error:
1. Identify the file and line number
2. Check if it's an old reference that needs updating
3. Apply fix
4. Rebuild

Keep a log of fixes in `migration_fixes.log`.

#### 6.4 Verify enum name consistency

If you encounter type name mismatches, you may need to either:

**Option A**: Update gir_gen to use snake_case names

**File**: `lablgtk4/src/tools/gir_gen/generate/enum_code.ml`

```ocaml
(* Line 16 - current *)
bprintf buf "type %s = [\n" (String.lowercase_ascii enum.enum_name);

(* Change to use snake_case *)
let snake_case name =
  (* Convert CamelCase to snake_case *)
  let buf = Buffer.create (String.length name + 4) in
  String.iteri (fun i c ->
    if i > 0 && c >= 'A' && c <= 'Z' then
      Buffer.add_char buf '_';
    Buffer.add_char buf (Char.lowercase_ascii c)
  ) name;
  Buffer.contents buf
in
bprintf buf "type %s = [\n" (snake_case enum.enum_name);
```

**Option B**: Accept concatenated names and update all references

Update your sed scripts to transform:
- `pack_type` → `packtype`
- `baseline_position` → `baselineposition`
- etc.

---

## Phase 7: Testing (Days 17-18)

### Goal
Verify the migration didn't break functionality.

### Tasks

#### 7.1 Build test suite

```bash
cd lablgtk4
dune build @all
dune runtest
```

#### 7.2 Test enum conversions manually

Create a test file to verify enum converters work:

**File**: `lablgtk4/tests/test_enum_conversion.ml`

```ocaml
(* Test enum conversions *)

let test_gtk_enums () =
  (* These should compile and work *)
  let _o1 : Gtk_enums.orientation = `HORIZONTAL in
  let _o2 : Gtk_enums.orientation = `VERTICAL in
  let _a : Gtk_enums.align = `FILL in
  let _p : Gtk_enums.packtype = `START in
  Printf.printf "✓ Gtk enum types compile\n"

let test_gdk_enums () =
  (* Test GDK enums if present *)
  Printf.printf "✓ GDK enum types compile\n"

let () =
  test_gtk_enums ();
  test_gdk_enums ();
  Printf.printf "✓ All enum tests passed\n"
```

```bash
dune exec lablgtk4/tests/test_enum_conversion.exe
```

#### 7.3 Test with example programs

Run any example programs that use enums:

```bash
cd lablgtk4/examples
dune build
dune exec ./simple_window.exe  # or whatever examples exist
```

#### 7.4 Verify C stub integration

Check that generated C stubs properly use the enum converters:

```bash
# Pick a generated file that uses enums
cat lablgtk4/src/ml_orientable_gen.c

# Should see:
# GtkOrientation_val(arg1)
# Val_GtkOrientation(result)
```

---

## Phase 8: Cleanup (Days 19-20)

### Goal
Remove varcc infrastructure completely.

### Tasks

#### 8.1 Remove varcc source files

```bash
cd lablgtk4/src/tools
git rm varcc.ml varcc.ml4
```

#### 8.2 Remove .var input files

```bash
cd lablgtk4/src
git rm gtk4_tags.var gdk4_tags.var glib_tags.var pango_tags.var gobject_tags.var gdkpixbuf_tags.var
```

#### 8.3 Remove dune-enum.sexp

```bash
cd lablgtk4/src
git rm dune-enum.sexp
```

#### 8.4 Remove include from main dune file

**File**: `lablgtk4/src/dune`

Remove line:
```scheme
; (include dune-enum.sexp)  ; ← DELETE THIS LINE entirely
```

#### 8.5 Clean up C headers

Remove varcc-generated headers from version control (they were build artifacts):

```bash
cd lablgtk4/src
# These should already be gitignored, but verify:
ls gtk4_tags.h gtk4_tags.c  # Should not exist after dune clean
```

#### 8.6 Update .gitignore (if needed)

Ensure varcc outputs are ignored:

**File**: `lablgtk4/.gitignore`

```
# varcc outputs (legacy - should be removed)
src/*_tags.h
src/*_tags.c
src/*Enums.ml
```

#### 8.7 Remove varcc from dune tools

**File**: `lablgtk4/src/tools/dune`

Remove varcc executable definition (if present).

#### 8.8 Final clean build

```bash
cd lablgtk4
dune clean
dune build
```

Should build successfully without any varcc dependencies.

---

## Phase 9: Documentation (Days 21-22)

### Goal
Document the changes for future maintainers and users.

### Tasks

#### 9.1 Update CHANGES.md

**File**: `CHANGES.md`

```markdown
## [Unreleased]

### Breaking Changes

- **Enum modules renamed**: All enum modules now use lowercase naming convention:
  - `Gtk4Enums` → `Gtk_enums`
  - `Gdk4Enums` → `Gdk_enums`
  - `pangoEnums` → `Pango_enums`
  - `GlibEnums` → `Glib_enums`
  - `GobjectEnums` → `Gobject_enums`

- **Enum generation**: Enums are now generated exclusively by `gir_gen` from GIR files.
  The legacy `varcc` tool has been removed.

- **C converter naming**: C enum converter functions now use GTK naming convention:
  - `Val_gtk4_align()` → `Val_GtkAlign()`
  - `Gtk4_align_val()` → `GtkAlign_val()`

- **Conv module removed**: The `Gtk4Enums.Conv` module has been removed as it was
  not used in the codebase.

### Migration Guide

If you have code using old enum modules:

```ocaml
(* Before *)
let o : Gtk4Enums.orientation = `HORIZONTAL

(* After *)
let o : Gtk_enums.orientation = `HORIZONTAL
```

If you have C code using old converters:

```c
/* Before */
gtk_orientable_set_orientation(widget, Gtk4_orientation_val(value));

/* After */
gtk_orientable_set_orientation(widget, GtkOrientation_val(value));
```

### Improvements

- All GTK4, GDK4, and Pango enums are now automatically generated (139+ types)
- Enum coverage is comprehensive and stays synchronized with GTK releases
- Simpler build system with fewer code generation tools
```

#### 9.2 Update README

**File**: `README.md`

Update any references to varcc or enum generation:

```markdown
## Code Generation

LablGTK4 uses `gir_gen` to automatically generate OCaml bindings from GObject
Introspection (GIR) files. This includes:

- Widget classes and interfaces
- Enumerations and bitfield types
- C FFI stubs
- High-level OCaml wrappers

To regenerate bindings after GTK updates:

```bash
dune exec src/tools/gir_gen/main.exe -- /usr/share/gir-1.0/Gtk-4.0.gir src
dune build
```
```

#### 9.3 Create migration guide

**File**: `docs/enum_migration_guide.md`

```markdown
# Enum Migration Guide: varcc → gir_gen

This guide is for developers who have existing LablGTK4 code using the old
enum module naming convention.

## Module Name Changes

| Old Name | New Name |
|----------|----------|
| `Gtk4Enums` | `Gtk_enums` |
| `Gdk4Enums` | `Gdk_enums` |
| `pangoEnums` | `Pango_enums` |
| `GlibEnums` | `Glib_enums` |
| `GobjectEnums` | `Gobject_enums` |

## Type Name Changes

Some enum type names have changed from snake_case to concatenated lowercase:

| Old Name | New Name |
|----------|----------|
| `pack_type` | `packtype` |
| `baseline_position` | `baselineposition` |
| `delete_type` | `deletetype` |
(etc...)

## Updating Your Code

### OCaml Code

Search and replace in your .ml files:

```bash
sed -i 's/Gtk4Enums\./Gtk_enums./g' *.ml
sed -i 's/Gdk4Enums\./Gdk_enums./g' *.ml
```

### C Code

Update C converter function calls:

```bash
sed -i 's/Val_gtk4_/Val_Gtk/g' *.c
sed -i 's/Gtk4_\([a-z_]*\)_val/Gtk\u\1_val/g' *.c
```

And include the new header:

```c
#include "generated_forward_decls.h"
```

Instead of:

```c
#include "gtk4_tags.h"
```

## Support

If you encounter issues during migration, please file an issue on GitHub.
```

#### 9.4 Update build documentation

**File**: `lablgtk4/src/tools/README_GIR_GEN.md`

Update to reflect that gir_gen now handles all enums:

```markdown
## Output Files

- `ml_event_controllers_gen.c`: C FFI bindings for all classes
- `<class_name>.mli`: OCaml interface for each class (snake_case)
- `gtk_enums.mli`: Generated enum and bitfield types (ALL GTK4 enums)
- `gdk_enums.mli`: Generated GDK4 enum types
- `pango_enums.mli`: Generated Pango enum types
- `ml_gtk_enums_gen.c`: C converter functions for Gtk enums
- `ml_gdk_enums_gen.c`: C converter functions for GDK enums
- `ml_pango_enums_gen.c`: C converter functions for Pango enums
```

---

## Phase 10: Final Verification (Days 23-24)

### Goal
Ensure everything works and is properly documented.

### Tasks

#### 10.1 Full rebuild from scratch

```bash
cd lablgtk4
git clean -fdx
dune build
```

Should build successfully with no varcc dependencies.

#### 10.2 Run full test suite

```bash
dune runtest
dune build @all
```

#### 10.3 Test examples

```bash
cd examples
dune build
# Run each example program to verify they work
```

#### 10.4 Check git status

```bash
git status
```

Should show:
- Deleted: varcc files, .var files, dune-enum.sexp
- Modified: dune files, any hand-written code that referenced old enums
- Clean: No unexpected changes

#### 10.5 Create migration summary

**File**: `enum_migration_summary.md`

```markdown
# Enum Migration Summary

**Date Completed**: [DATE]
**Duration**: [DAYS]

## Changes Made

### Deleted Files
- `src/tools/varcc.ml`, `varcc.ml4` - Legacy enum generator
- `src/gtk4_tags.var` and 5 other .var files - Manual enum definitions
- `src/dune-enum.sexp` - varcc build rules

### Modified Files
- `src/dune` - Removed varcc include
- `src/tools/gir_gen/main.ml` - Updated module list
- [List other modified files]

### Generated Files (new/updated)
- `src/gtk_enums.mli` - 139 enum types
- `src/gdk_enums.mli` - 20+ enum types
- `src/pango_enums.mli` - 20+ enum types
- `src/ml_gtk_enums_gen.c` - Converter functions
- [etc.]

## Test Results

- ✅ Full build successful
- ✅ Test suite passes
- ✅ Example programs work
- ✅ Enum conversions verified

## Coverage

All 31 legacy varcc enums are now generated by gir_gen:

| varcc enum | gir_gen enum | Status |
|------------|--------------|--------|
| align | align | ✅ Match |
| orientation | orientation | ✅ Match |
| pack_type | packtype | ✅ (renamed) |
[etc...]

## Known Issues

[List any known issues or edge cases]

## Future Work

- Consider adding enum documentation from GIR
- Optimize enum converter performance if needed
- Add enum validation tests
```

---

## Rollback Plan

If migration fails and you need to rollback:

### Quick Rollback

```bash
# Revert all changes
git reset --hard HEAD

# Restore working state
dune clean
dune build

# Re-enable varcc
cd lablgtk4/src
# Uncomment: (include dune-enum.sexp) in dune
dune build
```

### Partial Rollback

If only specific namespaces fail:

1. Keep gir_gen for working namespaces (e.g., Gtk)
2. Re-enable varcc for problematic namespaces (e.g., Gdk)
3. Add conditional includes in dune

```scheme
; Gtk uses gir_gen, Gdk still uses varcc temporarily
(include dune-enum-gdk.sexp)  ; Just GDK varcc rules
```

---

## Risk Mitigation

### Create backup branch

Before starting:

```bash
git checkout -b backup-before-enum-migration
git push origin backup-before-enum-migration
git checkout main  # or your working branch
```

### Incremental commits

Commit after each phase:

```bash
git commit -m "Phase 1: Verify enum coverage"
git commit -m "Phase 2: Update build system"
git commit -m "Phase 3: Update OCaml references"
# etc.
```

This allows fine-grained rollback if needed.

### Test continuously

Don't wait until the end - test after each phase:

```bash
dune build 2>&1 | tee phase_N_build.log
```

Keep logs for debugging.

---

## Success Criteria

Migration is successful when:

- ✅ `dune build` completes without errors
- ✅ `dune runtest` passes
- ✅ No varcc files remain in source tree
- ✅ All 31 legacy enums work via gir_gen
- ✅ Example programs run correctly
- ✅ C enum converters work in hand-written stubs
- ✅ Documentation is updated
- ✅ Git history is clean and well-documented

---

## Timeline Summary

| Phase | Duration | Key Deliverable |
|-------|----------|-----------------|
| 1. Verify Coverage | 2 days | Coverage report |
| 2. Update Build | 2 days | Modified dune files |
| 3. Update OCaml Refs | 4 days | Updated .ml/.mli files |
| 4. Update C Refs | 3 days | Updated .c files |
| 5. Update propcc | 2 days | Updated tool |
| 6. Build & Fix | 3 days | Clean compilation |
| 7. Testing | 2 days | Test results |
| 8. Cleanup | 2 days | Removed varcc |
| 9. Documentation | 2 days | Migration guide |
| 10. Verification | 2 days | Final sign-off |
| **Total** | **24 days** | **Complete migration** |

Adjust timeline based on actual findings - might be faster if enums all match!

---

## Support

If you encounter issues:

1. Check the `enum_mapping.txt` for name mismatches
2. Review build logs in `build_errors.log`
3. Consult `enum_migration_analysis.md` for detailed comparison
4. File issues on GitHub with specific error messages

Good luck! 🚀
