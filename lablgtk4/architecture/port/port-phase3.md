# Phase 3: Base Widget Infrastructure (6-8 weeks)

**Objective**: Implement the core GtkWidget infrastructure with GTK4's new rendering and event systems. This phase establishes the foundation for all higher-level widgets.

**Dependencies**: Phase 2 must be complete (GObject, Gdk, Pango working)

**Status**: 🔜 **READY TO START**

---

## Overview

Phase 3 represents the most significant architectural shift in the GTK3→GTK4 migration. The entire widget event and rendering model has been redesigned:

### Critical Changes from GTK3

1. **Drawing → Snapshot**: `GtkWidget::draw` signal removed, replaced with `GtkWidget::snapshot` vfunc
2. **Event Signals → Event Controllers**: All event signals (`::button-press-event`, etc.) replaced by `GtkEventController` system
3. **Widget Lifecycle**: New `root`/`unroot` vfuncs for widget hierarchy management
4. **Focus System**: `can-focus` replaced with `focusable` property
5. **Default Visibility**: Widgets visible by default (no `gtk_widget_show_all()`)

### Architecture Impact

This phase touches every layer of the widget system:
- **C FFI Layer**: New event controller C bindings, snapshot API
- **OCaml Type System**: Event controller hierarchy, snapshot types
- **High-Level API**: New event connection patterns, rendering abstractions

---

## 3.1 Core GtkWidget Migration (1.5 weeks)

**Priority**: CRITICAL (foundation for all widgets)

### Overview

GtkWidget is the base class for all GTK widgets. In GTK4, the widget API has been streamlined with several key changes:

- Many methods moved from `GtkContainer` → `GtkWidget`
- New lifecycle vfuncs (`root`, `unroot`)
- Default visibility behavior
- Simplified size allocation
- Focus handling changes

### Tasks

#### 3.1.1 Port gtk.ml/mli (Base Widget Types)

**Location**: `lablgtk4/src/gtk.ml`, `lablgtk4/src/gtk.mli`

**New type definitions**:

```ocaml
(* Core widget type *)
type widget = [`widget] obj

(* Widget-related types *)
type requisition = { width : int; height : int }
type allocation = { x : int; y : int; width : int; height : int }

(* Align type from enums *)
type align = Gtk4Enums.align

