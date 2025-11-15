# Phase 3 Code Generation Strategy

## Overview

Phase 3 involves significant repetitive boilerplate code that follows clear patterns. We can extend the existing code generation infrastructure (varcc, propcc) to automate most of the repetitive work.

## Current Code Generation Tools

### 1. **varcc** - Enum/Variant Generator
- **Input**: `.var` files with enum definitions
- **Output**: OCaml variant types + C conversion tables
- **Example**: `gdk_tags.var` → `GdkEnums.ml` + conversion functions

### 2. **propcc** - Property/Signal Generator
- **Input**: `.props` files with class/property/signal definitions
- **Output**: OCaml wrappers + C FFI bindings for properties and signals
- **Example**: `gtkRange.props` → property getters/setters, signal connections

## Repetitive Patterns in Phase 3

### Pattern 1: Event Controller Bindings

**Repetitive Code** (per controller type):
```c
/* Type conversion */
#define GtkEventControllerFoo_val(val) ((GtkEventControllerFoo*)Pointer_val(val))
#define Val_GtkEventControllerFoo(obj) (Val_addr(obj))

/* Constructor */
CAMLprim value ml_gtk_event_controller_foo_new(value unit)
{
  CAMLparam1(unit);
  GtkEventController *controller = gtk_event_controller_foo_new();
  CAMLreturn(Val_GtkEventController(controller));
}

/* Signal connection - repeated for each signal */
static void foo_signal_callback_wrapper(...) { /* marshalling code */ }
CAMLprim value ml_gtk_event_controller_foo_connect_signal(...)
{
  /* register global root, connect signal, return signal_id */
}
```

**OCaml side**:
```ocaml
module EventControllerFoo : sig
  type t = EventController.t
  val new_ : unit -> t
  val connect_signal : t -> callback:(...) -> GObject.signal_id
end
```

### Pattern 2: Widget Method Bindings

**Repetitive Code**:
```c
/* Simple getter */
CAMLprim value ml_gtk_widget_get_foo(value widget)
{
  CAMLparam1(widget);
  gboolean result = gtk_widget_get_foo(GtkWidget_val(widget));
  CAMLreturn(Val_bool(result));
}

/* Simple setter */
CAMLprim value ml_gtk_widget_set_foo(value widget, value foo)
{
  CAMLparam2(widget, foo);
  gtk_widget_set_foo(GtkWidget_val(widget), Bool_val(foo));
  CAMLreturn(Val_unit);
}
```

### Pattern 3: Signal Callback Marshallers

**Repetitive Code**: Converting between C signal parameters and OCaml callbacks
- Parameter type conversions (gdouble → caml_copy_double, etc.)
- Exception handling
- Return value conversion
- Global root management

---

## Proposed Solution: New Code Generators

### Generator 1: `controllercc` - Event Controller Generator

**Input Format**: `.controller` files

```ocaml
(* gtk4_controllers.controller *)

controller EventControllerKey : EventController {
  constructor new_

  signal key_pressed : guint guint GdkModifierType -> gboolean
  signal key_released : guint guint GdkModifierType -> unit
  signal modifiers : GdkModifierType -> gboolean

  method forward : GdkEvent -> gboolean
  method get_im_context : unit -> GtkIMContext option
}

controller EventControllerMotion : EventController {
  constructor new_

  signal enter : gdouble gdouble -> unit
  signal leave : unit -> unit
  signal motion : gdouble gdouble -> unit

  method contains_pointer : unit -> gboolean
  method is_pointer : unit -> gboolean
}

controller GestureClick : Gesture {
  constructor new_

  signal pressed : gint gdouble gdouble -> unit
  signal released : gint gdouble gdouble -> unit
  signal stopped : unit -> unit
  signal unpaired_release : gdouble gdouble guint GdkEventSequence option -> unit

  method set_button : guint -> unit
  method get_button : unit -> guint
}
```

**Generated Output**:

1. **C bindings** (`ml_event_controllers.c`):
   - Type conversion macros
   - Constructors
   - Signal callback wrappers with proper marshalling
   - Method bindings
   - Automatic global root management

2. **OCaml modules** (`eventControllerKey.ml`, etc.):
   - Type definitions
   - Constructor functions
   - Signal connection functions
   - Method wrappers

**Benefits**:
- ✅ Eliminates ~80% of repetitive event controller code
- ✅ Ensures consistent parameter marshalling
- ✅ Automatic memory management (global roots)
- ✅ Type-safe signal signatures

