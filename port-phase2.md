# Phase 2: Core Layer Migration (6-8 weeks)

**Objective**: Port the foundational GLib, GObject, GdkPixbuf, Gdk, and Pango modules to GTK4. These modules form the base layer that all widgets depend on.

**Dependencies**: Phase 1 must be complete (build system, code generation, enums).

---

## 2.1 GLib Module Migration (1 week)

**Status**: ✅ **COMPLETE** (completed Nov 13, 2025)

**Priority**: HIGH (everything depends on GLib)

### Overview

The GLib module provides fundamental utilities: memory management, strings, lists, main loop, I/O channels. GTK4 uses GLib 2.66+, with minimal API changes from GTK3.

### Tasks

#### 2.1.1 Port glib.ml/mli

**Location**: `src/glib.ml`, `src/glib.mli`

**Changes needed**:
1. Update module documentation to reference GTK4/GLib 2.66+
2. Verify all type definitions are still valid
3. No major API changes expected

**Key types** (unchanged):
```ocaml
type unichar
type unistring = unichar array
module Utf8 : sig ... end
module Convert : sig ... end
module Markup : sig ... end
module Main : sig ... end
module Io : sig ... end
module Timeout : sig ... end
module Idle : sig ... end
```

#### 2.1.2 Port ml_glib.c

**Location**: `src/ml_glib.c` (currently ~1200 lines)

**Changes needed**:
1. Update header includes (verify glib-2.0 paths)
2. Check for deprecated GLib functions
3. Verify main loop integration still works

**Key functions to verify**:
```c
// Main loop
CAMLprim value ml_g_main_loop_new(value is_running)
CAMLprim value ml_g_main_loop_run(value loop)
CAMLprim value ml_g_main_loop_quit(value loop)

// Timeout/Idle
CAMLprim value ml_g_timeout_add(value interval, value callback)
CAMLprim value ml_g_idle_add(value callback)

// String conversion
CAMLprim value ml_g_utf8_validate(value str)
CAMLprim value ml_g_locale_to_utf8(value str)
CAMLprim value ml_g_locale_from_utf8(value str)

// Lists
CAMLprim value ml_g_list_length(value list)
// etc.
```

**Deprecated functions to check**:
- `g_main_iteration()` → use `g_main_context_iteration(NULL, ...)`
- `g_main_pending()` → use `g_main_context_pending(NULL)`

#### 2.1.3 Testing