(* Size request mode *)
type size_request_mode = [
  | `HEIGHT_FOR_WIDTH
  | `WIDTH_FOR_HEIGHT
  | `CONSTANT_SIZE
]

module Widget : sig
  type t = widget

  (* Creation and destruction *)
  val destroy : t -> unit

  (* Visibility - note: visible by default in GTK4 *)
  val show : t -> unit
  val hide : t -> unit
  val get_visible : t -> bool
  val set_visible : t -> bool -> unit

  (* Size and allocation *)
  val get_allocated_width : t -> int
  val get_allocated_height : t -> int
  val get_width : t -> int
  val get_height : t -> int
  val set_size_request : t -> width:int -> height:int -> unit
  val get_size_request : t -> int * int

  (* Properties *)
  val get_sensitive : t -> bool
  val set_sensitive : t -> bool -> unit
  val get_name : t -> string
  val set_name : t -> string -> unit

  (* Focus *)
  val get_focusable : t -> bool  (* was can_focus in GTK3 *)
  val set_focusable : t -> bool -> unit
  val has_focus : t -> bool
  val grab_focus : t -> unit

  (* Parent/child *)
  val get_parent : t -> widget option
  val get_root : t -> widget option  (* NEW in GTK4 *)

  (* CSS and styling *)
  val add_css_class : t -> string -> unit  (* NEW in GTK4 *)
  val remove_css_class : t -> string -> unit
  val has_css_class : t -> string -> bool
  val get_css_classes : t -> string list

  (* State *)
  val get_state_flags : t -> state_flags list
  val set_state_flags : t -> state_flags list -> clear:bool -> unit

  (* Misc *)
  val queue_draw : t -> unit
  val queue_resize : t -> unit
end
```

**Key differences from GTK3**:
- No `gtk_widget_show_all()` - widgets visible by default
- `can_focus` → `focusable` property
- CSS classes replace style context methods
- `get_root()` returns top-level widget (no `get_toplevel()`)

#### 3.1.2 Port ml_gtk.c (Base Widget Bindings)

**Location**: `lablgtk4/src/ml_gtk.c` (NEW FILE, ~400 lines initially)

**Implementation**:

```c
#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include "wrappers.h"
#include "ml_gobject.h"
#include "ml_gdk.h"

/* Widget type conversions */
#define GtkWidget_val(val) ((GtkWidget*)Pointer_val(val))
#define Val_GtkWidget(obj) (Val_addr(obj))

/* ========== Visibility ========== */

CAMLprim value ml_gtk_widget_show(value widget)
{
  CAMLparam1(widget);
  gtk_widget_show(GtkWidget_val(widget));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_widget_hide(value widget)
{
  CAMLparam1(widget);
  gtk_widget_hide(GtkWidget_val(widget));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_widget_get_visible(value widget)
{
  CAMLparam1(widget);
  gboolean visible = gtk_widget_get_visible(GtkWidget_val(widget));
  CAMLreturn(Val_bool(visible));
}

CAMLprim value ml_gtk_widget_set_visible(value widget, value visible)
{
  CAMLparam2(widget, visible);
  gtk_widget_set_visible(GtkWidget_val(widget), Bool_val(visible));
  CAMLreturn(Val_unit);
}

/* ========== Size and Allocation ========== */

CAMLprim value ml_gtk_widget_get_allocated_width(value widget)
{
  CAMLparam1(widget);
  int width = gtk_widget_get_allocated_width(GtkWidget_val(widget));
  CAMLreturn(Val_int(width));
}

CAMLprim value ml_gtk_widget_get_allocated_height(value widget)
{
  CAMLparam1(widget);
  int height = gtk_widget_get_allocated_height(GtkWidget_val(widget));
  CAMLreturn(Val_int(height));
}

CAMLprim value ml_gtk_widget_get_width(value widget)
{
  CAMLparam1(widget);
  int width = gtk_widget_get_width(GtkWidget_val(widget));
  CAMLreturn(Val_int(width));
}

CAMLprim value ml_gtk_widget_get_height(value widget)
{
  CAMLparam1(widget);
  int height = gtk_widget_get_height(GtkWidget_val(widget));
  CAMLreturn(Val_int(height));
}

CAMLprim value ml_gtk_widget_set_size_request(value widget, value width, value height)
{
  CAMLparam3(widget, width, height);
  gtk_widget_set_size_request(
    GtkWidget_val(widget),
    Int_val(width),
    Int_val(height)
  );
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_widget_get_size_request(value widget)
{
  CAMLparam1(widget);
  CAMLlocal1(result);
  int width, height;

  gtk_widget_get_size_request(GtkWidget_val(widget), &width, &height);

  result = caml_alloc_tuple(2);
  Store_field(result, 0, Val_int(width));
  Store_field(result, 1, Val_int(height));

  CAMLreturn(result);
}

/* ========== Focus ========== */

CAMLprim value ml_gtk_widget_get_focusable(value widget)
{
  CAMLparam1(widget);
  gboolean focusable = gtk_widget_get_focusable(GtkWidget_val(widget));
  CAMLreturn(Val_bool(focusable));
}

CAMLprim value ml_gtk_widget_set_focusable(value widget, value focusable)
{
  CAMLparam2(widget, focusable);
  gtk_widget_set_focusable(GtkWidget_val(widget), Bool_val(focusable));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_widget_has_focus(value widget)
{
  CAMLparam1(widget);
  gboolean has_focus = gtk_widget_has_focus(GtkWidget_val(widget));
  CAMLreturn(Val_bool(has_focus));
}

CAMLprim value ml_gtk_widget_grab_focus(value widget)
{
  CAMLparam1(widget);
  gboolean result = gtk_widget_grab_focus(GtkWidget_val(widget));
  CAMLreturn(Val_bool(result));
}

/* ========== Parent/Root ========== */

CAMLprim value ml_gtk_widget_get_parent(value widget)
{
  CAMLparam1(widget);
  GtkWidget *parent = gtk_widget_get_parent(GtkWidget_val(widget));
  CAMLreturn(Val_option(parent, Val_GtkWidget));
}

CAMLprim value ml_gtk_widget_get_root(value widget)
{
  CAMLparam1(widget);
  GtkRoot *root = gtk_widget_get_root(GtkWidget_val(widget));
  /* GtkRoot is a GtkWidget */
  CAMLreturn(Val_option(root, Val_GtkWidget));
}

/* ========== CSS Classes ========== */

CAMLprim value ml_gtk_widget_add_css_class(value widget, value css_class)
{
  CAMLparam2(widget, css_class);
  gtk_widget_add_css_class(GtkWidget_val(widget), String_val(css_class));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_widget_remove_css_class(value widget, value css_class)
{
  CAMLparam2(widget, css_class);
  gtk_widget_remove_css_class(GtkWidget_val(widget), String_val(css_class));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_widget_has_css_class(value widget, value css_class)
{
  CAMLparam2(widget, css_class);
  gboolean has_class = gtk_widget_has_css_class(
    GtkWidget_val(widget),
    String_val(css_class)
  );
  CAMLreturn(Val_bool(has_class));
}

CAMLprim value ml_gtk_widget_get_css_classes(value widget)
{
  CAMLparam1(widget);
  CAMLlocal2(result, cons);

  gchar **classes = gtk_widget_get_css_classes(GtkWidget_val(widget));

  result = Val_emptylist;
  if (classes) {
    /* Build list in reverse order, then reverse */
    for (int i = 0; classes[i] != NULL; i++) {
      cons = caml_alloc(2, 0);
      Store_field(cons, 0, caml_copy_string(classes[i]));
      Store_field(cons, 1, result);
      result = cons;
    }
    g_strfreev(classes);
  }

  CAMLreturn(result);
}

/* ========== Queue Draw/Resize ========== */

CAMLprim value ml_gtk_widget_queue_draw(value widget)
{
  CAMLparam1(widget);
  gtk_widget_queue_draw(GtkWidget_val(widget));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_widget_queue_resize(value widget)
{
  CAMLparam1(widget);
  gtk_widget_queue_resize(GtkWidget_val(widget));
  CAMLreturn(Val_unit);
}

/* ========== Properties ========== */

CAMLprim value ml_gtk_widget_get_sensitive(value widget)
{
  CAMLparam1(widget);
  gboolean sensitive = gtk_widget_get_sensitive(GtkWidget_val(widget));
  CAMLreturn(Val_bool(sensitive));
}

CAMLprim value ml_gtk_widget_set_sensitive(value widget, value sensitive)
{
  CAMLparam2(widget, sensitive);
  gtk_widget_set_sensitive(GtkWidget_val(widget), Bool_val(sensitive));
  CAMLreturn(Val_unit);
}

/* ========== Destruction ========== */

/* Note: In GTK4, gtk_widget_destroy is deprecated
 * Use g_object_run_dispose or let widget be finalized naturally */
CAMLprim value ml_gtk_widget_destroy(value widget)
{
  CAMLparam1(widget);
  /* For compatibility, we unparent the widget */
  GtkWidget *w = GtkWidget_val(widget);
  GtkWidget *parent = gtk_widget_get_parent(w);
  if (parent) {
    /* This will vary by container type in GTK4 */
    /* We'll need container-specific removal in Phase 4 */
    g_warning("gtk_widget_destroy: widget removal requires container-specific API in GTK4");
  }
  CAMLreturn(Val_unit);
}
```

**Notes**:
- `gtk_widget_destroy()` deprecated in GTK4 - widgets are destroyed via container removal
- CSS class methods are new in GTK4 (were in GtkStyleContext in GTK3)
- `focusable` property replaces `can_focus`

#### 3.1.3 Update dune Configuration

**Location**: `lablgtk4/src/dune`

Add `ml_gtk.c` to the c_names list:

```lisp
(library
 (name lablgtk4)
 (public_name lablgtk4)
 (wrapped false)
 (c_names
   wrappers
   ml_glib
   ml_gobject
   ml_gdk
   ml_gdkpixbuf
   ml_gdk_clipboard
   ml_pango
   ml_gtk)  ; NEW
 (c_flags (:include cflag-gtk4.sexp))
 (c_library_flags (:include clink-gtk4.sexp))
 (libraries threads cairo2)
 (modules
   gpointer glib gobject gdk gdkPixbuf pango
   gtk))  ; NEW module
```

#### 3.1.4 Testing

Create `tests/test_widget.ml`:

```ocaml
open Alcotest

(* Helper: create a simple label widget for testing *)
let create_test_widget () =
  match Gdk.Display.get_default () with
  | None -> failwith "No display available"
  | Some display ->
      (* We'll need GtkLabel from Phase 5, for now use direct C call *)
      (* This is a placeholder - actual implementation in Phase 5 *)
      failwith "Widget creation needs container support (Phase 4)"

let test_visibility () =
  skip ()  (* Skip until we have widget creation *)

let test_size_request () =
  skip ()  (* Skip until we have widget creation *)

let test_css_classes () =
  skip ()  (* Skip until we have widget creation *)

let test_focus () =
  skip ()  (* Skip until we have widget creation *)

let () =
  run "Widget Tests" [
    "visibility", [
      test_case "show/hide" `Quick test_visibility
    ];
    "size", [
      test_case "size_request" `Quick test_size_request
    ];
    "css", [
      test_case "css_classes" `Quick test_css_classes
    ];
    "focus", [
      test_case "focusable" `Quick test_focus
    ];
  ]
```

**Note**: Full widget tests require containers (Phase 4) and actual widgets (Phase 5).

**Success Criteria**:
- `gtk.ml` and `ml_gtk.c` compile without errors
- Widget type definitions match GTK4 API
- CSS class methods work correctly
- Focus handling uses `focusable` property
- All deprecated GTK3 APIs removed

**Estimated Time**: 1.5 weeks

---

## 3.2 GtkSnapshot Rendering System (1.5 weeks)

**Priority**: HIGH (new rendering model)

### Overview

GTK4 replaced the `GtkWidget::draw` signal with a `GtkSnapshot` API. Instead of receiving a Cairo context directly, widgets now receive a `GtkSnapshot` object and build a render tree.

**Key concepts**:
- **Snapshot**: Records rendering operations into a render node tree
- **Render Nodes**: Immutable scene graph nodes (Cairo, color, texture, etc.)
- **Cairo Compatibility**: `gtk_snapshot_append_cairo()` for backward compatibility

### Tasks

#### 3.2.1 Create gtkSnapshot.ml/mli

**Location**: `lablgtk4/src/gtkSnapshot.ml`, `lablgtk4/src/gtkSnapshot.mli` (NEW FILES)

**Interface definition**:

```ocaml
(** GTK4 Snapshot Rendering API *)

type t

(** {2 Cairo Integration} *)

(** Append a Cairo drawing operation to the snapshot.
    Returns a Cairo context to draw with. *)
val append_cairo : t -> width:float -> height:float -> Cairo.context

(** {2 Basic Rendering} *)

(** Append a colored rectangle *)
val append_color :
  t ->
  color:Gdk.RGBA.t ->
  bounds:Graphene.Rect.t ->
  unit

(** {2 Transformations} *)

(** Save the current transformation state *)
val save : t -> unit

(** Restore the previously saved transformation state *)
val restore : t -> unit

(** Translate the snapshot *)
val translate : t -> point:Graphene.Point.t -> unit

(** Scale the snapshot *)
val scale : t -> factor_x:float -> factor_y:float -> unit

(** Rotate the snapshot (angle in degrees) *)
val rotate : t -> angle:float -> unit

(** {2 Clipping} *)

(** Push a rectangular clip region *)
val push_clip : t -> bounds:Graphene.Rect.t -> unit

(** Pop the clip region *)
val pop : t -> unit

(** {2 Opacity} *)

(** Push an opacity modifier *)
val push_opacity : t -> opacity:float -> unit

(** {2 Advanced} *)

(** Append a texture *)
val append_texture : t -> texture:Gdk.Texture.t -> bounds:Graphene.Rect.t -> unit

(** Render a child snapshot *)
val append_node : t -> node:Gsk.RenderNode.t -> unit
```

**Notes**:
- Depends on `Graphene` (geometry library) - need bindings
- Depends on `Gsk` (render node library) - may defer advanced features
- Cairo compatibility via `append_cairo` is essential for migration

#### 3.2.2 Create ml_gtk_snapshot.c

**Location**: `lablgtk4/src/ml_gtk_snapshot.c` (NEW FILE, ~300 lines)

**Implementation**:

```c
#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include "wrappers.h"

/* Snapshot type conversion */
#define GtkSnapshot_val(val) ((GtkSnapshot*)Pointer_val(val))
#define Val_GtkSnapshot(obj) (Val_addr(obj))

/* ========== Cairo Integration ========== */

CAMLprim value ml_gtk_snapshot_append_cairo(value snapshot, value width, value height)
{
  CAMLparam3(snapshot, width, height);
  CAMLlocal1(result);

  graphene_rect_t bounds;
  graphene_rect_init(&bounds, 0, 0, Double_val(width), Double_val(height));

  cairo_t *cr = gtk_snapshot_append_cairo(
    GtkSnapshot_val(snapshot),
    &bounds
  );

  /* Return Cairo context wrapped for OCaml cairo2 library */
  result = Val_cairo_t(cr);
  /* Note: cairo_t is owned by snapshot, will be freed automatically */

  CAMLreturn(result);
}

/* ========== Basic Rendering ========== */

CAMLprim value ml_gtk_snapshot_append_color(value snapshot, value color, value bounds)
{
  CAMLparam3(snapshot, color, bounds);

  GdkRGBA gdk_color;
  /* Assuming RGBA is { r : float; g : float; b : float; a : float } record */
  gdk_color.red = Double_field(color, 0);
  gdk_color.green = Double_field(color, 1);
  gdk_color.blue = Double_field(color, 2);
  gdk_color.alpha = Double_field(color, 3);

  graphene_rect_t rect;
  /* Assuming bounds is { x : float; y : float; width : float; height : float } */
  graphene_rect_init(
    &rect,
    Double_field(bounds, 0),  /* x */
    Double_field(bounds, 1),  /* y */
    Double_field(bounds, 2),  /* width */
    Double_field(bounds, 3)   /* height */
  );

  gtk_snapshot_append_color(
    GtkSnapshot_val(snapshot),
    &gdk_color,
    &rect
  );

  CAMLreturn(Val_unit);
}

/* ========== Transformations ========== */

CAMLprim value ml_gtk_snapshot_save(value snapshot)
{
  CAMLparam1(snapshot);
  gtk_snapshot_save(GtkSnapshot_val(snapshot));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_snapshot_restore(value snapshot)
{
  CAMLparam1(snapshot);
  gtk_snapshot_restore(GtkSnapshot_val(snapshot));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_snapshot_translate(value snapshot, value point)
{
  CAMLparam2(snapshot, point);

  graphene_point_t pt;
  graphene_point_init(&pt, Double_field(point, 0), Double_field(point, 1));

  gtk_snapshot_translate(GtkSnapshot_val(snapshot), &pt);

  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_snapshot_scale(value snapshot, value factor_x, value factor_y)
{
  CAMLparam3(snapshot, factor_x, factor_y);

  gtk_snapshot_scale(
    GtkSnapshot_val(snapshot),
    Double_val(factor_x),
    Double_val(factor_y)
  );

  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_snapshot_rotate(value snapshot, value angle)
{
  CAMLparam2(snapshot, angle);

  gtk_snapshot_rotate(GtkSnapshot_val(snapshot), Double_val(angle));

  CAMLreturn(Val_unit);
}

/* ========== Clipping ========== */

CAMLprim value ml_gtk_snapshot_push_clip(value snapshot, value bounds)
{
  CAMLparam2(snapshot, bounds);

  graphene_rect_t rect;
  graphene_rect_init(
    &rect,
    Double_field(bounds, 0),
    Double_field(bounds, 1),
    Double_field(bounds, 2),
    Double_field(bounds, 3)
  );

  gtk_snapshot_push_clip(GtkSnapshot_val(snapshot), &rect);

  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_snapshot_pop(value snapshot)
{
  CAMLparam1(snapshot);
  gtk_snapshot_pop(GtkSnapshot_val(snapshot));
  CAMLreturn(Val_unit);
}

/* ========== Opacity ========== */

CAMLprim value ml_gtk_snapshot_push_opacity(value snapshot, value opacity)
{
  CAMLparam2(snapshot, opacity);

  gtk_snapshot_push_opacity(GtkSnapshot_val(snapshot), Double_val(opacity));

  CAMLreturn(Val_unit);
}
```

**Dependencies needed**:
- Need `Graphene` geometry types (Point, Rect)
- Need `Gdk.RGBA` type
- Need Cairo context wrapping

#### 3.2.3 Create Minimal Graphene Bindings

**Location**: `lablgtk4/src/graphene.ml`, `lablgtk4/src/graphene.mli` (NEW FILES)

**Minimal interface for snapshot support**:

```ocaml
(** Graphene geometry library (minimal bindings for GTK4) *)

module Point : sig
  type t = { x : float; y : float }

  val make : x:float -> y:float -> t
end

module Rect : sig
  type t = { x : float; y : float; width : float; height : float }

  val make : x:float -> y:float -> width:float -> height:float -> t
  val zero : t
end

module Size : sig
  type t = { width : float; height : float }

  val make : width:float -> height:float -> t
end
```

**Implementation**:

```ocaml
module Point = struct
  type t = { x : float; y : float }
  let make ~x ~y = { x; y }
end

module Rect = struct
  type t = { x : float; y : float; width : float; height : float }
  let make ~x ~y ~width ~height = { x; y; width; height }
  let zero = { x = 0.; y = 0.; width = 0.; height = 0. }
end

module Size = struct
  type t = { width : float; height : float }
  let make ~width ~height = { width; height }
end
```

**Note**: These are OCaml record types that map to C graphene types in FFI calls.

#### 3.2.4 Add GDK RGBA Type

**Location**: Update `lablgtk4/src/gdk.ml` and `lablgtk4/src/gdk.mli`

Add RGBA module:

```ocaml
module RGBA : sig
  type t = { red : float; green : float; blue : float; alpha : float }

  val make : red:float -> green:float -> blue:float -> alpha:float -> t
  val black : t
  val white : t
  val transparent : t

  val parse : string -> t option
  val to_string : t -> string
end
```

Implementation in `ml_gdk.c`:

```c
CAMLprim value ml_gdk_rgba_parse(value str)
{
  CAMLparam1(str);
  CAMLlocal2(result, rgba_val);

  GdkRGBA rgba;
  if (gdk_rgba_parse(&rgba, String_val(str))) {
    rgba_val = caml_alloc(4 * Double_wosize, Double_array_tag);
    Store_double_field(rgba_val, 0, rgba.red);
    Store_double_field(rgba_val, 1, rgba.green);
    Store_double_field(rgba_val, 2, rgba.blue);
    Store_double_field(rgba_val, 3, rgba.alpha);
    result = Val_some(rgba_val);
  } else {
    result = Val_none;
  }

  CAMLreturn(result);
}

CAMLprim value ml_gdk_rgba_to_string(value rgba)
{
  CAMLparam1(rgba);
  CAMLlocal1(result);

  GdkRGBA gdk_rgba;
  gdk_rgba.red = Double_field(rgba, 0);
  gdk_rgba.green = Double_field(rgba, 1);
  gdk_rgba.blue = Double_field(rgba, 2);
  gdk_rgba.alpha = Double_field(rgba, 3);

  gchar *str = gdk_rgba_to_string(&gdk_rgba);
  result = caml_copy_string(str);
  g_free(str);

  CAMLreturn(result);
}
```

#### 3.2.5 Testing

Create `tests/test_snapshot.ml`:

```ocaml
open Alcotest

let test_graphene_types () =
  let point = Graphene.Point.make ~x:10.0 ~y:20.0 in
  check (float 0.001) "point x" 10.0 point.x;
  check (float 0.001) "point y" 20.0 point.y;

  let rect = Graphene.Rect.make ~x:0.0 ~y:0.0 ~width:100.0 ~height:50.0 in
  check (float 0.001) "rect width" 100.0 rect.width;
  check (float 0.001) "rect height" 50.0 rect.height

let test_rgba () =
  let black = Gdk.RGBA.make ~red:0.0 ~green:0.0 ~blue:0.0 ~alpha:1.0 in
  check (float 0.001) "black red" 0.0 black.red;

  match Gdk.RGBA.parse "rgb(255,0,0)" with
  | None -> fail "Failed to parse color"
  | Some red ->
      check (float 0.01) "red component" 1.0 red.red;
      check (float 0.01) "green component" 0.0 red.green

let test_snapshot_cairo () =
  skip ()  (* Requires widget creation - Phase 4+ *)

let () =
  run "Snapshot Tests" [
    "graphene", [
      test_case "types" `Quick test_graphene_types
    ];
    "rgba", [
      test_case "color_parsing" `Quick test_rgba
    ];
    "snapshot", [
      test_case "cairo_append" `Quick test_snapshot_cairo
    ];
  ]
