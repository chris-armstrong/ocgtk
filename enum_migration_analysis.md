# Enum and Bitfield Migration Analysis: varcc → gir_gen

**Date**: 2025-12-01
**Status**: Analysis Complete - Planning Phase

## Executive Summary

Currently, lablgtk4 uses **two parallel systems** for enum/bitfield generation:
- **varcc**: Manual `.var` files → 31 curated enums → `Gtk4Enums.ml` modules with Conv wrapper
- **gir_gen**: Automatic GIR parsing → 139+ enums → `gtk_enums.mli` type definitions with direct C converters

Both systems work, but maintaining two approaches creates duplication and complexity. This document analyzes what prevents full migration to gir_gen.

---

## Current State

### What varcc Generates

**Input**: Manual `.var` files (gtk4_tags.var, gdk4_tags.var, glib_tags.var, pango_tags.var, gobject_tags.var, gdkpixbuf_tags.var)

**Scope**: 31 manually curated enums and bitfields across all namespaces

**Outputs**:

1. **OCaml Module**: `{Package}Enums.ml` (e.g., `Gtk4Enums.ml`, `Gdk4Enums.ml`)
   ```ocaml
   type align = [ `FILL | `START | `END | `CENTER | `BASELINE ]
   type orientation = [ `HORIZONTAL | `VERTICAL ]

   module Conv = struct
     external _get_tables : unit ->
       align variant_table * orientation variant_table * ...
       = "ml_gtk4_get_tables"

     let align_tbl, orientation_tbl, ... = _get_tables ()
     let align = Gobject.Data.enum align_tbl
     let orientation = Gobject.Data.enum orientation_tbl
   end
   ```

2. **C Header**: `{namespace}_tags.h` with macros
   ```c
   #define MLTAG_FILL ((value)(779916931*2+1))
   #define Val_gtk4_align(data) lookup_from_c_direct(ml_table_gtk4_align, data)
   #define Gtk4_align_val(key) lookup_to_c_direct(ml_table_gtk4_align, key)
   ```

3. **C Implementation**: `{namespace}_tags.c` with lookup tables
   ```c
   const lookup_info ml_table_gtk4_align[] = {
     { 0, 5 },  // length
     { MLTAG_BASELINE, GTK_ALIGN_BASELINE },
     { MLTAG_END, GTK_ALIGN_END },
     // ... sorted by hash for binary search
   };

   CAMLprim value ml_gtk4_get_tables() {
     // Returns tuple of all tables
   }
   ```

**Key Features**:
- Uses **lookup tables** with binary search (efficient for OCaml→C)
- Provides **Conv module** for integration with `Gobject.Data.enum`
- Returns **tuple of all tables** via single FFI call
- **Hash-based** polymorphic variant representation
- Designed for **manual curation** - only includes needed enums

---

### What gir_gen Generates

**Input**: GIR XML files (Gtk-4.0.gir, Gdk-4.0.gir, Pango-1.0.gir)

**Scope**: 139+ enums and numerous bitfields automatically discovered

**Outputs**:

1. **OCaml Interface**: `{namespace}_enums.mli` (e.g., `gtk_enums.mli`)
   ```ocaml
   type align = [
     | `FILL
     | `START
     | `END
     | `CENTER
     | `BASELINE
   ]

   type orientation = [
     | `HORIZONTAL
     | `VERTICAL
   ]

   (* No Conv module - converters are C-only *)
   ```

2. **C Implementation**: `ml_{namespace}_enums_gen.c` with direct functions
   ```c
   value Val_GtkAlign(GtkAlign val) {
     switch (val) {
       case GTK_ALIGN_FILL: return caml_hash_variant("FILL");
       case GTK_ALIGN_START: return caml_hash_variant("START");
       // ...
       default: caml_failwith("Unknown GtkAlign value");
     }
   }

   GtkAlign GtkAlign_val(value val) {
     if (val == caml_hash_variant("FILL")) return GTK_ALIGN_FILL;
     else if (val == caml_hash_variant("START")) return GTK_ALIGN_START;
     // ... if-else chain
     else caml_failwith("Unknown GtkAlign tag");
   }
   ```

3. **Forward Declarations**: `generated_forward_decls.h`
   ```c
   value Val_GtkAlign(GtkAlign val);
   GtkAlign GtkAlign_val(value val);
   value Val_GtkOrientation(GtkOrientation val);
   GtkOrientation GtkOrientation_val(value val);
   ```

**Key Features**:
- Uses **direct functions** with if-else chains
- **No OCaml-visible converters** - C-only API
- Each enum is **standalone** (no table tuple)
- **Complete coverage** of all GIR enums
- Designed for **automatic generation** - includes everything

---

## Key Differences Preventing Full Migration

### 1. **Naming Convention Mismatch**

| Aspect | varcc | gir_gen |
|--------|-------|---------|
| Module name | `Gtk4Enums` | `Gtk_enums` |
| Type names | `align`, `orientation` | `align`, `orientation` |
| C converter | `Val_gtk4_align()`, `Gtk4_align_val()` | `Val_GtkAlign()`, `GtkAlign_val()` |

**Impact**: Existing code references `Gtk4Enums.Conv.align` which doesn't exist in gir_gen output.

---

### 2. **Converter Architecture**

**varcc - Lookup Table Approach**:
```c
// Efficient binary search for OCaml→C conversion
const lookup_info ml_table_gtk4_align[] = {
  { 0, 5 },  // table metadata
  { MLTAG_FILL, GTK_ALIGN_FILL },      // sorted by hash
  { MLTAG_START, GTK_ALIGN_START },
  // ...
};

// Macro wrapping binary search function
#define Gtk4_align_val(key) lookup_to_c_direct(ml_table_gtk4_align, key)
```

**Pros**:
- Binary search is O(log n)
- Shared lookup infrastructure (wrappers.h)
- Compact generated code

**Cons**:
- More complex to generate
- Requires maintaining hash ordering

**gir_gen - Direct Function Approach**:
```c
// Simple if-else chain
GtkAlign GtkAlign_val(value val) {
  if (val == caml_hash_variant("FILL")) return GTK_ALIGN_FILL;
  else if (val == caml_hash_variant("START")) return GTK_ALIGN_START;
  else if (val == caml_hash_variant("END")) return GTK_ALIGN_END;
  // ...
  else caml_failwith("Unknown GtkAlign tag");
}
```

**Pros**:
- Simple to generate
- Easy to read/debug
- No ordering requirements

**Cons**:
- Linear search is O(n) - but n is typically small (5-20 values)
- More verbose C code
- Repeated hash computation

**Reality**: For typical enum sizes (5-20 values), performance difference is negligible. Modern CPUs handle small linear searches efficiently.

---

### 3. **OCaml API Differences**

**varcc provides Conv module**:
```ocaml
(* Used in existing code *)
let converter = Gtk4Enums.Conv.align
let () = Gobject.Data.set_enum converter property_value
```

**gir_gen has no OCaml API**:
```ocaml
(* Type definitions only - no converters exposed to OCaml *)
external set_orientation : t -> Gtk_enums.orientation -> unit = "ml_gtk_orientable_set_orientation"
```

**Impact**:
- Hand-written code using `Gobject.Data.enum` needs the Conv module
- Generated FFI stubs use C converters directly - doesn't need Conv module

---

### 4. **Coverage and Curation**

**varcc - 31 Curated Enums**:
- Manually selected "important" enums
- Includes some enums that might not be in GIR classes (utility enums)
- Grouped by namespace: Gtk4 (31), Gdk4 (some), Pango (some), etc.

**gir_gen - 139+ Comprehensive Enums**:
- All enums found in GIR files
- Some are rarely used or for advanced features
- Automatically organized by namespace

**Examples of varcc enums**:
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

**Examples of gir_gen-only enums**:
```
accessibleannouncementpriority, accessibleautocomplete,
accessibleinvalidstate, accessibleplatformstate, accessibleproperty,
accessiblerelation, accessiblerole, accessiblesort, accessiblestate,
buildererror, cellrendereraccelmode, constraintattribute,
eventtypegeometrychange, filterchange, filterpattern, ...
```

---

### 5. **Integration Points**

**Existing code uses varcc enums in two ways**:

1. **Via Conv module** (hand-written OCaml code):
   ```ocaml
   (* gobject.ml or similar *)
   let enum_converter = Gtk4Enums.Conv.orientation
   ```

2. **Via C macros** (hand-written C FFI):
   ```c
   /* ml_gtk.c or similar */
   gtk_orientable_set_orientation(widget, Gtk4_orientation_val(ml_value));
   ```

**Generated code uses gir_gen enums**:

1. **Via C functions** (generated C stubs):
   ```c
   /* ml_orientable_gen.c */
   gtk_orientable_set_orientation(
     GtkOrientable_val(self),
     GtkOrientation_val(arg1)  // Direct function call
   );
   ```

2. **Via type definitions** (generated OCaml interfaces):
   ```ocaml
   (* orientable.mli *)
   external set_orientation : t -> Gtk_enums.orientation -> unit = "ml_gtk_orientable_set_orientation"
   ```

---

## File and Build System Overview

### varcc Build Process

**Defined in**: `lablgtk4/src/dune-enum.sexp`

```scheme
(rule
 (targets gtk4_tags_raw.h gtk4_tags_raw.c Gtk4Enums.ml)
 (deps %{project_root}/src/tools/varcc.exe)
 (action (run %{project_root}/src/tools/varcc.exe
          -h gtk4_tags_raw.h
          -c gtk4_tags_raw.c
          %{dep:gtk4_tags.var})))
```

**Process**:
1. varcc.exe reads `gtk4_tags.var`
2. Generates `Gtk4Enums.ml` (OCaml module)
3. Generates `gtk4_tags_raw.h` and `gtk4_tags_raw.c`
4. Post-processing adds includes: `#include "wrappers.h"`

**Included in**: `lablgtk4/src/dune` via `(include dune-enum.sexp)`

---

### gir_gen Build Process

**Defined in**: `lablgtk4/src/tools/gir_gen/main.ml` function `generate_enum_files`

**Process**:
1. gir_gen parses GIR XML files
2. Extracts all `<enumeration>` and `<bitfield>` elements
3. Generates `{namespace}_enums.mli` (type definitions only)
4. Generates `ml_{namespace}_enums_gen.c` (converter functions)
5. Adds forward declarations to `generated_forward_decls.h`

**Generated files**:
- `gtk_enums.mli` - 139 enum types
- `gdk_enums.mli` - 20+ enum types
- `pango_enums.mli` - 20+ enum types
- `ml_gtk_enums_gen.c` - 215KB of C converter functions
- `ml_gdk_enums_gen.c`
- `ml_pango_enums_gen.c`

**Included in**: `lablgtk4/src/dune-generated.inc` (generated by gir_gen)

---

## Usage Examples

### Using varcc Enums (Current Hand-Written Code)

```ocaml
(* gBox.ml - hand-written wrapper *)
class box_skel (obj : Box.t) = object (self)
  inherit GObj.widget_impl (Box.as_widget obj)

  method set_orientation o =
    Box.set_orientation obj o  (* o is Gtk4Enums.orientation *)
end

(* Somewhere in Gobject module *)
module Data = struct
  let enum = Gobject.Data.enum

  (* Used like: *)
  let orientation_prop =
    Data.enum Gtk4Enums.Conv.orientation
end
```

**C side** (hand-written stubs):
```c
/* ml_gtk.c */
CAMLprim value ml_gtk_box_set_orientation(value box, value orientation) {
  gtk_orientable_set_orientation(
    GTK_ORIENTABLE(GtkWidget_val(box)),
    Gtk4_orientation_val(orientation)  // varcc macro
  );
  return Val_unit;
}
```

---

### Using gir_gen Enums (Current Generated Code)

```ocaml
(* orientable.mli - generated interface *)
type t = Gtk.widget

external set_orientation : t -> Gtk_enums.orientation -> unit
  = "ml_gtk_orientable_set_orientation"
```

**C side** (generated stub):
```c
/* ml_orientable_gen.c */
CAMLexport CAMLprim value ml_gtk_orientable_set_orientation(value self, value arg1)
{
  CAMLparam2(self, arg1);

  gtk_orientable_set_orientation(
    GtkOrientable_val(self),
    GtkOrientation_val(arg1)  // gir_gen function
  );

  CAMLreturn(Val_unit);
}
```

**Forward declaration**:
```c
/* generated_forward_decls.h */
value Val_GtkOrientation(GtkOrientation val);
GtkOrientation GtkOrientation_val(value val);
```

---

## What Would Be Needed for Full Migration

### Option A: Extend gir_gen to Generate varcc-Compatible Output

**Goal**: Make gir_gen produce `Gtk4Enums.ml`-style modules with Conv wrapper.

**Changes Required**:

1. **Generate .ml implementation files** (currently only generates .mli)
   - Add `{namespace}_enums.ml` output to `generate_enum_files()` in main.ml
   - Include Conv module with table accessors

2. **Generate lookup tables in C** (currently generates direct functions)
   - Extend `enum_code.ml` to emit varcc-style tables
   - Add `ml_{namespace}_get_tables()` function
   - Sort entries by hash for binary search

3. **Generate C macros** (currently generates function prototypes)
   - Add `Val_{namespace}_{enum}` and `{Namespace}_{enum}_val` macros
   - Use `lookup_from_c_direct` and `lookup_to_c_direct`

4. **Update module naming**
   - Change from `gtk_enums` to `Gtk_enums` or `Gtk4Enums`
   - Update all references in generated code

**Pros**:
- Maximum compatibility with existing code
- Preserves efficient lookup table approach
- Single source of truth (GIR files)

**Cons**:
- Significant gir_gen changes required
- More complex generation code
- Larger generated code size (tables + functions)

---

### Option B: Migrate Existing Code to Use gir_gen Style

**Goal**: Update hand-written code to use `gtk_enums` and direct C functions.

**Changes Required**:

1. **Update hand-written OCaml modules**
   - Change `Gtk4Enums.Conv.align` → `Gtk_enums.align` (just the type)
   - Remove uses of Conv module (if any)
   - Update import statements

2. **Update hand-written C stubs**
   - Change `Gtk4_orientation_val()` → `GtkOrientation_val()`
   - Change `Val_gtk4_align()` → `Val_GtkAlign()`
   - Include `generated_forward_decls.h`

3. **Remove varcc infrastructure**
   - Delete `dune-enum.sexp`
   - Delete `.var` files
   - Remove varcc.exe build rules

4. **Handle missing enums**
   - Verify all 31 varcc enums exist in gir_gen output
   - Add any missing enums to GIR parsing if needed

**Pros**:
- Simpler architecture (one generation system)
- Automatic coverage of new GTK enums
- Less code to maintain

**Cons**:
- Manual migration effort for hand-written code
- Need to handle any enum naming mismatches
- Loss of Conv module convenience (if actively used)

---

### Option C: Hybrid Approach (Recommended)

**Goal**: Use gir_gen for all generation, but add compatibility layer.

**Phase 1: Add Conv Module Generation to gir_gen**

1. Extend `generate_enum_files()` to produce `.ml` files:
   ```ocaml
   (* gtk_enums.ml - generated *)
   type align = [ `FILL | `START | `END | `CENTER | `BASELINE ]
   (* ... all type definitions ... *)

   module Conv = struct
     (* Auto-generated wrappers if needed for Gobject.Data.enum *)
   end
   ```

2. Keep direct C functions (don't generate tables):
   - Simpler to maintain
   - Performance difference negligible for small enums
   - Already working in generated code

**Phase 2: Add Compatibility Aliases**

```ocaml
(* gtk4_compat.ml - compatibility layer *)
module Gtk4Enums = Gtk_enums
module Gdk4Enums = Gdk_enums
(* etc. *)
```

**Phase 3: Gradual Migration**

1. Update references in hand-written code over time
2. Use deprecation warnings to guide migration
3. Remove compatibility layer in next major version

**Pros**:
- Smooth migration path
- Backward compatibility during transition
- Leverages existing gir_gen infrastructure
- Simple to implement

**Cons**:
- Temporary duplication (aliases)
- Need to plan deprecation timeline

---

## Risk Analysis

### High Risk: Breaking Existing Code

**Affected Code**:
- Hand-written widget wrappers (gBox.ml, gWindow.ml, etc.)
- Hand-written C stubs (ml_gtk.c, ml_gdk.c, etc.)
- User code depending on `Gtk4Enums` module names

**Mitigation**:
- Maintain compatibility aliases during transition
- Comprehensive testing after migration
- Clear migration guide for users

---

### Medium Risk: Enum Naming Mismatches

**Issue**: varcc uses manually written names, GIR uses GTK's official names.

**Example potential mismatch**:
- varcc: `position_type`
- GIR: `positiontype` (concatenated)

**Mitigation**:
- Audit all 31 varcc enums against GIR output
- Add name normalization if needed
- Test all enum conversions

---

### Low Risk: Performance Regression

**Issue**: If-else chains might be slower than binary search for large enums.

**Analysis**:
- Most enums have 5-20 values
- CPU branch prediction handles small chains well
- Generated stubs already use if-else approach successfully

**Mitigation**:
- Profile if concerned
- Can add lookup table generation later if needed

---

## Recommendation Summary

**Best Path Forward**: **Option C - Hybrid Approach**

1. **Immediate** (Week 1-2):
   - Extend gir_gen to generate `.ml` implementations with Conv module
   - Add compatibility aliases (Gtk4Enums → Gtk_enums)
   - Test generated enum modules compile and work

2. **Short-term** (Month 1):
   - Migrate generated code to use new enum modules
   - Update hand-written C stubs to use new converter names
   - Keep varcc as fallback

3. **Medium-term** (Month 2-3):
   - Update hand-written OCaml modules
   - Remove varcc dependencies
   - Add deprecation warnings for old names

4. **Long-term** (Next major version):
   - Remove compatibility aliases
   - Delete varcc code and .var files
   - Full gir_gen only

---

## Open Questions for Decision

1. **Module naming**: Keep `Gtk4Enums` style or switch to `Gtk_enums`?

2. **Conv module**: Is the Conv module actively used in hand-written code, or only in generated code?

3. **Performance**: Do any hot paths use enum conversions where O(log n) vs O(n) matters?

4. **Enum coverage**: Are there any varcc enums NOT in GIR that need manual additions?

5. **Timeline**: What's the migration deadline? Next release? When convenient?

6. **Backward compatibility**: How important is it to maintain old enum module names?

---

## Appendix: File Locations

### varcc Files
- Tool: `lablgtk4/src/tools/varcc.ml`
- Input: `lablgtk4/src/gtk4_tags.var` (and others)
- Build: `lablgtk4/src/dune-enum.sexp`
- Output: `_build/default/src/Gtk4Enums.ml`, `gtk4_tags.c`, `gtk4_tags.h`

### gir_gen Files
- Tool: `lablgtk4/src/tools/gir_gen/main.ml`
- Generator: `lablgtk4/src/tools/gir_gen/generate/enum_code.ml`
- Input: `/usr/share/gir-1.0/Gtk-4.0.gir` (system files)
- Output: `lablgtk4/src/gtk_enums.mli`, `ml_gtk_enums_gen.c`, `generated_forward_decls.h`

### Integration Files
- Forward decls: `lablgtk4/src/generated_forward_decls.h`
- Build config: `lablgtk4/src/dune-generated.inc`
- Example usage: `lablgtk4/src/orientable.mli`, `ml_orientable_gen.c`
