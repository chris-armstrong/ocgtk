# Phase 3 Code Generation Strategy (GObject Introspection Based)

## Game Changer: Use GTK's GObject Introspection

GTK provides **GObject Introspection (GI)** - machine-readable API specifications in XML (`.gir` files) that describe the entire GTK API including:

- ✅ All classes and their inheritance
- ✅ All methods with complete signatures
- ✅ All signals with parameter types
- ✅ All properties with types
- ✅ Documentation strings
- ✅ Transfer ownership semantics
- ✅ Nullable parameters

**Location**: `/usr/share/gir-1.0/Gtk-4.0.gir` (8MB XML file)

This is the **official** source of truth for GTK bindings used by:
- **PyGObject** (Python GTK bindings)
- **GJS** (JavaScript GTK bindings)
- **Vala** (Vala GTK bindings)
- **Rust gtk-rs** (Rust GTK bindings)

## Why This is Better Than Custom Files

### Custom Approach (Original Proposal)
❌ Need to manually write `.controller` specs
❌ Can get out of sync with GTK
❌ No guarantee of completeness
❌ Need to update when GTK updates

### GObject Introspection Approach
✅ **Official GTK API specification** (ships with GTK)
✅ **Always complete and accurate**
✅ **Automatically updates** with GTK version
✅ **Includes documentation**
✅ **Used by proven language bindings**
✅ **Industry standard for GTK bindings**

---

## GIR File Example

```xml
<!-- EventControllerKey from Gtk-4.0.gir -->
<class name="EventControllerKey"
       c:symbol-prefix="event_controller_key"
       c:type="GtkEventControllerKey"
       parent="EventController"
       glib:type-name="GtkEventControllerKey"
       glib:get-type="gtk_event_controller_key_get_type">
  <doc>GtkEventControllerKey is an event controller that provides access
to key events.</doc>

  <!-- Constructor -->
  <constructor name="new" c:identifier="gtk_event_controller_key_new">
    <doc>Creates a new event controller that will handle key events.</doc>
    <return-value transfer-ownership="full">
      <doc>a new `GtkEventControllerKey`</doc>
      <type name="EventController" c:type="GtkEventController*"/>
    </return-value>
  </constructor>

  <!-- Methods -->
  <method name="forward" c:identifier="gtk_event_controller_key_forward">
    <return-value transfer-ownership="none">
      <type name="gboolean" c:type="gboolean"/>
    </return-value>
    <parameters>
      <parameter name="event" transfer-ownership="none">
        <type name="Gdk.Event" c:type="GdkEvent*"/>
      </parameter>
    </parameters>
  </method>

  <!-- Signals -->
  <glib:signal name="key-pressed" when="last">
    <doc>Emitted when a key is pressed.</doc>
    <return-value transfer-ownership="none">
      <type name="gboolean" c:type="gboolean"/>
    </return-value>
    <parameters>
      <parameter name="keyval" transfer-ownership="none">
        <type name="guint" c:type="guint"/>
      </parameter>
      <parameter name="keycode" transfer-ownership="none">
        <type name="guint" c:type="guint"/>
      </parameter>
      <parameter name="state" transfer-ownership="none">
        <type name="Gdk.ModifierType" c:type="GdkModifierType"/>
      </parameter>
    </parameters>
  </glib:signal>
</class>
```

**This is everything we need to generate bindings!**

---

## Proposed Solution: GIR-Based Generator

### Architecture

```
Gtk-4.0.gir (XML)
      ↓
  GIR Parser (OCaml)
      ↓
  AST (OCaml types)
      ↓
  Code Generator
      ↓
  ┌─────────────┬──────────────┐
  ↓             ↓              ↓
ml_*.c      *.ml/*.mli     docs
(C FFI)    (OCaml API)   (generated)
```

### Tool: `gicc` (GObject Introspection Code Compiler)

**Input**:
- `Gtk-4.0.gir` (from system)
- `type_mappings.conf` (C type → OCaml type)
- `filter_config.conf` (what to generate)

**Output**:
- C FFI bindings
- OCaml modules
- Documentation comments

---

## Implementation Details

### 1. GIR Parser (`gir_parser.ml`)

Parse GIR XML into OCaml types:

