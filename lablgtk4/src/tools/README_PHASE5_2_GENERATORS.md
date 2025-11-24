# Phase 5.2 Code Generators

Comprehensive code generation tools for automating LablGTK4 widget bindings.

## Overview

Phase 5.2 extends the code generation infrastructure with three main tools:

1. **gir_gen** (enhanced) - Generates C FFI bindings and .mli files with full property support
2. **wrapper_gen** (new) - Generates high-level wrapper class templates
3. **ml_impl_gen** (new) - Generates .ml implementation files from .mli interfaces

Together, these tools automate ~90% of the code needed for widget bindings.

## Tools

### 1. gir_gen - GIR Code Generator (Enhanced for Phase 5.2)

**Purpose**: Generate C FFI bindings and OCaml .mli interface files from GObject Introspection files.

**Phase 5.2 Enhancements**:
- ✅ Removed 5-method limitation - now generates ALL methods
- ✅ C property getter/setter generation using g_object_get/g_object_set
- ✅ Widget type conversion macros (GtkWidget_val)
- ✅ Improved output with method and property counts

**Usage**:
```bash
# Build the generator
dune build src/tools/gir_gen/main.exe

# Generate widget bindings
./_build/default/src/tools/gir_gen/main.exe \
  -m widgets \
  -f src/tools/widget_filter.conf \
  /usr/share/gir-1.0/Gtk-4.0.gir \
  ./output

# Generate event controller bindings
./_build/default/src/tools/gir_gen/main.exe \
  -m controllers \
  /usr/share/gir-1.0/Gtk-4.0.gir \
  ./output
```

**Generated Files**:
- `ml_event_controllers_gen.c` - C FFI implementation with all bindings
- `button.mli`, `entry.mli`, etc. - OCaml interface files for each widget

**Example Output (.mli)**:
```ocaml
(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Button *)

type t = Gtk.Widget.t

(** Create a new Button *)
external new_ : unit -> t = "ml_gtk_button_new"

(* Properties *)

(** Get property: has-frame *)
external get_has_frame : t -> bool = "ml_gtk_button_get_has_frame"

(** Set property: has-frame *)
external set_has_frame : t -> bool -> unit = "ml_gtk_button_set_has_frame"

(* Methods *)

external set_label : t -> string -> unit = "ml_gtk_button_set_label"
external get_label : t -> string = "ml_gtk_button_get_label"
```

**Example Output (C)**:
```c
/* Property getter */
CAMLprim value ml_gtk_button_get_has_frame(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
    GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
    gboolean value;
    g_object_get(G_OBJECT(obj), "has-frame", &value, NULL);
    result = Val_bool(value);
    CAMLreturn(result);
}

/* Property setter */
CAMLprim value ml_gtk_button_set_has_frame(value self, value new_value)
{
    CAMLparam2(self, new_value);
    GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
    gboolean c_value = Bool_val(new_value);
    g_object_set(G_OBJECT(obj), "has-frame", c_value, NULL);
    CAMLreturn(Val_unit);
}
```

**Command-line Options**:
```
-m, --mode MODE        Generation mode: controllers, widgets, or all
-f, --filter FILE      Filter file specifying which classes to generate
GIR_FILE              Path to GTK GIR file
OUTPUT_DIR            Output directory for generated files
```

### 2. wrapper_gen - High-Level Wrapper Generator (New in Phase 5.2)

**Purpose**: Generate template high-level wrapper classes (GButton, GEdit, etc.) that provide convenient OCaml APIs on top of low-level bindings.

**Usage**:
```bash
# Build the generator
dune build src/tools/wrapper_gen.exe

# Generate all wrapper templates
./_build/default/src/tools/wrapper_gen.exe --all ./output
```

**Generated Files**:
- `gbutton.ml` - Button widget wrappers (GButton module)
- `gbutton.mli` - Interface file
- `gedit.ml` - Entry widget wrappers (GEdit module)
- `gedit.mli` - Interface file
- `gtext.ml` - Text widget wrappers (GText module)
- `grange.ml` - Range widget wrappers (GRange module)
- `gmisc.ml` - Misc widget wrappers (GMisc module)

**Example Output (gbutton.ml)**:
```ocaml
(* High-level wrappers for Buttons widgets *)

open Gtk
open GObj

(** Button widget skeleton *)
class button_skel (obj : Gtk.Widget.t) = object
  inherit GObj.widget_impl obj

  (* TODO: Add property accessors from Button module *)
  (* Example:
   * method set_label label = Button.set_label obj label
   * method label = Button.get_label obj
   *)

  (* TODO: Add signal connections *)
  (* Example:
   * method connect_clicked ~callback =
   *   (* Use g_signal_connect wrapper *)
   *   ignore (callback) (* placeholder *)
   *)
end

(** Button widget *)
class button obj = object
  inherit button_skel (Gtk.Widget.coerce obj)
end

(** Create a new Button widget *)
let button ?(packing : (GObj.widget -> unit) option) ?(show : bool option) () =
  (* TODO: Customize constructor with widget-specific optional arguments *)
  (* Example: ?label ?use_underline ?icon_name etc. *)
  let widget_obj = Button.new_ () in
  let widget = new button widget_obj in
  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());
  (match show with Some true -> widget#show | _ -> ());
  widget
```

**Customization Required**:
The generated templates are meant to be **customized by hand**. You should:
1. Add property accessor methods
2. Add signal connection methods
3. Add widget-specific optional constructor parameters
4. Add convenience methods

### 3. ml_impl_gen - Implementation File Generator (New in Phase 5.2)

**Purpose**: Generate basic .ml implementation files from .mli interface files.

