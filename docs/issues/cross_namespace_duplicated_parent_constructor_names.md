# Cross-Namespace Duplicated Parent Constructor Names

## Status
**Open** - Investigation complete, awaiting implementation decision

## Summary

Layer1 class files are being generated with repeated constructor names in the polymorphic `type t` used to define their parent classes. This affects classes whose parent is from an external namespace (e.g., Gdk, Gio, Gsk) when that external class has the same base name as the Gtk class.

## Affected Classes

| GTK Class | Parent Class | Generated Type |
|-----------|--------------|----------------|
| `Gtk.Snapshot` | `Gdk.Snapshot` | `` [`snapshot \| `snapshot \| ...] Gobject.obj `` |
| `Gtk.Application` | `Gio.Application` | `` [`application \| `application \| ...] Gobject.obj `` |
| `Gtk.MountOperation` | `Gio.MountOperation` | `` [`mount_operation \| ...] Gobject.obj `` |

## Root Cause

The bug is in `ocgtk/src/tools/gir_gen/gir_gen.ml` in the `parent_chain_for_class` function (lines 566-574).

### Detailed Analysis

1. **Parent Table Population** (lines 558-564):
   - Classes parsed from GIR have `class_name` without namespace (e.g., `"Snapshot"`)
   - Parent names include namespace (e.g., `"Gdk.Snapshot"`)
   - `normalize_class_name` strips namespace prefix from both
   - Result: `parent_table["Snapshot"] = Some "Snapshot"` - a false self-reference!

2. **Parent Chain Lookup** (lines 566-574):
   ```ocaml
   let parent_chain_for_class name =
     let rec aux current depth =
       if depth > 100 then []
       else
         match Hashtbl.find_opt parent_table current with
         | Some (Some parent) -> parent :: aux parent (depth + 1)
         | _ -> []
     in
     aux (Gir_gen_lib.Utils.normalize_class_name name) 0
   ```

3. **The Infinite Cycle:**
   - Lookup `"Snapshot"` → returns `"Snapshot"` (normalized from `Gdk.Snapshot`)
   - Recurse with `"Snapshot"` → returns `"Snapshot"` again
   - Produces `["Snapshot"; "Snapshot"; "Snapshot"; ...]` until depth limit (100)

4. **Variant Generation** (`layer1_helpers.ml`):
   - Converts each `"Snapshot"` to `` `snapshot ``
   - Result: `type t = [`snapshot | `snapshot | `snapshot | ...] Gobject.obj`

### Key Code Path

```
gir_gen.ml:parent_chain_for_class
  → layer1_main.ml:generate_combined_module_entity
    → layer1_helpers.ml:detect_class_hierarchy_names
      → layer1_helpers.ml:build_parent_chain_variants
```

## Proposed Solution: Consistent Namespace-Prefixed Variant Names

Use namespace prefixes for **all** polymorphic variant constructor names:

```ocaml
(* Before (broken) *)
type t = [`snapshot | `snapshot | ...] Gobject.obj

(* After (fixed) *)
type t = [`gtk_snapshot | `gdk_snapshot | `initially_unowned | `object_] Gobject.obj
```

### Benefits

1. **Consistent** - Every class uses the same naming convention
2. **Correct subtyping** - `` `gtk_snapshot <: `gdk_snapshot <: `initially_unowned <: `object_``
3. **Matches GTK's type system** - GType names are already namespace-qualified
4. **No collision ambiguity** - `Gtk.Snapshot` vs `Gdk.Snapshot` are clearly distinct

### Why Hybrid Approach Was Rejected

A hybrid approach (prefixing only external namespace classes) would create inconsistencies:

```ocaml
(* Internal parent - no prefix *)
type t = [`button | `widget | ...] Gobject.obj

(* External parent - prefixed *)  
type t = [`snapshot | `gdk_snapshot | ...] Gobject.obj
```

This makes types incompatible when methods from different classes expect the same external type. For example, if a method returns `Gdk.Snapshot`, passing a `Gtk.Snapshot` would fail because the variant names don't align.

## Implementation Changes Required

### 1. `utils.ml` - Add namespaced variant name function
```ocaml
let variant_name_for_class full_name =
  (* Extract namespace and class name, combine with underscore *)
  (* "Gtk.Snapshot" -> "gtk_snapshot" *)
  (* "Gdk.Snapshot" -> "gdk_snapshot" *)
```

### 2. `gir_gen.ml` - Store full namespaced names in parent_table
```ocaml
(* Lines 558-564 *)
(* Key should include namespace to differentiate classes from different namespaces *)
```

### 3. `hierarchy_detection.ml` - Update hierarchy definitions
```ocaml
(* Lines 6-11 *)
(* Base hierarchy definitions should use prefixed names *)
let base_hierarchy_definitions = [
  (WidgetHierarchy, "Gtk.Widget", "gtk_widget", "as_widget");
  (EventControllerHierarchy, "Gtk.EventController", "gtk_event_controller", "as_event_controller");
  (* etc. *)
]
```

### 4. `layer1_helpers.ml` - Use prefixed variant names
```ocaml
(* build_parent_chain_variants and build_hierarchy_variants *)
(* Should use variant_name_for_class instead of to_snake_case normalize_class_name *)
```

## Open Questions

1. **Internal namespace prefix**: Should GTK internal classes use `gtk_` prefix (matching GIR) or remain unprefixed for brevity?
   - Consistency suggests always prefixing with namespace
   - Verbosity tradeoff for common types like `GtkWidget`

2. **Separator format**: Which format is preferred?
   - Single underscore: `` `gtk_snapshot ``
   - Double underscore: `` `gtk__snapshot `` (clearer namespace separation)

3. **Hierarchy root names**: Should `hierarchy_detection.ml` roots use prefixed names?
   - Current: `` `widget ``
   - Proposed: `` `gtk_widget ``

4. **Backward compatibility**: This is a breaking change for existing OCaml code using these types. Migration strategy needed?

## Investigation Files

- Root cause: `ocgtk/src/tools/gir_gen/gir_gen.ml` lines 558-574
- Variant generation: `ocgtk/src/tools/gir_gen/generate/layer1/layer1_helpers.ml` lines 17-80
- Normalization: `ocgtk/src/tools/gir_gen/utils.ml` lines 131-148

## Related Issues

- External namespace parent handling in type resolution
- Cross-namespace method parameter types