```ocaml
(* gir_parser.ml *)

type gir_type = {
  name : string;
  c_type : string;
  nullable : bool;
}

type gir_parameter = {
  name : string;
  typ : gir_type;
  transfer : string; (* "none", "full", "container" *)
  direction : string; (* "in", "out", "inout" *)
}

type gir_method = {
  name : string;
  c_identifier : string;
  return_type : gir_type;
  parameters : gir_parameter list;
  doc : string option;
}

type gir_signal = {
  name : string;
  return_type : gir_type;
  parameters : gir_parameter list;
  when_ : string; (* "first", "last", "cleanup" *)
  doc : string option;
}

type gir_constructor = {
  name : string;
  c_identifier : string;
  return_type : gir_type;
  parameters : gir_parameter list;
  doc : string option;
}

type gir_class = {
  name : string;
  c_type : string;
  parent : string option;
  constructors : gir_constructor list;
  methods : gir_method list;
  signals : gir_signal list;
  doc : string option;
}

let parse_gir_file filename : gir_class list =
  (* Parse XML using ocaml-xml or similar *)
  ...
```

### 2. Type Mapping (`type_mappings.conf`)

Map GIR types to OCaml types:

```
# C type → OCaml type, C→ML converter, ML→C converter
guint → int, Int_val, Val_int
gint → int, Int_val, Val_int
gdouble → float, Double_val, caml_copy_double
gboolean → bool, Bool_val, Val_bool
gchararray → string, String_val, caml_copy_string
GdkModifierType → Gdk.modifier_type list, ModifierType_val, Val_ModifierType
GdkEvent* → Gdk.Event.t, GdkEvent_val, Val_GdkEvent
GtkEventController* → EventController.t, GtkEventController_val, Val_GtkEventController
GtkWidget* → Gtk.Widget.t, GtkWidget_val, Val_GtkWidget

# Handle nullable types
GtkWidget* [nullable] → Gtk.Widget.t option, GtkWidget_val_opt, Val_GtkWidget_opt
```

### 3. C Code Generator (`c_codegen.ml`)

Generate C FFI bindings:

```ocaml
(* c_codegen.ml *)

let generate_constructor (cls : gir_class) (ctor : gir_constructor) =
  Printf.sprintf "
CAMLprim value ml_%s(value unit)
{
  CAMLparam1(unit);
  %s *obj = %s();
  CAMLreturn(Val_%s((%s*)obj));
}
" (camlize ctor.c_identifier)
    cls.c_type
    ctor.c_identifier
    cls.name
    cls.parent

let generate_method (cls : gir_class) (meth : gir_method) =
  let params = generate_params meth.parameters in
  let call = generate_c_call meth.c_identifier meth.parameters in
  Printf.sprintf "
CAMLprim value ml_%s(value self%s)
{
  CAMLparam%d(self%s);
  %s result = %s(%s_val(self)%s);
  CAMLreturn(%s);
}
" (camlize meth.c_identifier)
    params
    (1 + List.length meth.parameters)
    params
    (c_type_of meth.return_type)
    meth.c_identifier
    cls.c_type
    call
    (convert_to_ocaml meth.return_type "result")

let generate_signal_wrapper (sig : gir_signal) =
  (* Generate callback wrapper with marshalling *)
  ...
```

### 4. OCaml Code Generator (`ml_codegen.ml`)

Generate OCaml modules:

```ocaml
(* ml_codegen.ml *)

let generate_module (cls : gir_class) =
  let module_name = cls.name in
  Printf.sprintf "
(** %s *)
module %s : sig
  type t = EventController.t

  %s

  %s

  %s
end
" (Option.value ~default:"" cls.doc)
    module_name
    (generate_constructors cls.constructors)
    (generate_methods cls.methods)
    (generate_signals cls.signals)
```

### 5. Filter Configuration (`filter_config.conf`)

Specify what to generate:

```
# Generate event controllers
include Gtk.EventController
include Gtk.EventControllerKey
include Gtk.EventControllerMotion
include Gtk.EventControllerFocus
include Gtk.EventControllerScroll
include Gtk.Gesture*  # All gesture classes

# Generate widget base
include Gtk.Widget

# Skip deprecated classes
exclude Gtk.*Deprecated

# Skip internal classes
exclude Gtk.*Private
```

---

## Phase 3.0: Build GIR-Based Generator (1 week)

### Tasks

1. **GIR XML Parser** (2 days)
   - Use `xmlm` or `markup` library for XML parsing
   - Parse classes, methods, signals, constructors
   - Extract documentation

2. **Type Mapping System** (1 day)
   - Load type mappings from config
   - Handle nullable types
   - Handle array types
   - Handle callback types

3. **C Code Generator** (2 days)
   - Constructor generators
   - Method generators
   - Signal wrapper generators
   - Memory management (transfer ownership)

4. **OCaml Code Generator** (1 day)
   - Module generators
   - Type signature generators
   - Documentation comment generators

5. **Integration** (1 day)
   - Dune rules to run generator
   - Build system integration
   - Test generated code

### Deliverables