```

**Success Criteria**:
- Graphene types (Point, Rect) work correctly
- RGBA color parsing works
- GtkSnapshot C bindings compile
- Cairo integration via `append_cairo` functional
- Transformation and clipping APIs work

**Estimated Time**: 1.5 weeks

---

## 3.3 Event Controller System (2-3 weeks)

**Priority**: CRITICAL (replaces all event signals)

### Overview

This is the most significant breaking change in GTK4. All event signals (`::button-press-event`, `::key-press-event`, etc.) have been removed and replaced with **Event Controllers**.

**GTK3 approach** (REMOVED):
```ocaml
ignore (widget#event#connect#button_press ~callback:(fun ev ->
  Printf.printf "Button pressed at %f, %f\n"
    (GdkEvent.Button.x ev) (GdkEvent.Button.y ev);
  false
))
```

**GTK4 approach** (NEW):
```ocaml
let controller = GtkGesture.Click.new_ () in
GtkGesture.Click.connect_pressed controller ~callback:(fun n_press x y ->
  Printf.printf "Button pressed at %f, %f\n" x y
);
GtkWidget.add_controller widget controller
```

### Event Controller Hierarchy

```
GtkEventController (base class)
├── GtkEventControllerKey (keyboard events)
├── GtkEventControllerFocus (focus events)
├── GtkEventControllerMotion (mouse motion)
├── GtkEventControllerScroll (scrolling)
├── GtkEventControllerLegacy (raw GdkEvent access)
└── GtkGesture (gesture recognition base)
    ├── GtkGestureSingle (single-touch base)
    │   ├── GtkGestureClick (was GtkGestureMultiPress)
    │   ├── GtkGestureDrag
    │   ├── GtkGestureLongPress
    │   └── GtkGestureStylus
    ├── GtkGestureRotate
    ├── GtkGestureZoom
    └── GtkGestureSwipe