Create `tests/test_glib.ml`:
```ocaml
open Alcotest

let test_main_loop () =
  (* Test main loop creation and quit *)
  let loop = Glib.Main.create false in
  let quit_called = ref false in
  let _ = Glib.Timeout.add ~ms:10 ~callback:(fun () ->
    quit_called := true;
    Glib.Main.quit loop;
    false
  ) in
  Glib.Main.run loop;
  check bool "quit called" true !quit_called

let test_utf8 () =
  let valid = Glib.Utf8.validate "Hello, 世界" in
  check bool "utf8 valid" true valid;

  let invalid = Glib.Utf8.validate "\xFF\xFE" in
  check bool "utf8 invalid" false invalid

let () =
  run "GLib Tests" [
    "main_loop", [ test_case "create_and_quit" `Quick test_main_loop ];
    "utf8", [ test_case "validation" `Quick test_utf8 ];
  ]
```

**Success Criteria**:
- All GLib functions compile without warnings
- Main loop tests pass
- UTF-8 conversion tests pass
- No memory leaks in valgrind

**Estimated Time**: 1 week

### Implementation Summary

**Completed**: November 13, 2025

**Files Modified/Created**:
- `src/glib.mli` (184 lines): Complete interface with all GLib modules
- `src/glib.ml` (121 lines): Full implementation with external C bindings
- `src/ml_glib.c` (~596 lines): Expanded C implementation with all functionality
- `tests/test_glib.ml` (328 lines): Comprehensive test suite (25 tests)

**What Was Implemented**:
1. **Main Event Loop**: Create, run, quit, iteration, pending checks
2. **Timeout Callbacks**: Add/remove with priority support, auto-cleanup
3. **Idle Callbacks**: Add/remove with priority support
4. **UTF-8 Validation**: String validation for UTF-8 encoding
5. **Character Set Conversion**: locale/filename to/from UTF-8, general conversion
6. **Priority Levels**: Full GLib priority system integration
7. **GError Handling**: Proper exception handling for conversion errors

**Test Results**: ✅ All 25 tests passing
- 3 enum tests (Phase 1.3 compatibility)
- 4 main event loop tests
- 4 timeout callback tests
- 4 idle callback tests
- 1 priority level test
- 4 UTF-8 validation tests
- 4 character set conversion tests
- 1 GError handling test

**Technical Notes**:
- Used Abstract_tag for GMainLoop pointer wrapping to avoid GC issues
- Callbacks properly registered with global roots for memory safety
- Runtime system acquire/release removed from iteration to prevent deadlocks
- Polymorphic variant ordering (alphabetical) properly handled in C conversions

---

## 2.2 GObject Module Migration (1.5 weeks)

**Priority**: HIGH (type system foundation)

### Overview

GObject provides the type system, properties, and signals used by all GTK widgets. GTK4 continues to use GObject with minor changes to property and signal APIs.

### Tasks

#### 2.2.1 Port gobject.ml/mli

**Location**: `src/gobject.ml`, `src/gobject.mli`

**Key types** (mostly unchanged):
```ocaml
type 'a obj
type g_type
type g_class
type g_value
type basic_type = [ `INVALID | `NONE | `CHAR | `UCHAR | `BOOLEAN | `INT |
                    `UINT | `LONG | `ULONG | `INT64 | `UINT64 | `ENUM |
                    `FLAGS | `FLOAT | `DOUBLE | `STRING | `POINTER |
                    `BOXED | `PARAM | `OBJECT ]

module Type : sig
  val name : g_type -> string
  val parent : g_type -> g_type
  val is_a : g_type -> g_type -> bool
  ...
end

module Value : sig
  val create : basic_type -> g_value
  val get_int : g_value -> int
  val set_int : g_value -> int -> unit
  ...
end

module Property : sig
  val get : 'a obj -> name:string -> g_value
  val set : 'a obj -> name:string -> g_value -> unit
  ...
end

module Closure : sig
  type t
  val create : (g_value array -> g_value) -> t
  ...
end

module Signal : sig
  val connect : 'a obj -> name:string -> callback:Closure.t -> int
  val disconnect : 'a obj -> int -> unit
  ...
end
```

**Changes needed**:
- Verify property get/set APIs still work
- Check signal connection/disconnection
- Ensure memory management (ref counting) is correct

#### 2.2.2 Port ml_gobject.c

**Location**: `src/ml_gobject.c` (currently ~1400 lines)

**Critical sections**:

1. **GObject wrapping/unwrapping**:
```c
#define GObject_val(val) ((GObject*)Pointer_val(val))
#define Val_GObject(obj) (Val_addr(obj))

CAMLprim value ml_g_object_ref(value obj)
{
  CAMLparam1(obj);
  g_object_ref(GObject_val(obj));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_g_object_unref(value obj)
{
  CAMLparam1(obj);
  g_object_unref(GObject_val(obj));
  CAMLreturn(Val_unit);
}
```

2. **Property access** (verify no GTK4 changes):
```c
CAMLprim value ml_g_object_get_property(value obj, value prop_name)
{
  CAMLparam2(obj, prop_name);
  CAMLlocal1(val);
  GValue gval = G_VALUE_INIT;

  g_object_get_property(GObject_val(obj), String_val(prop_name), &gval);
  val = Val_GValue(&gval);
  g_value_unset(&gval);

  CAMLreturn(val);
}

CAMLprim value ml_g_object_set_property(value obj, value prop_name, value val)
{
  // Similar implementation
}
```

3. **Signal connection**:
```c
CAMLprim value ml_g_signal_connect_closure(value obj, value signal_name,
                                           value closure, value after)
{
  CAMLparam4(obj, signal_name, closure, after);
  gulong handler_id;

  handler_id = g_signal_connect_closure(
    GObject_val(obj),
    String_val(signal_name),
    (GClosure*)Pointer_val(closure),
    Bool_val(after)
  );

  CAMLreturn(Val_long(handler_id));
}
```

4. **Closure marshalling** (complex, needs careful review):
```c
static void ml_closure_marshal(GClosure *closure, GValue *return_value,
                                guint n_param_values, const GValue *param_values,
                                gpointer invocation_hint, gpointer marshal_data)
{
  CAMLparam0();
  CAMLlocal2(args, result);

  // Convert GValue array to OCaml value array
  args = caml_alloc_tuple(n_param_values);
  for (guint i = 0; i < n_param_values; i++) {
    Store_field(args, i, Val_GValue(&param_values[i]));
  }

  // Call OCaml closure
  result = caml_callback_exn(/* ... */);

  // Handle exceptions
  if (Is_exception_result(result)) {
    // Log error
  } else if (return_value) {
    // Convert result to GValue
  }

  CAMLreturn0;
}
```

**GTK4-specific checks**:
- Verify `G_VALUE_INIT` usage (introduced in GLib 2.30)
- Check for deprecated GObject macros
- Ensure thread-safety with GLib main loop

#### 2.2.3 Testing

Create `tests/test_gobject.ml`:
```ocaml
open Alcotest

let test_type_system () =
  (* Test type hierarchy *)
  let widget_type = GtkWidget.get_type () in
  let object_type = GObject.Type.parent widget_type in
  check bool "widget is object" true
    (GObject.Type.is_a widget_type object_type)

let test_properties () =
  (* Test property get/set *)
  let label = GtkLabel.new_ ~text:"Hello" () in
  let text_val = GObject.Property.get label ~name:"label" in
  check string "property get" "Hello"
    (GObject.Value.get_string text_val);

  GObject.Property.set label ~name:"label"
    (GObject.Value.string "World");
  check string "property set" "World"
    (GtkLabel.get_text label)

let test_signals () =
  (* Test signal connection *)
  let button = GtkButton.new_ () in
  let clicked = ref false in
  let handler_id = GObject.Signal.connect button ~name:"clicked"
    ~callback:(fun _ -> clicked := true) in
  GtkButton.clicked button;
  check bool "signal fired" true !clicked;

  GObject.Signal.disconnect button handler_id

let () =
  run "GObject Tests" [
    "type_system", [ test_case "hierarchy" `Quick test_type_system ];
    "properties", [ test_case "get_set" `Quick test_properties ];
    "signals", [ test_case "connect_emit" `Quick test_signals ];
  ]