```
lablgtk4/src/tools/
├── gicc/                      # GIR code compiler
│   ├── gir_parser.ml         # XML → AST
│   ├── type_mapper.ml        # Type conversions
│   ├── c_codegen.ml          # C generator
│   ├── ml_codegen.ml         # OCaml generator
│   └── main.ml               # CLI tool
│
├── type_mappings.conf         # C ↔ OCaml type map
└── filter_config.conf         # What to generate

# Generated files (from GIR)
lablgtk4/src/
├── ml_event_controllers.c     # Generated C
├── eventControllerKey.ml      # Generated OCaml
├── eventControllerMotion.ml
├── gestureClick.ml
└── ...
```

---

## Advantages Over Manual Coding

| Aspect | Manual | GIR-Based | Improvement |
|--------|--------|-----------|-------------|
| **LOC to write** | ~2000 | ~500 (generator) | 75% reduction |
| **Accuracy** | Manual transcription | From GTK source | 100% accurate |
| **Completeness** | Easy to miss methods | All methods included | 100% complete |
| **Documentation** | Manual | Auto-extracted | Free docs |
| **Maintenance** | Update by hand | Regenerate | Trivial |
| **GTK version updates** | Manual port | Regenerate | Automatic |
| **Type safety** | Prone to errors | Validated | Perfect |

---

## Comparison to Other Language Bindings

### PyGObject (Python)

Uses GIR with runtime introspection:
```python
# PyGObject uses GIR at runtime
from gi.repository import Gtk
controller = Gtk.EventControllerKey.new()
```

**Approach**: Dynamic runtime introspection
**Pros**: No code generation needed
**Cons**: Runtime overhead, no compile-time checking

### Our Approach (OCaml)

Use GIR for **compile-time** code generation:
```ocaml
(* LablGTK4 uses GIR at build time *)
let controller = EventControllerKey.new_ () in
```

**Approach**: Static code generation from GIR
**Pros**: Type-safe, no runtime overhead, compile-time checking
**Cons**: Need to regenerate when GTK updates

---

## Example: Generated Code

### Input (from Gtk-4.0.gir)

```xml
<class name="EventControllerKey" parent="EventController">
  <constructor name="new" c:identifier="gtk_event_controller_key_new"/>

  <method name="forward" c:identifier="gtk_event_controller_key_forward">
    <return-value><type name="gboolean"/></return-value>
    <parameters>
      <parameter name="event"><type name="Gdk.Event*"/></parameter>
    </parameters>
  </method>

  <glib:signal name="key-pressed">
    <return-value><type name="gboolean"/></return-value>
    <parameters>
      <parameter name="keyval"><type name="guint"/></parameter>
      <parameter name="keycode"><type name="guint"/></parameter>
      <parameter name="state"><type name="Gdk.ModifierType"/></parameter>
    </parameters>
  </glib:signal>
</class>
```

### Generated C (`ml_event_controller_key.c`)

```c
/* GENERATED FROM Gtk-4.0.gir - DO NOT EDIT */

CAMLprim value ml_gtk_event_controller_key_new(value unit)
{
  CAMLparam1(unit);
  GtkEventController *controller = gtk_event_controller_key_new();
  CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_event_controller_key_forward(value self, value event)
{
  CAMLparam2(self, event);
  gboolean result = gtk_event_controller_key_forward(
    GTK_EVENT_CONTROLLER_KEY(GtkEventController_val(self)),
    GdkEvent_val(event)
  );
  CAMLreturn(Val_bool(result));
}

/* Signal: key-pressed */
static gboolean key_pressed_callback_wrapper(
  GtkEventControllerKey *controller,
  guint keyval,
  guint keycode,
  GdkModifierType state,
  gpointer user_data)
{
  CAMLparam0();
  CAMLlocal1(result);

  value *ocaml_callback = (value*)user_data;

  value args[3] = {
    Val_int(keyval),
    Val_int(keycode),
    Val_ModifierType(state)
  };

  result = caml_callbackN_exn(*ocaml_callback, 3, args);

  gboolean handled = FALSE;
  if (!Is_exception_result(result)) {
    handled = Bool_val(result);
  }

  CAMLreturnT(gboolean, handled);
}

CAMLprim value ml_gtk_event_controller_key_connect_key_pressed(
  value controller, value callback)
{
  CAMLparam2(controller, callback);

  value *callback_root = ml_global_root_new(callback);

  gulong signal_id = g_signal_connect(
    GtkEventController_val(controller),
    "key-pressed",
    G_CALLBACK(key_pressed_callback_wrapper),
    callback_root
  );

  CAMLreturn(Val_long(signal_id));
}
```

### Generated OCaml (`eventControllerKey.ml`)