```

### Tasks

#### 3.3.1 Create eventController.ml/mli (Base Controller)

**Location**: `lablgtk4/src/eventController.ml`, `lablgtk4/src/eventController.mli` (NEW FILES)

**Base interface**:

```ocaml
(** GTK4 Event Controller System *)

(** Base event controller type *)
type t

(** Propagation phase *)
type propagation_phase = [
  | `NONE
  | `CAPTURE   (* Event captured going down *)
  | `BUBBLE    (* Event bubbles up *)
  | `TARGET    (* Event at target widget *)
]

(** Propagation limit *)
type propagation_limit = [
  | `NONE
  | `SAME_NATIVE  (* Stop at window boundary *)
]

module Base : sig
  (** Get the widget this controller is attached to *)
  val get_widget : t -> Gtk.Widget.t

  (** Get propagation phase *)
  val get_propagation_phase : t -> propagation_phase

  (** Set propagation phase *)
  val set_propagation_phase : t -> propagation_phase -> unit

  (** Get propagation limit *)
  val get_propagation_limit : t -> propagation_limit

  (** Set propagation limit *)
  val set_propagation_limit : t -> propagation_limit -> unit

  (** Reset the controller state *)
  val reset : t -> unit

  (** Get the current event being processed *)
  val get_current_event : t -> Gdk.Event.t option

  (** Get current event device *)
  val get_current_event_device : t -> Gdk.Device.t option

  (** Get current event time *)
  val get_current_event_time : t -> int