**Usage**:
```bash
# Build the generator
dune build src/tools/ml_impl_gen.exe

# Generate single implementation
./_build/default/src/tools/ml_impl_gen.exe button.mli -o button.ml

# Batch generate all implementations
./_build/default/src/tools/ml_impl_gen.exe \
  --batch \
  --mli-dir ./generated \
  --output-dir ./src
```

**Example Output (button.ml from button.mli)**:
```ocaml
(* GENERATED IMPLEMENTATION - DO NOT EDIT DIRECTLY *)
(* Generated from button.mli *)

(* Type declarations *)
type t = Gtk.Widget.t

(* External FFI bindings *)
external new_ : unit -> t = "ml_gtk_button_new"
external get_has_frame : t -> bool = "ml_gtk_button_get_has_frame"
external set_has_frame : t -> bool -> unit = "ml_gtk_button_set_has_frame"
external set_label : t -> string -> unit = "ml_gtk_button_set_label"
external get_label : t -> string = "ml_gtk_button_get_label"

(* Summary:
 * - 1 type declarations
 * - 5 external bindings
 *)
```

## Workflow for Adding a New Widget

Here's the complete workflow for adding a new widget to LablGTK4:

### Step 1: Update Filter Configuration

Add the widget to `src/tools/widget_filter.conf`:
```
# Your new widget
GtkYourWidget
```

### Step 2: Generate Low-Level Bindings

Run gir_gen to generate C and .mli files:
```bash
dune build src/tools/gir_gen/main.exe

./_build/default/src/tools/gir_gen/main.exe \
  -m widgets \
  -f src/tools/widget_filter.conf \
  /usr/share/gir-1.0/Gtk-4.0.gir \
  ./src
```

This generates:
- `src/ml_event_controllers_gen.c` (updated with new widget)
- `src/your_widget.mli`

### Step 3: Generate .ml Implementation

```bash
dune build src/tools/ml_impl_gen.exe

./_build/default/src/tools/ml_impl_gen.exe \
  src/your_widget.mli \
  -o src/your_widget.ml
```

### Step 4: Generate High-Level Wrapper Template

If starting a new category or module:
```bash
dune build src/tools/wrapper_gen.exe

./_build/default/src/tools/wrapper_gen.exe --all ./templates
```

Then customize the generated template for your widget.

### Step 5: Update Build Configuration

Add to `src/dune`:
```lisp
(library
 (name lablgtk4)
 (modules
   ; ... existing modules ...
   yourWidget  ; Add your low-level module
   gYourCategory  ; Add your high-level module
 )
 (foreign_stubs
   (names
     ; ... existing C files ...
     ml_event_controllers_gen  ; Already includes your widget
   )
 )
)
```

### Step 6: Write Tests

Create `tests/test_your_widget.ml`:
```ocaml
open Alcotest

let test_creation () =
  let widget = YourWidget.new_ () in
  check bool "widget created" true (widget != YourWidget.null)

let test_properties () =
  let widget = YourWidget.new_ () in
  YourWidget.set_some_property widget true;
  check bool "property set" true (YourWidget.get_some_property widget)

let () =
  run "YourWidget Tests" [
    "basic", [
      test_case "creation" `Quick test_creation;
      test_case "properties" `Quick test_properties;
    ];
  ]
```

Add to `run_tests.sh`:
```bash
run_test "Your Widget Tests" test_your_widget.exe
```

### Step 7: Build and Test

```bash
dune build
./run_tests.sh
```

## Time Savings

**Manual Approach** (GTK3 style):
- C FFI bindings: ~200-500 lines per widget
- OCaml .mli: ~100-200 lines
- OCaml .ml: ~100-200 lines
- High-level wrapper: ~150-300 lines
- **Total: 2-4 hours per widget**

**Automated Approach** (Phase 5.2):
- Step 1: Update filter (1 line) - **30 seconds**
- Step 2-3: Generate code (run commands) - **1 minute**
- Step 4: Customize wrapper template - **30-60 minutes**
- Step 5-7: Integration and testing - **30-60 minutes**
- **Total: 1-2 hours per widget**

**Time Saved: ~50% per widget**

## Testing

The generators include comprehensive test suites:

```bash
# Test gir_gen
dune build src/tools/test_gir_gen.exe
./_build/default/src/tools/test_gir_gen.exe

# Tests include:
# - GIR file parsing
# - C code generation
# - Widget generation
# - Property generation (Phase 5.2)
# - C property generation (Phase 5.2)
# - All methods generated (Phase 5.2)
```

Test coverage:
- ✅ Property parsing from GIR XML
- ✅ Property getter/setter generation (.mli)
- ✅ Property getter/setter C code generation
- ✅ No 5-method limit (all methods generated)
- ✅ Widget vs controller type detection
- ✅ Filter file parsing
- ✅ Batch generation

## Future Enhancements

Potential Phase 5.3+ improvements:

1. **Signal generation**: Auto-generate signal connection helpers
2. **Smart wrapper generation**: Use heuristics to fill in wrapper methods automatically
3. **Documentation extraction**: Pull GTK-Doc comments into generated code
4. **Dependency resolution**: Auto-detect which modules need to be imported
5. **Test generation**: Auto-generate basic test scaffolds

## References

- [port-phase5.md](../../../port-phase5.md) - Phase 5 specification
- [PHASE5_SUMMARY.md](../../../PHASE5_SUMMARY.md) - Phase 5.0 summary
- [FFI_GUIDELINES.md](../../../FFI_GUIDELINES.md) - C binding best practices
- [SECURITY_GUIDELINES.md](../../../SECURITY_GUIDELINES.md) - Security requirements

## Version History

- **5.0.0** (Phase 5.0) - Initial widget generation support
- **5.2.0** (Phase 5.2) - Property C code generation, wrapper_gen, ml_impl_gen tools