### Generator 2: `widgetcc` - Widget Method Generator

**Input Format**: Extend existing `.props` format for GTK4

```ocaml
(* gtkWidget4.props *)

prefix "Gtk"

class Widget abstract : GObject {
  (* Properties *)
  "visible"     gboolean : Read / Write
  "sensitive"   gboolean : Read / Write
  "focusable"   gboolean : Read / Write
  "name"        gchararray : Read / Write

  (* Simple methods - auto-generate *)
  method show : unit
  method hide : unit
  method grab_focus : gboolean
  method queue_draw : unit
  method queue_resize : unit

  (* Methods with parameters *)
  method set_size_request : gint gint -> unit
  method get_size_request : gint* gint* -> unit  (* out params *)

  (* CSS methods *)
  method add_css_class : gchararray -> unit
  method remove_css_class : gchararray -> unit
  method has_css_class : gchararray -> gboolean
  method get_css_classes : gchararray* -> unit  (* array return *)

  (* Size methods *)
  method get_width : gint
  method get_height : gint
  method get_allocated_width : gint
  method get_allocated_height : gint

  (* Hierarchy *)
  method get_parent : GtkWidget option
  method get_root : GtkRoot option

  (* Controller attachment *)
  method add_controller : GtkEventController -> unit
  method remove_controller : GtkEventController -> unit
}
```

**Generated Output**:
- C bindings with proper parameter handling
- OCaml method wrappers
- Option type handling for nullable returns
- Array/list conversions (e.g., `get_css_classes`)

### Generator 3: `signalcc` - Signal Marshaller Generator

**Input Format**: Signal signature definitions

```ocaml
(* gtk4_signals.sigs *)

(* Signal name, parameter types, return type *)
signal key_pressed : guint guint GdkModifierType -> gboolean {
  marshal {
    let keyval = Int_val(Field(args, 0)) in
    let keycode = Int_val(Field(args, 1)) in
    let state = ModifierType_val(Field(args, 2)) in
    caml_callback3_exn(callback, Val_int(keyval), Val_int(keycode), Val_ModifierType(state))
  }
  return {
    Bool_val(result)
  }
}

signal motion : gdouble gdouble -> unit {
  marshal {
    let x = Double_val(Field(args, 0)) in
    let y = Double_val(Field(args, 1)) in
    caml_callback2_exn(callback, caml_copy_double(x), caml_copy_double(y))
  }
}
```

**Generated Output**:
- Callback wrapper functions
- Automatic exception handling
- Type conversion code
- Global root registration/cleanup

---

## Implementation Plan

### Phase 3.0: Code Generation Infrastructure (1 week)

**Tasks**:
1. **Create `controllercc` generator**
   - Parser for `.controller` files
   - C code generator (constructors, signals, methods)
   - OCaml module generator
   - Integrate into dune build

2. **Extend `propcc` for GTK4**
   - Add GTK4-specific method patterns
   - Support `option` return types
   - Support array returns
   - CSS class methods

3. **Create signal marshaller templates**
   - Common parameter type conversions
   - Exception handling template
   - Global root management template

**Deliverables**:
- `lablgtk4/src/tools/controllercc.ml`
- Updated `lablgtk4/src/tools/propcc.ml`
- Template library for marshallers
- Dune rules for new generators

### Phase 3.1-3.4: Use Generators (5-7 weeks)

**Instead of manually writing**:
- ~600 lines of event controller C code
- ~400 lines of widget C code
- ~300 lines of snapshot C code
- Corresponding OCaml wrappers

**We write**:
- `gtk4_controllers.controller` (~150 lines)
- `gtkWidget4.props` (~100 lines)
- `gtkSnapshot4.props` (~80 lines)

**Estimated time savings**: 40-50% of Phase 3 implementation time

---

## Benefits

### 1. **Consistency**
- All event controllers follow identical patterns
- Signal marshalling is uniform
- Memory management is correct everywhere

### 2. **Completeness**
- Generator ensures no methods are accidentally omitted
- All signals get proper wrappers
- Documentation can be auto-generated

### 3. **Maintainability**
- Updating signal signatures updates all generated code
- Adding new controllers is trivial
- Easy to spot missing bindings

### 4. **Type Safety**
- Generator validates type conversions
- Catches mismatches at generation time
- Enforces correct parameter ordering