end
```

#### 3.3.2 Create eventControllerKey.ml/mli (Keyboard)

**Location**: `lablgtk4/src/eventControllerKey.ml`, `lablgtk4/src/eventControllerKey.mli`

**Interface**:

```ocaml
(** Keyboard event controller *)

type t = EventController.t

(** Create a new keyboard event controller *)
val new_ : unit -> t

(** Signals *)

(** Emitted when a key is pressed *)
val connect_key_pressed :
  t ->
  callback:(keyval:int -> keycode:int -> state:Gdk.ModifierType.t -> bool) ->
  GObject.signal_id

(** Emitted when a key is released *)
val connect_key_released :
  t ->
  callback:(keyval:int -> keycode:int -> state:Gdk.ModifierType.t -> unit) ->
  GObject.signal_id

(** Emitted for modifier-only events *)
val connect_modifiers :
  t ->
  callback:(state:Gdk.ModifierType.t -> bool) ->
  GObject.signal_id

(** Forward the event to the IM context *)
val forward : t -> Gdk.Event.t -> bool

(** Get the IM context *)
val get_im_context : t -> GtkIMContext.t option
```

#### 3.3.3 Create eventControllerMotion.ml/mli (Mouse Motion)

**Location**: `lablgtk4/src/eventControllerMotion.ml`, `lablgtk4/src/eventControllerMotion.mli`

**Interface**:

```ocaml
(** Mouse motion event controller *)

type t = EventController.t

(** Create a new motion event controller *)
val new_ : unit -> t

(** Signals *)

(** Emitted when pointer enters widget *)
val connect_enter :
  t ->
  callback:(x:float -> y:float -> unit) ->
  GObject.signal_id

(** Emitted when pointer leaves widget *)
val connect_leave :
  t ->
  callback:(unit -> unit) ->
  GObject.signal_id

(** Emitted when pointer moves within widget *)
val connect_motion :
  t ->
  callback:(x:float -> y:float -> unit) ->
  GObject.signal_id

(** Check if pointer is currently in widget *)
val contains_pointer : t -> bool

(** Check if this widget is receiving motion events *)
val is_pointer : t -> bool
```

#### 3.3.4 Create gestureClick.ml/mli (Click/Button Events)

**Location**: `lablgtk4/src/gestureClick.ml`, `lablgtk4/src/gestureClick.mli`

**Interface**:

```ocaml
(** Click/button press gesture recognizer *)

type t = EventController.t

(** Create a new click gesture controller *)
val new_ : unit -> t

(** Signals *)

(** Emitted when button is pressed
    @param n_press Click count (1 = single, 2 = double, etc.)
    @param x X coordinate
    @param y Y coordinate *)
val connect_pressed :
  t ->
  callback:(n_press:int -> x:float -> y:float -> unit) ->
  GObject.signal_id

(** Emitted when button is released *)
val connect_released :
  t ->
  callback:(n_press:int -> x:float -> y:float -> unit) ->
  GObject.signal_id

(** Emitted when gesture is recognized as a stop event *)
val connect_stopped :
  t ->
  callback:(unit -> unit) ->
  GObject.signal_id

(** Emitted when click is not paired with release (drag started) *)
val connect_unpaired_release :
  t ->
  callback:(x:float -> y:float -> button:int -> sequence:Gdk.EventSequence.t option -> unit) ->
  GObject.signal_id

(** Set which button to respond to (0 = all, 1 = primary, 2 = middle, 3 = right) *)
val set_button : t -> int -> unit

(** Get which button this gesture responds to *)
val get_button : t -> int
```

#### 3.3.5 Implement C Bindings for Event Controllers

**Location**: `lablgtk4/src/ml_event_controller.c` (NEW FILE, ~600 lines)

**Key implementation sections**:

```c
#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Event controller type conversion */
#define GtkEventController_val(val) ((GtkEventController*)Pointer_val(val))
#define Val_GtkEventController(obj) (Val_addr(obj))

/* ========== Base Event Controller ========== */

CAMLprim value ml_gtk_event_controller_get_widget(value controller)
{
  CAMLparam1(controller);
  GtkWidget *widget = gtk_event_controller_get_widget(
    GtkEventController_val(controller)
  );
  CAMLreturn(Val_option(widget, Val_GtkWidget));
}

CAMLprim value ml_gtk_event_controller_reset(value controller)
{
  CAMLparam1(controller);
  gtk_event_controller_reset(GtkEventController_val(controller));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_event_controller_get_current_event(value controller)
{
  CAMLparam1(controller);
  GdkEvent *event = gtk_event_controller_get_current_event(
    GtkEventController_val(controller)
  );
  CAMLreturn(Val_option(event, Val_GdkEvent));
}

/* ========== Keyboard Event Controller ========== */

CAMLprim value ml_gtk_event_controller_key_new(value unit)
{
  CAMLparam1(unit);
  GtkEventController *controller = gtk_event_controller_key_new();
  CAMLreturn(Val_GtkEventController(controller));
}

/* Key press signal callback wrapper */
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

  /* Call OCaml callback with keyval, keycode, state */
  value args[3] = {
    Val_int(keyval),
    Val_int(keycode),
    Val_ModifierType(state)  /* Need to implement */
  };

  result = caml_callbackN_exn(*ocaml_callback, 3, args);

  gboolean handled = FALSE;
  if (Is_exception_result(result)) {
    /* Log error */
    g_warning("Exception in key_pressed callback");
  } else {
    handled = Bool_val(result);
  }

  CAMLreturnT(gboolean, handled);
}

CAMLprim value ml_gtk_event_controller_key_connect_key_pressed(
  value controller,
  value callback)
{
  CAMLparam2(controller, callback);

  /* Register callback as global root */
  value *callback_root = ml_global_root_new(callback);

  gulong signal_id = g_signal_connect(
    GtkEventController_val(controller),
    "key-pressed",
    G_CALLBACK(key_pressed_callback_wrapper),
    callback_root
  );

  CAMLreturn(Val_long(signal_id));
}

/* ========== Motion Event Controller ========== */