```ocaml
(* GENERATED FROM Gtk-4.0.gir - DO NOT EDIT *)

(** EventControllerKey is an event controller that provides access
    to key events. *)

type t = EventController.t

(** Creates a new event controller that will handle key events. *)
external new_ : unit -> t = "ml_gtk_event_controller_key_new"

(** Forward the event to the input method context. *)
external forward : t -> Gdk.Event.t -> bool
  = "ml_gtk_event_controller_key_forward"

(** Emitted when a key is pressed. *)
val connect_key_pressed :
  t ->
  callback:(keyval:int -> keycode:int -> state:Gdk.ModifierType.t -> bool) ->
  GObject.signal_id
```

---

## Integration with Existing Tools

### Keep varcc and propcc

- **varcc**: Still needed for enums (GIR enums can be complex)
- **propcc**: May still be useful for property bindings
- **gicc**: New tool for classes/methods/signals

### Hybrid Approach

```
┌─────────────────────────┐
│  Gtk-4.0.gir (8MB XML)  │  GTK's official API spec
└────────────┬────────────┘
             │
             ↓
      ┌──────────────┐
      │     gicc     │  New GIR-based generator
      └──────┬───────┘
             │
             ↓
   ┌─────────────────────┐
   │ Generated C + OCaml │  Event controllers, widgets
   └─────────────────────┘

┌───────────────┐
│  *.var files  │  Enum definitions (still needed)
└───────┬───────┘
        │
        ↓
   ┌────────┐
   │ varcc  │  Existing enum generator
   └────┬───┘
        │
        ↓
  ┌─────────────┐
  │ *Enums.ml   │  Enum bindings
  └─────────────┘
```

---

## Implementation Timeline

### Week 1: GIR Parser & Type Mapper
- Parse Gtk-4.0.gir XML
- Extract classes, methods, signals
- Build type mapping system

### Week 2: C Code Generator
- Constructor generation
- Method generation
- Signal wrapper generation

### Week 3: OCaml Code Generator
- Module generation
- Type signature generation
- Documentation generation

### Week 4: Integration & Testing
- Dune build integration
- Test generated code
- Compare with manual implementation
- Iterate on edge cases

---

## Validation Strategy

1. **Generate** EventControllerKey using gicc
2. **Compare** with manually written version
3. **Test** that generated code compiles
4. **Verify** runtime behavior matches
5. **Iterate** on generator until perfect match

---

## Long-Term Benefits

### For Phase 3
- ✅ 75% less code to write
- ✅ 100% API coverage guaranteed
- ✅ Perfect accuracy

### For Phases 4-7
- ✅ Same generator works for all widgets
- ✅ Containers, dialogs, trees, etc.
- ✅ Entire GTK4 API accessible

### For Future Maintenance
- ✅ GTK 4.x → 4.y updates: just regenerate
- ✅ Add new widget: add to filter config, regenerate
- ✅ Fix bug in generator: regenerate all bindings

---

## Decision Point

**Option A**: Build GIR-based generator (1 week upfront, huge payoff)
**Option B**: Manual coding (faster start, more work overall)

**Recommendation**: **Option A** - Build GIR generator

**Rationale**:
1. Industry standard approach (PyGObject, gtk-rs use it)
2. Guaranteed completeness and accuracy
3. Works for ALL of GTK4, not just Phase 3
4. Future-proof (works with GTK updates)
5. Less error-prone than manual coding
6. Better documentation (auto-extracted from GIR)

---

## Next Steps

1. ✅ **Approved?** Get team consensus on GIR approach
2. **Prototype** Parse EventControllerKey from GIR
3. **Generate** C + OCaml for one controller
4. **Test** Generated code compiles and runs
5. **Iterate** Expand to all event controllers
6. **Validate** Compare performance with manual code
7. **Document** How to add new widgets to generation

---

## References

- [GObject Introspection Documentation](https://gi.readthedocs.io/)
- [GTK GIR Files](https://gitlab.gnome.org/GNOME/gtk/-/tree/main/gir)
- [PyGObject (Python bindings using GIR)](https://pygobject.readthedocs.io/)
- [gtk-rs (Rust bindings using GIR)](https://gtk-rs.org/)
- [GJS (JavaScript bindings using GIR)](https://gjs.guide/)

---

## Conclusion

Using GObject Introspection is the **industry-standard approach** for GTK language bindings. Instead of manually writing specifications or code, we should:

1. **Parse** the official Gtk-4.0.gir file
2. **Generate** C FFI bindings automatically
3. **Generate** OCaml wrappers automatically
4. **Profit** from guaranteed completeness and accuracy

This approach will save significant time in Phase 3 and all future phases, while ensuring our bindings are always complete, accurate, and up-to-date with GTK.