```

**Success Criteria**:
- Type system queries work correctly
- Property get/set functions work
- Signal connection/emission works
- Memory management correct (no leaks)
- Thread-safe with main loop

**Estimated Time**: 1.5 weeks

---

## 2.3 GdkPixbuf Module Migration (0.5 weeks)

**Priority**: MEDIUM (used by images, icons)

### Overview

GdkPixbuf handles image loading/manipulation. It's now a separate library from GTK but GTK4 still depends on it. Minimal API changes.

### Tasks

#### 2.3.1 Port gdkpixbuf.ml/mli

**Location**: `src/gdkpixbuf.ml`, `src/gdkpixbuf.mli`

**Key types** (unchanged):
```ocaml
type pixbuf
type colorspace = [ `RGB ]
type alpha_mode = [ `BILEVEL | `FULL ]

val create : width:int -> height:int -> has_alpha:bool -> pixbuf
val from_file : string -> pixbuf
val save : pixbuf -> filename:string -> typ:string -> unit
val get_width : pixbuf -> int
val get_height : pixbuf -> int
val get_pixels : pixbuf -> bytes
...
```

**Changes needed**: None expected (stable API)

#### 2.3.2 Port ml_gdkpixbuf.c

**Location**: `src/ml_gdkpixbuf.c` (currently ~400 lines)

**Verify key functions**:
```c
CAMLprim value ml_gdk_pixbuf_new(value width, value height, value has_alpha)
CAMLprim value ml_gdk_pixbuf_new_from_file(value filename)
CAMLprim value ml_gdk_pixbuf_save(value pixbuf, value filename, value type)
CAMLprim value ml_gdk_pixbuf_get_pixels(value pixbuf)
```

**Testing**: Load/save image, verify dimensions

**Success Criteria**:
- Can load PNG, JPEG, SVG files
- Can save images
- Pixel data access works
- No memory leaks

**Estimated Time**: 0.5 weeks

---

## 2.4 Gdk Module Migration (2.5 weeks)

**Priority**: CRITICAL (major API changes)

### Overview

GDK (GTK Drawing Kit) underwent significant changes in GTK4:
- `GdkWindow` → `GdkSurface` (rename)
- `GdkScreen` removed
- `GdkDeviceManager` removed
- Root window concept removed
- Event structures simplified

### Tasks

#### 2.4.1 Port Core GDK Types

**Location**: `src/gdk.ml`, `src/gdk.mli`

**Major type changes**:
```ocaml
(* GTK3 *)
type window

(* GTK4 *)
type surface  (* was 'window' *)

(* New modules *)
module Surface : sig  (* was Window *)
  type t = surface
  val create_toplevel : display:Display.t -> width:int -> height:int -> t
  val create_popup : display:Display.t -> parent:t -> width:int -> height:int -> t
  val show : t -> unit
  val hide : t -> unit
  val get_width : t -> int
  val get_height : t -> int
  (* Many window-specific functions removed *)
end

module Display : sig
  type t
  val get_default : unit -> t option
  val get_name : t -> string
  (* No more GdkScreen - merged into Display *)
end

module Device : sig
  type t
  val get_name : t -> string
  val get_source : t -> device_type
  (* GdkDeviceManager removed - use GdkSeat *)
end

module Seat : sig  (* New in GTK4 *)
  type t
  val get_pointer : t -> Device.t option
  val get_keyboard : t -> Device.t option
end
```

**Event type changes**:
```ocaml
(* Event structures now opaque - use accessors *)
module Event : sig
  type t
  val get_event_type : t -> event_type
  val get_surface : t -> surface option
  val get_device : t -> Device.t option

  (* Button events *)
  val get_button : t -> int option
  val get_coords : t -> (float * float) option

  (* Key events *)
  val get_keyval : t -> int option
  val get_keycode : t -> int option
  val get_state : t -> modifier_type list option

  (* No more direct struct access *)
end
```

#### 2.4.2 Port ml_gdk.c

**Location**: `src/ml_gdk.c` (currently ~1800 lines)

**Critical changes**:

1. **Rename all GdkWindow to GdkSurface**:
```c
// GTK3
#define GdkWindow_val(val) ((GdkWindow*)Pointer_val(val))
#define Val_GdkWindow(obj) (Val_addr(obj))

// GTK4
#define GdkSurface_val(val) ((GdkSurface*)Pointer_val(val))
#define Val_GdkSurface(obj) (Val_addr(obj))

// Update all function signatures
CAMLprim value ml_gdk_surface_show(value surface)  // was gdk_window_show
{
  CAMLparam1(surface);
  gdk_surface_show(GdkSurface_val(surface));
  CAMLreturn(Val_unit);
}
```

2. **Remove GdkScreen functions**:
```c
// GTK3 (REMOVE)
CAMLprim value ml_gdk_screen_get_default(value unit)
CAMLprim value ml_gdk_screen_get_width(value screen)
// etc.

// GTK4 - use GdkDisplay instead
CAMLprim value ml_gdk_display_get_default(value unit)
{
  GdkDisplay *display = gdk_display_get_default();
  return Val_option(display, Val_GdkDisplay);
}
```

3. **Update event handling**:
```c
// GTK3 - direct struct access
CAMLprim value ml_gdk_event_get_type(value event)
{
  return Val_event_type(((GdkEvent*)Pointer_val(event))->type);
}

// GTK4 - use accessor functions
CAMLprim value ml_gdk_event_get_type(value event)
{
  CAMLparam1(event);
  GdkEventType type = gdk_event_get_event_type(GdkEvent_val(event));
  CAMLreturn(Val_event_type(type));
}

CAMLprim value ml_gdk_event_get_surface(value event)
{
  CAMLparam1(event);
  GdkSurface *surface = gdk_event_get_surface(GdkEvent_val(event));
  CAMLreturn(Val_option(surface, Val_GdkSurface));
}
```

4. **Update device/seat handling**:
```c
// GTK3 (REMOVE GdkDeviceManager)
CAMLprim value ml_gdk_display_get_device_manager(value display)

// GTK4 - use GdkSeat
CAMLprim value ml_gdk_display_get_default_seat(value display)
{
  CAMLparam1(display);
  GdkSeat *seat = gdk_display_get_default_seat(GdkDisplay_val(display));
  CAMLreturn(Val_GdkSeat(seat));
}

CAMLprim value ml_gdk_seat_get_pointer(value seat)
{
  CAMLparam1(seat);
  GdkDevice *device = gdk_seat_get_pointer(GdkSeat_val(seat));
  CAMLreturn(Val_option(device, Val_GdkDevice));
}
```

#### 2.4.3 Update wrappers.h

**Location**: `src/wrappers.h`

Add new conversion macros:
```c
#define GdkSurface_val(val) ((GdkSurface*)Pointer_val(val))
#define Val_GdkSurface(obj) (Val_addr(obj))
#define Val_GdkSurface_some(obj) Val_option(obj, Val_GdkSurface)

#define GdkSeat_val(val) ((GdkSeat*)Pointer_val(val))
#define Val_GdkSeat(obj) (Val_addr(obj))
```

Remove obsolete macros:
```c
// Remove these
#define GdkScreen_val(val)
#define Val_GdkScreen(obj)
#define GdkDeviceManager_val(val)
#define Val_GdkDeviceManager(obj)
```

#### 2.4.4 Testing

Create `tests/test_gdk.ml`:
```ocaml
let test_display () =
  match Gdk.Display.get_default () with
  | None -> fail "No default display"
  | Some display ->
      let name = Gdk.Display.get_name display in
      check (option string) "display name" (Some name) (Some name)

let test_surface () =
  match Gdk.Display.get_default () with
  | None -> skip ()
  | Some display ->
      let surface = Gdk.Surface.create_toplevel display ~width:100 ~height:100 in
      check int "width" 100 (Gdk.Surface.get_width surface);
      check int "height" 100 (Gdk.Surface.get_height surface)

let test_events () =
  (* Test event accessor functions *)
  (* This requires actual event generation - may need to be manual *)
  ()

let () =
  run "GDK Tests" [
    "display", [ test_case "get_default" `Quick test_display ];
    "surface", [ test_case "create_toplevel" `Quick test_surface ];
  ]
```

**Success Criteria**:
- GdkDisplay functions work
- GdkSurface creation/manipulation works
- Event accessors work correctly
- No deprecated API usage
- All tests pass

**Estimated Time**: 2.5 weeks

---

## 2.5 Pango Module Migration (1 week)

**Priority**: MEDIUM (text rendering)

### Overview

Pango (text layout library) has minimal changes in GTK4. Still uses same APIs for fonts, layouts, attributes.

### Tasks

#### 2.5.1 Port pango.ml/mli

**Location**: `src/pango.ml`, `src/pango.mli`

**Key modules** (unchanged):
```ocaml
module Font : sig
  type description
  val from_string : string -> description
  val to_string : description -> string
  ...
end

module Context : sig
  type t
  val set_font_map : t -> Font.font_map -> unit
  val get_metrics : t -> Font.description -> Font.metrics
  ...
end

module Layout : sig
  type t
  val create : Context.t -> t
  val set_text : t -> string -> unit
  val get_text : t -> string
  val set_font_description : t -> Font.description -> unit
  val get_pixel_size : t -> int * int
  ...
end

module Attributes : sig
  type t
  val create : unit -> t
  val insert : t -> attribute -> unit
  ...
end
```

**Changes needed**: None expected

#### 2.5.2 Port ml_pango.c

**Location**: `src/ml_pango.c` (currently ~600 lines)

**Verify functions compile**:
```c
CAMLprim value ml_pango_font_description_from_string(value str)
CAMLprim value ml_pango_layout_new(value context)
CAMLprim value ml_pango_layout_set_text(value layout, value text)
CAMLprim value ml_pango_layout_get_pixel_size(value layout)
```

**Testing**: Create layout, set text, get size

**Success Criteria**:
- Font descriptions work
- Layouts can be created and measured
- Attributes work correctly
- No memory leaks

**Estimated Time**: 1 week

---

## 2.6 New GdkClipboard Implementation (1 week)

**Priority**: HIGH (new API in GTK4)

### Overview

GTK4 completely replaced `GtkClipboard` with `GdkClipboard` using `GValue` and `GType` instead of opaque atoms.

### Tasks

#### 2.6.1 Create gdkClipboard.ml/mli

**Location**: `src/gdkClipboard.ml`, `src/gdkClipboard.mli` (NEW FILE)

**API design**:
```ocaml
type t

val get : Gdk.Display.t -> t
val get_primary : Gdk.Display.t -> t

(* Async read operations *)
val read_text_async : t -> callback:(string option -> unit) -> unit
val read_texture_async : t -> callback:(Gdk.Texture.t option -> unit) -> unit

(* Sync operations *)
val set_text : t -> string -> unit
val set_texture : t -> Gdk.Texture.t -> unit

(* Content queries *)
module Formats : sig
  type t
  val contains_text : t -> bool
  val contains_texture : t -> bool
  val get_gtypes : t -> GObject.g_type list
end

val get_formats : t -> Formats.t
```

#### 2.6.2 Create ml_gdk_clipboard.c

**Location**: `src/ml_gdk_clipboard.c` (NEW FILE)

**Implementation**:
```c
#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>

CAMLprim value ml_gdk_display_get_clipboard(value display)
{
  CAMLparam1(display);
  GdkClipboard *clipboard = gdk_display_get_clipboard(GdkDisplay_val(display));
  CAMLreturn(Val_GdkClipboard(clipboard));
}

// Async read with callback
static void read_text_callback(GObject *source, GAsyncResult *res, gpointer user_data)
{
  CAMLparam0();
  CAMLlocal1(ocaml_callback);

  ocaml_callback = *(value*)user_data;

  GError *error = NULL;
  char *text = gdk_clipboard_read_text_finish(GDK_CLIPBOARD(source), res, &error);

  if (text) {
    caml_callback(ocaml_callback, Val_some(caml_copy_string(text)));
    g_free(text);
  } else {
    caml_callback(ocaml_callback, Val_none);
  }

  ml_global_root_destroy(user_data);
  CAMLreturn0;
}

CAMLprim value ml_gdk_clipboard_read_text_async(value clipboard, value callback)
{
  CAMLparam2(clipboard, callback);

  value *callback_root = ml_global_root_new(callback);

  gdk_clipboard_read_text_async(
    GdkClipboard_val(clipboard),
    NULL,  // cancellable
    read_text_callback,
    callback_root
  );

  CAMLreturn(Val_unit);
}

CAMLprim value ml_gdk_clipboard_set_text(value clipboard, value text)
{
  CAMLparam2(clipboard, text);
  gdk_clipboard_set_text(GdkClipboard_val(clipboard), String_val(text));
  CAMLreturn(Val_unit);
}
```

#### 2.6.3 Testing

```ocaml
let test_clipboard_text () =
  match Gdk.Display.get_default () with
  | None -> skip ()
  | Some display ->
      let clipboard = GdkClipboard.get display in
      GdkClipboard.set_text clipboard "Test clipboard content";

      let result = ref None in
      GdkClipboard.read_text_async clipboard (fun text ->
        result := Some text
      );

      (* Run main loop briefly to process async *)
      while !result = None do
        Glib.Main.iteration true
      done;

      check (option string) "clipboard text" (Some "Test clipboard content") !result
```

**Success Criteria**:
- Can set/get text from clipboard
- Async callbacks work correctly
- No memory leaks in callback handling

**Estimated Time**: 1 week

---

## Phase 2 Deliverables

At the end of Phase 2, the following should be complete:

**Code:**
- [ ] GLib module fully ported and tested
- [ ] GObject module with properties/signals working
- [ ] GdkPixbuf module ported
- [ ] Gdk module with GdkSurface (was GdkWindow)
- [ ] Pango module ported
- [ ] GdkClipboard new implementation
- [ ] All tests passing

**Documentation:**
- [ ] API changes document (GdkWindow→GdkSurface, etc.)
- [ ] Clipboard migration guide
- [ ] Memory management notes

**Testing:**
- [ ] test_glib.ml passing
- [ ] test_gobject.ml passing
- [ ] test_gdk.ml passing
- [ ] test_pango.ml passing
- [ ] test_clipboard.ml passing
- [ ] No memory leaks (valgrind clean)

**Validation:**
- [ ] Can create GdkSurface
- [ ] Can connect GObject signals
- [ ] Can use clipboard
- [ ] Main loop integration works
- [ ] All deprecated APIs removed

**Next Phase Prerequisites:**
- Core modules ready for widget layer
- Event system ready for event controllers (Phase 3)
- GObject signals working for widget signals
- Display/Surface infrastructure for windows

---