### 5. **Reduced Errors**
- No manual copy-paste mistakes
- Global root management automated
- Exception handling consistent

---

## Example: Generated vs Manual Code

### Manual Approach (Current Plan)

**Input**: Write by hand
- `ml_event_controller.c` (~600 lines)
- `eventControllerKey.ml` (~50 lines)
- `eventControllerMotion.ml` (~50 lines)
- `gestureClick.ml` (~60 lines)

**Total**: ~760 lines of boilerplate code

**Issues**:
- Easy to forget global root cleanup
- Inconsistent parameter ordering
- Copy-paste errors
- Hard to add new controllers

### Generated Approach (Proposed)

**Input**: Write specification
```ocaml
(* gtk4_controllers.controller - 150 lines *)

controller EventControllerKey : EventController {
  constructor new_
  signal key_pressed : guint guint GdkModifierType -> gboolean
  signal key_released : guint guint GdkModifierType -> unit
  method forward : GdkEvent -> gboolean
}

controller EventControllerMotion : EventController {
  constructor new_
  signal enter : gdouble gdouble -> unit
  signal motion : gdouble gdouble -> unit
}

controller GestureClick : Gesture {
  constructor new_
  signal pressed : gint gdouble gdouble -> unit
  signal released : gint gdouble gdouble -> unit
  method set_button : guint -> unit
  method get_button : unit -> guint
}
```

**Run**: `dune build` (generator runs automatically)

**Output**: Same ~760 lines, but:
- ✅ Guaranteed correct
- ✅ Consistent style
- ✅ Proper memory management
- ✅ Easy to extend

---

## Migration Strategy

### Option A: Build Generators First (Recommended)

**Week 1**: Build code generators
**Weeks 2-8**: Use generators for Phase 3 implementation

**Pros**:
- Faster overall implementation
- Higher quality code
- Easier to maintain

**Cons**:
- Upfront investment
- Generator debugging time

### Option B: Hybrid Approach

**Weeks 1-2**: Manually write 1-2 controllers as examples
**Week 3**: Build generator based on manual code patterns
**Weeks 4-8**: Generate remaining controllers

**Pros**:
- Validates patterns before codegen
- Faster to first working code

**Cons**:
- Some manual code to throw away
- Less time savings

---

## Recommendation

**Build the generators first** (Option A). The investment pays off because:

1. **Phase 3 has 10+ event controllers to bind**
2. **Phase 4-7 will need similar generators** for other widget types
3. **Maintenance is easier** - updates to one controller template update all
4. **Quality is higher** - no human error in repetitive code
5. **Documentation is free** - generate from specs

The existing `varcc` and `propcc` prove this approach works well for LablGTK.

---

## Files to Create

```
lablgtk4/
├── src/
│   ├── tools/
│   │   ├── controllercc.ml4     # NEW: Event controller generator
│   │   ├── widgetcc.ml4         # NEW: Widget method generator
│   │   ├── propcc.ml4           # Updated for GTK4
│   │   └── marshallers.ml       # NEW: Marshalling templates
│   │
│   ├── gtk4_controllers.controller  # NEW: Controller specs
│   ├── gtkWidget4.props             # NEW: Widget specs
│   └── gtkSnapshot4.props           # NEW: Snapshot specs
│
└── CODEGEN_GUIDE.md             # NEW: How to use generators
```

---

## Next Steps

1. **Review this proposal** with the team
2. **Create prototype** `controllercc` for one controller type
3. **Validate generated code** compiles and works
4. **Expand to all controllers** in Phase 3
5. **Document generator usage** for future phases

---

## Questions for Discussion

1. Should we build all generators upfront, or incrementally?
2. What syntax should `.controller` files use? (OCaml-like vs custom DSL)
3. Should generators emit documentation comments?
4. How should we handle GTK4-specific vs GTK3 differences in propcc?
5. Should we auto-generate test stubs from specs?

---

## Estimated Impact

| Metric | Manual | Generated | Savings |
|--------|--------|-----------|---------|
| C code lines | ~1400 | ~100 (specs) | 93% |
| OCaml code lines | ~800 | ~200 (specs) | 75% |
| Development time | 5-6 weeks | 3-4 weeks | 40% |
| Bugs from copy-paste | Many | None | 100% |
| Consistency | Manual | Perfect | ∞ |

**Conclusion**: Code generation can reduce Phase 3 implementation time by ~40% while improving code quality.