CAMLprim value ml_gtk_event_controller_motion_new(value unit)
{
  CAMLparam1(unit);
  GtkEventController *controller = gtk_event_controller_motion_new();
  CAMLreturn(Val_GtkEventController(controller));
}

/* Motion callback wrapper */
static void motion_callback_wrapper(
  GtkEventControllerMotion *controller,
  gdouble x,
  gdouble y,
  gpointer user_data)
{
  CAMLparam0();

  value *ocaml_callback = (value*)user_data;

  /* Call OCaml callback with x, y coordinates */
  value args[2] = { caml_copy_double(x), caml_copy_double(y) };
  caml_callbackN_exn(*ocaml_callback, 2, args);

  CAMLreturn0;
}

CAMLprim value ml_gtk_event_controller_motion_connect_motion(
  value controller,
  value callback)
{
  CAMLparam2(controller, callback);

  value *callback_root = ml_global_root_new(callback);

  gulong signal_id = g_signal_connect(
    GtkEventController_val(controller),
    "motion",
    G_CALLBACK(motion_callback_wrapper),
    callback_root
  );

  CAMLreturn(Val_long(signal_id));
}

/* Enter callback (same signature as motion) */
CAMLprim value ml_gtk_event_controller_motion_connect_enter(
  value controller,
  value callback)
{
  CAMLparam2(controller, callback);

  value *callback_root = ml_global_root_new(callback);

  gulong signal_id = g_signal_connect(
    GtkEventController_val(controller),
    "enter",
    G_CALLBACK(motion_callback_wrapper),
    callback_root
  );

  CAMLreturn(Val_long(signal_id));
}

/* Leave callback (no parameters) */
static void leave_callback_wrapper(
  GtkEventControllerMotion *controller,
  gpointer user_data)
{
  CAMLparam0();

  value *ocaml_callback = (value*)user_data;
  caml_callback_exn(*ocaml_callback, Val_unit);

  CAMLreturn0;
}

CAMLprim value ml_gtk_event_controller_motion_connect_leave(
  value controller,
  value callback)
{
  CAMLparam2(controller, callback);

  value *callback_root = ml_global_root_new(callback);

  gulong signal_id = g_signal_connect(
    GtkEventController_val(controller),
    "leave",
    G_CALLBACK(leave_callback_wrapper),
    callback_root
  );

  CAMLreturn(Val_long(signal_id));
}

/* ========== Gesture Click ========== */

CAMLprim value ml_gtk_gesture_click_new(value unit)
{
  CAMLparam1(unit);
  GtkGesture *gesture = gtk_gesture_click_new();
  CAMLreturn(Val_GtkEventController((GtkEventController*)gesture));
}

/* Pressed callback wrapper */
static void gesture_pressed_callback_wrapper(
  GtkGestureClick *gesture,
  gint n_press,
  gdouble x,
  gdouble y,
  gpointer user_data)
{
  CAMLparam0();

  value *ocaml_callback = (value*)user_data;

  value args[3] = {
    Val_int(n_press),
    caml_copy_double(x),
    caml_copy_double(y)
  };

  caml_callbackN_exn(*ocaml_callback, 3, args);

  CAMLreturn0;
}

CAMLprim value ml_gtk_gesture_click_connect_pressed(
  value gesture,
  value callback)
{
  CAMLparam2(gesture, callback);

  value *callback_root = ml_global_root_new(callback);

  gulong signal_id = g_signal_connect(
    GtkEventController_val(gesture),
    "pressed",
    G_CALLBACK(gesture_pressed_callback_wrapper),
    callback_root
  );

  CAMLreturn(Val_long(signal_id));
}

/* Released callback (same signature as pressed) */
CAMLprim value ml_gtk_gesture_click_connect_released(
  value gesture,
  value callback)
{
  CAMLparam2(gesture, callback);

  value *callback_root = ml_global_root_new(callback);

  gulong signal_id = g_signal_connect(
    GtkEventController_val(gesture),
    "released",
    G_CALLBACK(gesture_pressed_callback_wrapper),
    callback_root
  );

  CAMLreturn(Val_long(signal_id));
}

