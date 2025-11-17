# GIR-Based Code Generator for Phase 3 & Phase 5

This directory contains the OCaml-based GIR code generator for Phase 3 event controllers and Phase 5 widget bindings.

**Phase 5.2 Updates**: This tool has been significantly enhanced to support widget property generation, remove method limitations, and work alongside new code generation tools. See [README_PHASE5_2_GENERATORS.md](README_PHASE5_2_GENERATORS.md) for complete Phase 5.2 documentation.

## Files

- `gir_gen.ml` - Main code generator (OCaml rewrite of generate_event_controllers.py)
- `test_gir_gen.ml` - Test suite for the generator
- `dune` - Build configuration

## Building

```bash
cd /home/user/lablgtk/lablgtk4
dune build src/tools/gir_gen.exe
dune build src/tools/test_gir_gen.exe
```

## Usage

### Generate Event Controller Bindings

```bash
# Build the generator
dune build src/tools/gir_gen.exe

# Run on GTK4 GIR file
./_build/default/src/tools/gir_gen.exe \
  /usr/share/gir-1.0/Gtk-4.0.gir \
  ./generated_output

# This will create:
# - generated_output/ml_event_controllers_gen.c (C bindings)
# - generated_output/event_controller_key.mli (OCaml interface)
# - generated_output/gesture_click.mli
# - ... (one .mli file per controller)
```

### Run Tests

```bash
dune build src/tools/test_gir_gen.exe
./_build/default/src/tools/test_gir_gen.exe
```

## Design

The generator follows patterns from existing lablgtk tools:

### From `varcc.ml`:
- Line-by-line parsing with regex
- Type conversion table
- Simple, maintainable code

### From `propcc.ml`:
- C FFI generation
- OCaml module generation
- Type mapping system

### From `wrappers.h` (existing lablgtk4):
- ML_1, ML_2 macros for simple bindings
- Val_option for nullable types
- Direct cast for GObjects

## Type Mappings

| GIR Type | OCaml Type | C→ML | ML→C |
|----------|------------|------|------|
| `guint` | `int` | `Val_int` | `Int_val` |
| `gboolean` | `bool` | `Val_bool` | `Bool_val` |
| `gdouble` | `float` | `caml_copy_double` | `Double_val` |
| `GtkWidget*` | `Gtk.Widget.t` | `Val_GtkWidget` | `GtkWidget_val` |
| `GdkModifierType` | `Gdk.modifier_type list` | `Val_ModifierType` | `ModifierType_val` |

## Generated Code Example

### Input (from Gtk-4.0.gir):
```xml
<class name="EventControllerKey">
  <constructor name="new" c:identifier="gtk_event_controller_key_new"/>
  <method name="forward" c:identifier="gtk_event_controller_key_forward">
    <return-value><type name="gboolean"/></return-value>
    <parameters>
      <parameter name="widget"><type name="GtkWidget*"/></parameter>
    </parameters>
  </method>
</class>
```

### Generated C (`ml_event_controllers_gen.c`):
```c
CAMLprim value ml_gtk_event_controller_key_new(value unit)
{
    CAMLparam1(unit);
    GtkEventController *controller = gtk_event_controller_key_new();
    CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_event_controller_key_forward(value self, value arg1)
{
    CAMLparam2(value self, value arg1);
    gboolean result = gtk_event_controller_key_forward(
        GtkEventController_val(self),
        GtkWidget_val(arg1)
    );
    CAMLreturn(Val_bool(result));
}
```

### Generated OCaml (`event_controller_key.mli`):
```ocaml
type t = EventController.t

external new_ : unit -> t = "ml_gtk_event_controller_key_new"

external forward : t -> Gtk.Widget.t -> bool =
  "ml_gtk_event_controller_key_forward"
```

## Testing

The test suite verifies:

1. **GIR Parsing**: Correctly extracts classes, methods, and constructors
2. **C Code Generation**: Produces valid C with CAMLparam/CAMLreturn
3. **Type Conversion**: Maps GIR types to OCaml types correctly
4. **OCaml Interface**: Generates compilable .mli files

## Advantages Over Python Version

1. **Native OCaml**: No Python dependency
2. **Type Safe**: OCaml's type system catches errors
3. **Consistent**: Same language as varcc.ml and propcc.ml
4. **Maintainable**: Uses familiar patterns from existing tools
5. **Self-contained**: No external XML libraries needed

## Implementation Notes

### Simple Parsing
The generator uses line-by-line parsing with regex instead of full XML parsing:
- Lighter weight (no xmlm dependency)
- Easier to maintain
- Sufficient for extracting GIR patterns we need

### GObject Handling
Event controllers are GObjects, so we use direct casts:
```c
#define GtkEventController_val(val) ((GtkEventController*)Pointer_val(val))
#define Val_GtkEventController(obj) ((value)(obj))
```

### Memory Management
- Controllers are ref-counted by GTK
- No custom finalizers needed
- Widget takes ownership when added via `gtk_widget_add_controller`

## Phase 5.2 Enhancements (Completed)

✅ **Property Generation**: Auto-generates C property getters/setters using g_object_get/g_object_set
✅ **No Method Limit**: Removed 5-method testing limitation, now generates ALL methods
✅ **Widget Type Support**: Added GtkWidget_val/Val_GtkWidget macros
✅ **Improved Output**: Shows method and property counts during generation

## Next Steps

1. **Enhance Signal Generation**: Add signal marshalling code generation
2. **Add More Type Mappings**: Support additional GIR types as needed
3. **Widget Attachment**: Generate `add_controller` bindings for Gtk.Widget
4. **Full Validation**: Run against complete Gtk-4.0.gir file
5. **Documentation Extraction**: Pull GTK-Doc comments into generated code

## References

- `PHASE3_0_IMPLEMENTATION.md` - Overall Phase 3.0 approach
- `FFI_GUIDELINES.md` - OCaml/C FFI best practices
- `SECURITY_GUIDELINES.md` - Security requirements for bindings
- `/usr/share/gir-1.0/Gtk-4.0.gir` - Official GTK4 API specification