CAMLprim value ml_gtk_gesture_click_set_button(value gesture, value button)
{
  CAMLparam2(gesture, button);

  gtk_gesture_single_set_button(
    GTK_GESTURE_SINGLE(GtkEventController_val(gesture)),
    Int_val(button)
  );

  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_gesture_click_get_button(value gesture)
{
  CAMLparam1(gesture);

  guint button = gtk_gesture_single_get_button(
    GTK_GESTURE_SINGLE(GtkEventController_val(gesture))
  );

  CAMLreturn(Val_int(button));
}

/* ========== Widget Controller Attachment ========== */

CAMLprim value ml_gtk_widget_add_controller(value widget, value controller)
{
  CAMLparam2(widget, controller);

  gtk_widget_add_controller(
    GtkWidget_val(widget),
    GtkEventController_val(controller)
  );

  /* Note: widget takes ownership of controller */
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_widget_remove_controller(value widget, value controller)
{
  CAMLparam2(widget, controller);

  gtk_widget_remove_controller(
    GtkWidget_val(widget),
    GtkEventController_val(controller)
  );

  CAMLreturn(Val_unit);
}
```

**Critical notes**:
- Event controller signals pass different parameters than GTK3 events
- Controllers are owned by widget after `add_controller`
- Must properly manage OCaml callback global roots
- Signal handlers return `gboolean` for key events (handled/not handled)

#### 3.3.6 Add Widget Controller Methods

**Location**: Update `lablgtk4/src/gtk.ml` and `ml_gtk.c`

Add to `Gtk.Widget` module:

```ocaml
module Widget : sig
  (* ... existing methods ... *)

  (** Add an event controller to this widget *)
  val add_controller : t -> EventController.t -> unit

  (** Remove an event controller from this widget *)
  val remove_controller : t -> EventController.t -> unit
end
```

#### 3.3.7 Testing

Create `tests/test_event_controller.ml`:

```ocaml
open Alcotest

let test_controller_creation () =
  let key_ctrl = EventControllerKey.new_ () in
  check bool "key controller created" true (key_ctrl <> Obj.magic 0);

  let motion_ctrl = EventControllerMotion.new_ () in
  check bool "motion controller created" true (motion_ctrl <> Obj.magic 0);

  let click = GestureClick.new_ () in
  check bool "click gesture created" true (click <> Obj.magic 0)

let test_button_selection () =
  let click = GestureClick.new_ () in
  GestureClick.set_button click 1;  (* Primary button *)
  check int "button set" 1 (GestureClick.get_button click)

let test_signal_connection () =
  let click = GestureClick.new_ () in
  let pressed_count = ref 0 in

  let _sig_id = GestureClick.connect_pressed click
    ~callback:(fun ~n_press ~x ~y ->
      pressed_count := !pressed_count + 1
    ) in

  (* Note: Can't test signal emission without widget - Phase 4 *)
  check int "signal connected" 0 !pressed_count

let () =
  run "Event Controller Tests" [
    "creation", [
      test_case "controllers" `Quick test_controller_creation
    ];
    "properties", [
      test_case "button_selection" `Quick test_button_selection
    ];
    "signals", [
      test_case "connection" `Quick test_signal_connection
    ];
  ]
```

**Success Criteria**:
- All event controller types can be created
- Signal connection APIs work
- Callback registration doesn't leak memory
- Controllers can be attached to widgets (test in Phase 4)
- Key, motion, and click events work correctly

**Estimated Time**: 2-3 weeks

---

## 3.4 High-Level Widget Integration (GObj) (1.5-2 weeks)

**Priority**: HIGH (OCaml widget wrapper API)

### Overview

The `GObj` module provides high-level OCaml wrappers around GTK widgets. It needs major redesign for GTK4:

**Key changes**:
- `event_ops` must be removed (no event signals)
- New `controller_ops` for event controller management
- `misc_ops` updated for visibility changes
- Focus handling updated

### Tasks

#### 3.4.1 Redesign GObj Module Structure

**Location**: `lablgtk4/src/gObj.ml`, `lablgtk4/src/gObj.mli`

**New structure**:

```ocaml
(** High-level GTK4 widget wrappers *)

(** Base widget class *)
class virtual widget_impl : Gtk.Widget.t -> object
  method private obj : Gtk.Widget.t

  (** Visibility *)
  method show : unit
  method hide : unit
  method visible : bool
  method set_visible : bool -> unit

  (** Size *)
  method width : int
  method height : int
  method set_size_request : width:int -> height:int -> unit
  method size_request : int * int

  (** Properties *)
  method sensitive : bool
  method set_sensitive : bool -> unit
  method name : string
  method set_name : string -> unit

  (** Focus *)
  method focusable : bool
  method set_focusable : bool -> unit
  method has_focus : bool
  method grab_focus : unit

  (** CSS *)
  method add_css_class : string -> unit
  method remove_css_class : string -> unit
  method has_css_class : string -> bool
  method css_classes : string list

  (** Hierarchy *)
  method parent : widget option
  method root : widget option

  (** Event controllers *)
  method add_controller : EventController.t -> unit
  method remove_controller : EventController.t -> unit

  (** Drawing *)
  method queue_draw : unit
  method queue_resize : unit

  (** GObject *)
  method as_gobject : GObject.obj
  method connect : 'a. ('a, unit) GObject.signal -> callback:'a -> GObject.signal_id
  method disconnect : GObject.signal_id -> unit
end

and widget = widget_impl

(** Helper class for event controller management *)
class controller_ops : Gtk.Widget.t -> object
  (** Add keyboard event handler *)
  method on_key_pressed :
    callback:(keyval:int -> keycode:int -> state:Gdk.ModifierType.t -> bool) ->
    GObject.signal_id

  (** Add mouse click handler *)
  method on_click :
    ?button:int ->
    callback:(n_press:int -> x:float -> y:float -> unit) ->
    GObject.signal_id

  (** Add mouse motion handler *)
  method on_motion :
    callback:(x:float -> y:float -> unit) ->
    GObject.signal_id

  (** Add mouse enter handler *)
  method on_enter :
    callback:(x:float -> y:float -> unit) ->
    GObject.signal_id

  (** Add mouse leave handler *)
  method on_leave :
    callback:(unit -> unit) ->
    GObject.signal_id

  (** Get all attached controllers *)
  method controllers : EventController.t list
end

(** Convenience accessors *)
class virtual ['a] widget_full : Gtk.Widget.t -> object
  inherit widget_impl

  method controllers : controller_ops
end
```

**Implementation highlights**:

```ocaml
class virtual widget_impl (obj : Gtk.Widget.t) = object (self)
  method private obj = obj

  (* Visibility *)
  method show = Gtk.Widget.show obj
  method hide = Gtk.Widget.hide obj
  method visible = Gtk.Widget.get_visible obj
  method set_visible v = Gtk.Widget.set_visible obj v

  (* Size *)
  method width = Gtk.Widget.get_width obj
  method height = Gtk.Widget.get_height obj
  method set_size_request ~width ~height =
    Gtk.Widget.set_size_request obj ~width ~height
  method size_request = Gtk.Widget.get_size_request obj

  (* Focus - NOTE: focusable not can_focus *)
  method focusable = Gtk.Widget.get_focusable obj
  method set_focusable f = Gtk.Widget.set_focusable obj f
  method has_focus = Gtk.Widget.has_focus obj
  method grab_focus = ignore (Gtk.Widget.grab_focus obj)

  (* CSS *)
  method add_css_class cls = Gtk.Widget.add_css_class obj cls
  method remove_css_class cls = Gtk.Widget.remove_css_class obj cls
  method has_css_class cls = Gtk.Widget.has_css_class obj cls
  method css_classes = Gtk.Widget.get_css_classes obj

  (* Controllers *)
  method add_controller ctrl = Gtk.Widget.add_controller obj ctrl
  method remove_controller ctrl = Gtk.Widget.remove_controller obj ctrl

  (* Drawing *)
  method queue_draw = Gtk.Widget.queue_draw obj
  method queue_resize = Gtk.Widget.queue_resize obj

  (* GObject integration *)
  method as_gobject = Obj.magic obj  (* Safe cast to GObject.obj *)

  method connect : 'a. ('a, unit) GObject.signal -> callback:'a -> GObject.signal_id =
    fun signal ~callback -> GObject.Signal.connect self#as_gobject signal callback

  method disconnect = GObject.Signal.disconnect self#as_gobject
end

(* Controller operations helper *)
class controller_ops (widget : Gtk.Widget.t) = object (self)
  val mutable controllers : EventController.t list = []

  method on_key_pressed ~callback =
    let ctrl = EventControllerKey.new_ () in
    let sig_id = EventControllerKey.connect_key_pressed ctrl ~callback in
    Gtk.Widget.add_controller widget ctrl;
    controllers <- ctrl :: controllers;
    sig_id

  method on_click ?(button = 0) ~callback =
    let gesture = GestureClick.new_ () in
    GestureClick.set_button gesture button;
    let sig_id = GestureClick.connect_pressed gesture ~callback in
    Gtk.Widget.add_controller widget gesture;
    controllers <- gesture :: controllers;
    sig_id

  method on_motion ~callback =
    let ctrl = EventControllerMotion.new_ () in
    let sig_id = EventControllerMotion.connect_motion ctrl ~callback in
    Gtk.Widget.add_controller widget ctrl;
    controllers <- ctrl :: controllers;
    sig_id

  method on_enter ~callback =
    let ctrl = EventControllerMotion.new_ () in
    let sig_id = EventControllerMotion.connect_enter ctrl ~callback in
    Gtk.Widget.add_controller widget ctrl;
    controllers <- ctrl :: controllers;
    sig_id

  method on_leave ~callback =
    let ctrl = EventControllerMotion.new_ () in
    let sig_id = EventControllerMotion.connect_leave ctrl ~callback in
    Gtk.Widget.add_controller widget ctrl;
    controllers <- ctrl :: controllers;
    sig_id

  method controllers = controllers
end

class virtual ['a] widget_full obj = object
  inherit widget_impl obj
  val controllers_ops = new controller_ops obj
  method controllers = controllers_ops
end
```

**Key design decisions**:
- `event_ops` completely removed (no event signals in GTK4)
- `controller_ops` provides convenient event handler attachment
- Each `on_*` method creates a controller, connects signal, and adds to widget
- Controllers are tracked for potential cleanup

#### 3.4.2 Remove Deprecated Event Operations

**GTK3 code to REMOVE**:

```ocaml
(* OLD GTK3 - DO NOT PORT *)
class event_ops : Gtk.Widget.t -> object
  method connect : 'a. ('a, unit) event_signals -> callback:'a -> GObject.signal_id
  method button_press : callback:(GdkEvent.Button.t -> bool) -> GObject.signal_id
  method button_release : callback:(GdkEvent.Button.t -> bool) -> GObject.signal_id
  method motion_notify : callback:(GdkEvent.Motion.t -> bool) -> GObject.signal_id
  method key_press : callback:(GdkEvent.Key.t -> bool) -> GObject.signal_id
  (* etc - ALL REMOVED IN GTK4 *)
end
```

#### 3.4.3 Testing

Create `tests/test_gobj.ml`:

```ocaml
open Alcotest

let test_widget_wrapper () =
  skip ()  (* Requires widget creation - Phase 4 *)

let test_controller_ops () =
  skip ()  (* Requires widget creation - Phase 4 *)

let () =
  run "GObj Tests" [
    "widget", [
      test_case "wrapper" `Quick test_widget_wrapper
    ];
    "controllers", [
      test_case "ops" `Quick test_controller_ops
    ];
  ]
```

**Success Criteria**:
- `GObj.widget` class compiles
- No references to `event_ops` remain
- `controller_ops` provides convenient event handling
- Focus uses `focusable` property
- CSS class methods work

**Estimated Time**: 1.5-2 weeks

---

## Phase 3 Deliverables

At the end of Phase 3, the following should be complete:

### Code

- [ ] Core `Gtk.Widget` module with GTK4 API
- [ ] `GtkSnapshot` rendering system with Cairo compatibility
- [ ] Event controller base classes implemented
  - [ ] `EventControllerKey` (keyboard)
  - [ ] `EventControllerMotion` (mouse motion)
  - [ ] `GestureClick` (button clicks)
- [ ] Graphene geometry types (minimal bindings)
- [ ] Gdk.RGBA color type
- [ ] `GObj.widget` class redesigned for GTK4
- [ ] `controller_ops` for convenient event handling
- [ ] All GTK3 event signal code removed

### Documentation

- [ ] Event controller migration guide (GTK3 signals → GTK4 controllers)
- [ ] Snapshot rendering guide (draw signal → snapshot vfunc)
- [ ] Focus handling changes (can_focus → focusable)
- [ ] CSS class API documentation

### Testing

- [ ] Basic widget tests (visibility, size, properties)
- [ ] Snapshot API tests (Cairo integration)
- [ ] Event controller creation tests
- [ ] Signal connection tests
- [ ] No memory leaks (valgrind clean)

### Validation

- [ ] Can create event controllers
- [ ] Can attach controllers to widgets
- [ ] Snapshot rendering compiles
- [ ] Cairo drawing still possible via `snapshot_append_cairo`
- [ ] All event signals removed from codebase
- [ ] Focus handling uses `focusable`

### Next Phase Prerequisites

- Widget infrastructure ready for containers (Phase 4)
- Event system ready for interactive widgets (Phase 5)
- Rendering system ready for custom widgets
- GObj wrapper pattern established

---

## Migration Guide: GTK3 → GTK4 Events

**For users migrating code from LablGTK3:**

### Old GTK3 Pattern (REMOVED)

```ocaml
let button = GButton.button ~label:"Click me" () in
ignore (button#event#connect#button_press ~callback:(fun ev ->
  Printf.printf "Button pressed at %f, %f\n"
    (GdkEvent.Button.x ev)
    (GdkEvent.Button.y ev);
  false  (* Propagate event *)
));
```

### New GTK4 Pattern

```ocaml
let button = GButton.button ~label:"Click me" () in
ignore (button#controllers#on_click ~callback:(fun ~n_press ~x ~y ->
  Printf.printf "Button clicked at %f, %f (count: %d)\n" x y n_press
));
```

### Direct Controller Usage

```ocaml
let button = GButton.button ~label:"Click me" () in

(* Create controller manually *)
let gesture = GestureClick.new_ () in
ignore (GestureClick.connect_pressed gesture
  ~callback:(fun ~n_press ~x ~y ->
    Printf.printf "Pressed at %f, %f\n" x y
  ));

(* Attach to widget *)
button#add_controller gesture;
```

### Keyboard Events

```ocaml
(* GTK3 - REMOVED *)
ignore (widget#event#connect#key_press ~callback:(fun ev ->
  let keyval = GdkEvent.Key.keyval ev in
  ...
));

(* GTK4 *)
ignore (widget#controllers#on_key_pressed
  ~callback:(fun ~keyval ~keycode ~state ->
    Printf.printf "Key: %d\n" keyval;
    false  (* Not handled *)
  ));
```

---

## Timeline Summary

| Task | Duration | Cumulative |
|------|----------|------------|
| 3.1 Core GtkWidget Migration | 1.5 weeks | 1.5 weeks |
| 3.2 GtkSnapshot Rendering | 1.5 weeks | 3 weeks |
| 3.3 Event Controller System | 2-3 weeks | 5-6 weeks |
| 3.4 GObj Integration | 1.5-2 weeks | 6.5-8 weeks |

**Total Phase 3 time**: 6.5-8 weeks

---

## Risk Assessment

### Technical Risks

**High Risk**:
- **Event controller paradigm shift**: Completely new model, no backward compatibility
- **Snapshot rendering**: Different mental model from Cairo draw
- **Memory management**: Controller ownership and callback cleanup

**Medium Risk**:
- **Graphene dependency**: Need geometry library bindings
- **Testing without widgets**: Can't fully test until Phase 4 containers

### Mitigation Strategies

1. **Early Examples**: Create simple examples as soon as basic functionality works
2. **Incremental Testing**: Test each controller type independently
3. **Memory Auditing**: Run valgrind on all tests
4. **Reference lablgtk3**: Check GTK3 patterns for inspiration
5. **GTK4 Documentation**: Follow official migration guide closely

---

## Next Steps After Phase 3

Once Phase 3 is complete:

1. **Phase 4: Container & Layout System** (4-6 weeks)
   - Redesign container APIs without `GtkContainer`/`GtkBin`
   - Implement `GtkBox`, `GtkGrid`, etc.

2. **Create Interactive Examples**
   - Simple window with button + click handler
   - Keyboard input demo
   - Custom drawing with snapshot

3. **Performance Testing**
   - Benchmark event throughput
   - Measure rendering performance
   - Compare with GTK3

---
