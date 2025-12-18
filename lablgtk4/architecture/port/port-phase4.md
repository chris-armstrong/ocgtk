# Phase 4: Container & Layout System (4-6 weeks)

**Objective**: Redesign container APIs without GtkContainer/GtkBin base classes and implement GTK4's new container-specific APIs.

**Dependencies**: Phase 3 complete (GtkWidget, event controllers, snapshot rendering working)

**Status**: 📋 **READY TO START**

---

## Overview

Phase 4 represents a fundamental architectural shift in how widgets are composed. GTK4 eliminated the abstract `GtkContainer` and `GtkBin` base classes in favor of container-specific APIs. This affects every container widget and requires a complete redesign of the high-level OCaml API.

### Critical Changes from GTK3

1. **Container System Elimination** (BREAKING)
   - `GtkContainer` abstract class removed
   - `GtkBin` abstract class removed
   - Generic `gtk_container_add()` / `gtk_container_remove()` eliminated
   - Each container has specialized methods:
     - `GtkBox`: `gtk_box_append()`, `gtk_box_prepend()`, `gtk_box_remove()`
     - `GtkGrid`: `gtk_grid_attach()`, `gtk_grid_remove()`
     - `GtkWindow`: `gtk_window_set_child()`, `gtk_window_get_child()`

2. **Removed Widgets**
   - `GtkButtonBox` → use `GtkBox` with CSS class
   - `GtkLayout` → use `GtkFixed`
   - `GtkAlignment` → use widget alignment properties

3. **Simplified Widget Hierarchy**
   - All single-child containers now implement `GtkBuildable` pattern
   - Layout managers are now explicit `GtkLayoutManager` objects

4. **New Features**
   - Constraint-based layout system (`GtkConstraintLayout`)
   - Explicit layout manager objects
   - Better separation of concerns

### Architecture Impact

This phase requires:
- **No GContainer or GBin base classes in OCaml**
- **Container-specific packing APIs**
- **Updated GPack module with new patterns**
- **Migration guide for user code**

---

## 4.1 GtkBox Migration (1.5 weeks)

**Priority**: CRITICAL (most commonly used container)

### Overview

GtkBox is the most widely used container for linear layouts. In GTK4, it has a completely new API:

**GTK3 (removed)**:
```c
gtk_box_pack_start(box, child, expand, fill, padding);
gtk_box_pack_end(box, child, expand, fill, padding);
```

**GTK4 (new)**:
```c
gtk_box_append(box, child);
gtk_box_prepend(box, child);
gtk_box_insert_child_after(box, child, sibling);
gtk_box_remove(box, child);

// Packing properties now per-child widget properties
gtk_widget_set_hexpand(child, TRUE);
gtk_widget_set_halign(child, GTK_ALIGN_FILL);
```

### Tasks

#### 4.1.1 Port gtk.ml/mli (GtkBox Types)

**Location**: `lablgtk4/src/gtk.ml`, `lablgtk4/src/gtk.mli`

**Add GtkBox module**:
```ocaml
module Box : sig
  type t = [`box] obj

  (** Create a new box *)
  val create : orientation:orientation -> spacing:int -> t

  (** Add child at the end *)
  val append : t -> widget -> unit

  (** Add child at the start *)
  val prepend : t -> widget -> unit

  (** Insert child after sibling (None = at start) *)
  val insert_child_after : t -> child:widget -> sibling:widget option -> unit

  (** Remove child from box *)
  val remove : t -> widget -> unit

  (** Reorder child to position *)
  val reorder_child_after : t -> child:widget -> sibling:widget option -> unit

  (** Get/set spacing between children *)
  val get_spacing : t -> int
  val set_spacing : t -> int -> unit

  (** Get/set homogeneous sizing *)
  val get_homogeneous : t -> bool
  val set_homogeneous : t -> bool -> unit

  (** Get/set baseline position *)
  val get_baseline_position : t -> baseline_position
  val set_baseline_position : t -> baseline_position -> unit
end
```

**Key changes from GTK3**:
- No `pack_start`/`pack_end` - use `append`/`prepend`
- No expand/fill/padding parameters - use widget properties
- Simpler, more consistent API

#### 4.1.2 Port ml_gtk.c (GtkBox Bindings)

**Location**: `lablgtk4/src/ml_gtk.c`

**Add GtkBox functions**:
```c
/* Box creation */
CAMLprim value ml_gtk_box_new(value orientation, value spacing)
{
  CAMLparam2(orientation, spacing);
  GtkWidget *box = gtk_box_new(
    GtkOrientation_val(orientation),
    Int_val(spacing)
  );
  CAMLreturn(Val_GtkWidget(box));
}

/* Append child */
CAMLprim value ml_gtk_box_append(value box, value child)
{
  CAMLparam2(box, child);
  gtk_box_append(
    GTK_BOX(GtkWidget_val(box)),
    GtkWidget_val(child)
  );
  CAMLreturn(Val_unit);
}

/* Prepend child */
CAMLprim value ml_gtk_box_prepend(value box, value child)
{
  CAMLparam2(box, child);
  gtk_box_prepend(
    GTK_BOX(GtkWidget_val(box)),
    GtkWidget_val(child)
  );
  CAMLreturn(Val_unit);
}

/* Insert after sibling */
CAMLprim value ml_gtk_box_insert_child_after(value box, value child, value sibling)
{
  CAMLparam3(box, child, sibling);

  GtkWidget *sibling_widget = NULL;
  if (Is_some(sibling)) {
    sibling_widget = GtkWidget_val(Some_val(sibling));
  }

  gtk_box_insert_child_after(
    GTK_BOX(GtkWidget_val(box)),
    GtkWidget_val(child),
    sibling_widget
  );

  CAMLreturn(Val_unit);
}

/* Remove child */
CAMLprim value ml_gtk_box_remove(value box, value child)
{
  CAMLparam2(box, child);
  gtk_box_remove(
    GTK_BOX(GtkWidget_val(box)),
    GtkWidget_val(child)
  );
  CAMLreturn(Val_unit);
}

/* Reorder child */
CAMLprim value ml_gtk_box_reorder_child_after(value box, value child, value sibling)
{
  CAMLparam3(box, child, sibling);

  GtkWidget *sibling_widget = NULL;
  if (Is_some(sibling)) {
    sibling_widget = GtkWidget_val(Some_val(sibling));
  }

  gtk_box_reorder_child_after(
    GTK_BOX(GtkWidget_val(box)),
    GtkWidget_val(child),
    sibling_widget
  );

  CAMLreturn(Val_unit);
}

/* Spacing */
CAMLprim value ml_gtk_box_get_spacing(value box)
{
  CAMLparam1(box);
  int spacing = gtk_box_get_spacing(GTK_BOX(GtkWidget_val(box)));
  CAMLreturn(Val_int(spacing));
}

CAMLprim value ml_gtk_box_set_spacing(value box, value spacing)
{
  CAMLparam2(box, spacing);
  gtk_box_set_spacing(GTK_BOX(GtkWidget_val(box)), Int_val(spacing));
  CAMLreturn(Val_unit);
}

/* Homogeneous */
CAMLprim value ml_gtk_box_get_homogeneous(value box)
{
  CAMLparam1(box);
  gboolean homogeneous = gtk_box_get_homogeneous(GTK_BOX(GtkWidget_val(box)));
  CAMLreturn(Val_bool(homogeneous));
}

CAMLprim value ml_gtk_box_set_homogeneous(value box, value homogeneous)
{
  CAMLparam2(box, homogeneous);
  gtk_box_set_homogeneous(GTK_BOX(GtkWidget_val(box)), Bool_val(homogeneous));
  CAMLreturn(Val_unit);
}
```

#### 4.1.3 Create GBox High-Level API

**Location**: `lablgtk4/src/gBox.ml`, `lablgtk4/src/gBox.mli` (NEW FILES)

**High-level wrapper**:
```ocaml
(** High-level GtkBox wrapper *)

class box_skel (obj : Gtk.Widget.t) = object
  inherit GObj.widget_impl obj

  method append (child : GObj.widget) =
    Gtk.Box.append obj child#as_widget

  method prepend (child : GObj.widget) =
    Gtk.Box.prepend obj child#as_widget

  method remove (child : GObj.widget) =
    Gtk.Box.remove obj child#as_widget

  method spacing = Gtk.Box.get_spacing obj
  method set_spacing spacing = Gtk.Box.set_spacing obj spacing

  method homogeneous = Gtk.Box.get_homogeneous obj
  method set_homogeneous h = Gtk.Box.set_homogeneous obj h
end

class box obj = object
  inherit box_skel (Gtk.Widget.coerce obj)
end

(** Create a horizontal box *)
let hbox ?(spacing=0) ?(homogeneous=false) () =
  let box = Gtk.Box.create ~orientation:`HORIZONTAL ~spacing in
  Gtk.Box.set_homogeneous box homogeneous;
  new box box

(** Create a vertical box *)
let vbox ?(spacing=0) ?(homogeneous=false) () =
  let box = Gtk.Box.create ~orientation:`VERTICAL ~spacing in
  Gtk.Box.set_homogeneous box homogeneous;
  new box box
```

**Migration helpers for GTK3 compatibility**:
```ocaml
(** Pack-like helper for easier migration from GTK3 *)
class box_pack obj = object
  inherit box obj

  method pack ?(expand=true) ?(fill=true) ?(padding=0) (child : GObj.widget) =
    (* In GTK4, these are widget properties, not packing parameters *)
    if expand then begin
      child#set_hexpand true;
      child#set_vexpand true;
    end;
    if fill then begin
      child#set_halign `FILL;
      child#set_valign `FILL;
    end;
    if padding > 0 then begin
      child#set_margin_start padding;
      child#set_margin_end padding;
    end;
    self#append child

  method pack_start ?expand ?fill ?padding child =
    self#pack ?expand ?fill ?padding child

  method pack_end ?expand ?fill ?padding (child : GObj.widget) =
    self#pack ?expand ?fill ?padding child;
    (* Move to end *)
    self#reorder_child_after child None
end

let hbox_pack ?spacing ?homogeneous () =
  new box_pack (hbox ?spacing ?homogeneous ())#as_widget

let vbox_pack ?spacing ?homogeneous () =
  new box_pack (vbox ?spacing ?homogeneous ())#as_widget
```

#### 4.1.4 Update Widget Packing Properties

**Location**: Update `lablgtk4/src/gtk.ml`

**Add packing-related widget methods**:
```ocaml
module Widget : sig
  (* ... existing methods ... *)

  (** Expansion properties (used for packing) *)
  val get_hexpand : t -> bool
  val set_hexpand : t -> bool -> unit
  val get_vexpand : t -> bool
  val set_vexpand : t -> bool -> unit

  (** Alignment properties *)
  val get_halign : t -> align
  val set_halign : t -> align -> unit
  val get_valign : t -> align
  val set_valign : t -> align -> unit

  (** Margin properties *)
  val get_margin_start : t -> int
  val set_margin_start : t -> int -> unit
  val get_margin_end : t -> int
  val set_margin_end : t -> int -> unit
  val get_margin_top : t -> int
  val set_margin_top : t -> int -> unit
  val get_margin_bottom : t -> int
  val set_margin_bottom : t -> int -> unit
end
```

**C bindings in ml_gtk.c**:
```c
/* Expansion */
CAMLprim value ml_gtk_widget_get_hexpand(value widget)
{
  CAMLparam1(widget);
  gboolean expand = gtk_widget_get_hexpand(GtkWidget_val(widget));
  CAMLreturn(Val_bool(expand));
}

CAMLprim value ml_gtk_widget_set_hexpand(value widget, value expand)
{
  CAMLparam2(widget, expand);
  gtk_widget_set_hexpand(GtkWidget_val(widget), Bool_val(expand));
  CAMLreturn(Val_unit);
}

/* Similar for vexpand, halign, valign, margins */
```

#### 4.1.5 Testing

**Location**: `tests/test_box.ml`

```ocaml
open Alcotest

let test_box_creation () =
  let box = Gtk.Box.create ~orientation:`HORIZONTAL ~spacing:5 in
  check int "spacing" 5 (Gtk.Box.get_spacing box);
  check bool "homogeneous" false (Gtk.Box.get_homogeneous box)

let test_box_packing () =
  let box = Gtk.Box.create ~orientation:`HORIZONTAL ~spacing:0 in
  let button1 = Gtk.Button.create ~label:"Button 1" in
  let button2 = Gtk.Button.create ~label:"Button 2" in

  Gtk.Box.append box button1;
  Gtk.Box.append box button2;

  (* Verify children were added - requires introspection *)
  (* This would require a gtk_box_get_children equivalent *)
  ()

let test_box_removal () =
  let box = Gtk.Box.create ~orientation:`VERTICAL ~spacing:0 in
  let button = Gtk.Button.create ~label:"Test" in

  Gtk.Box.append box button;
  Gtk.Box.remove box button;

  (* Verify button was removed *)
  ()

let test_high_level_box () =
  let box = GBox.hbox ~spacing:10 () in
  check int "spacing" 10 box#spacing;

  box#set_homogeneous true;
  check bool "homogeneous" true box#homogeneous

let () =
  run "GtkBox Tests" [
    "creation", [
      test_case "new_box" `Quick test_box_creation
    ];
    "packing", [
      test_case "append_remove" `Quick test_box_packing;
      test_case "removal" `Quick test_box_removal;
    ];
    "high_level", [
      test_case "gbox" `Quick test_high_level_box;
    ];
  ]
```

**Success Criteria**:
- Can create horizontal and vertical boxes
- Can append/prepend/remove children
- Spacing and homogeneous properties work
- High-level GBox wrapper provides convenient API
- Migration helpers work for GTK3-style code

**Estimated Time**: 1.5 weeks

---

## 4.2 Single-Child Containers (1 week)

**Priority**: HIGH (GtkWindow, GtkScrolledWindow, GtkFrame, etc.)

### Overview

GTK4 replaced the `GtkBin` base class with a simple pattern: single-child containers have `set_child()` and `get_child()` methods. This affects many common widgets.

### Tasks

#### 4.2.1 GtkWindow Migration

**Location**: `lablgtk4/src/gtk.ml`

**Add Window module**:
```ocaml
module Window : sig
  type t = [`window] obj

  (** Create a new window *)
  val create : unit -> t

  (** Set the child widget (replaces previous child if any) *)
  val set_child : t -> widget option -> unit

  (** Get the current child widget *)
  val get_child : t -> widget option

  (** Set window title *)
  val set_title : t -> string -> unit
  val get_title : t -> string

  (** Set default size *)
  val set_default_size : t -> width:int -> height:int -> unit
  val get_default_size : t -> int * int

  (** Resizability *)
  val set_resizable : t -> bool -> unit
  val get_resizable : t -> bool

  (** Modal *)
  val set_modal : t -> bool -> unit
  val get_modal : t -> bool

  (** Destroy window *)
  val destroy : t -> unit

  (** Present window to user *)
  val present : t -> unit

  (** Close window *)
  val close : t -> unit
end
```

**C bindings**:
```c
CAMLprim value ml_gtk_window_new(value unit)
{
  CAMLparam1(unit);
  GtkWidget *window = gtk_window_new();
  CAMLreturn(Val_GtkWidget(window));
}

CAMLprim value ml_gtk_window_set_child(value window, value child)
{
  CAMLparam2(window, child);

  GtkWidget *child_widget = NULL;
  if (Is_some(child)) {
    child_widget = GtkWidget_val(Some_val(child));
  }

  gtk_window_set_child(GTK_WINDOW(GtkWidget_val(window)), child_widget);
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_window_get_child(value window)
{
  CAMLparam1(window);
  GtkWidget *child = gtk_window_get_child(GTK_WINDOW(GtkWidget_val(window)));
  CAMLreturn(Val_option(child, Val_GtkWidget));
}

CAMLprim value ml_gtk_window_destroy(value window)
{
  CAMLparam1(window);
  gtk_window_destroy(GTK_WINDOW(GtkWidget_val(window)));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_window_present(value window)
{
  CAMLparam1(window);
  gtk_window_present(GTK_WINDOW(GtkWidget_val(window)));
  CAMLreturn(Val_unit);
}
```

#### 4.2.2 GtkScrolledWindow Migration

**Location**: `lablgtk4/src/gtk.ml`

**Add ScrolledWindow module**:
```ocaml
module ScrolledWindow : sig
  type t = [`scrolled_window] obj

  val create : unit -> t

  (** Set the child widget *)
  val set_child : t -> widget option -> unit
  val get_child : t -> widget option

  (** Scrollbar policies *)
  val set_policy : t -> hpolicy:policy_type -> vpolicy:policy_type -> unit
  val get_policy : t -> policy_type * policy_type

  (** Get scrollbars *)
  val get_hscrollbar : t -> widget
  val get_vscrollbar : t -> widget

  (** Scrolling *)
  val get_hadjustment : t -> adjustment
  val get_vadjustment : t -> adjustment
end
```

**Key change**: In GTK3, you could add any widget to a ScrolledWindow. In GTK4, the widget must implement the `GtkScrollable` interface, or it will automatically be wrapped in a `GtkViewport`.

#### 4.2.3 GtkFrame Migration

```ocaml
module Frame : sig
  type t = [`frame] obj

  val create : ?label:string -> unit -> t

  val set_child : t -> widget option -> unit
  val get_child : t -> widget option

  val set_label : t -> string option -> unit
  val get_label : t -> string option

  val set_label_align : t -> float -> unit
  val get_label_align : t -> float
end
```

#### 4.2.4 High-Level Wrappers

**Location**: `lablgtk4/src/gWindow.ml`, `lablgtk4/src/gWindow.mli` (NEW FILES)

```ocaml
class window obj = object (self)
  inherit GObj.widget_impl obj

  method set_child (child : GObj.widget option) =
    let w = Option.map (fun c -> c#as_widget) child in
    Gtk.Window.set_child obj w

  method child =
    Option.map (fun w -> new GObj.widget w) (Gtk.Window.get_child obj)

  method add (child : GObj.widget) =
    self#set_child (Some child)

  method title = Gtk.Window.get_title obj
  method set_title title = Gtk.Window.set_title obj title

  method set_default_size ~width ~height =
    Gtk.Window.set_default_size obj ~width ~height

  method resizable = Gtk.Window.get_resizable obj
  method set_resizable r = Gtk.Window.set_resizable obj r

  method destroy = Gtk.Window.destroy obj
  method present = Gtk.Window.present obj
  method close = Gtk.Window.close obj
end

let window ?(title="") ?(resizable=true) () =
  let w = Gtk.Window.create () in
  Gtk.Window.set_title w title;
  Gtk.Window.set_resizable w resizable;
  new window w
```

#### 4.2.5 Testing

```ocaml
let test_window () =
  let window = Gtk.Window.create () in
  Gtk.Window.set_title window "Test Window";
  check string "title" "Test Window" (Gtk.Window.get_title window);

  let box = Gtk.Box.create ~orientation:`VERTICAL ~spacing:0 in
  Gtk.Window.set_child window (Some box);

  match Gtk.Window.get_child window with
  | Some child -> () (* Success *)
  | None -> fail "child not set"
```

**Success Criteria**:
- Can create windows with children
- set_child/get_child work correctly
- ScrolledWindow, Frame work with new API
- High-level wrappers provide convenient interface

**Estimated Time**: 1 week

---

## 4.3 GtkGrid Migration (1 week)

**Priority**: HIGH (common layout widget)

### Overview

GtkGrid is used for 2D grid layouts. API changes are moderate - mostly renaming to remove "gtk_grid_" prefix ambiguities.

### Tasks

#### 4.3.1 Port GtkGrid

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module Grid : sig
  type t = [`grid] obj

  val create : unit -> t

  (** Attach child at position *)
  val attach : t -> child:widget -> column:int -> row:int ->
               width:int -> height:int -> unit

  (** Attach child next to sibling *)
  val attach_next_to : t -> child:widget -> sibling:widget option ->
                       side:position_type -> width:int -> height:int -> unit

  (** Remove child *)
  val remove : t -> widget -> unit

  (** Get child at position *)
  val get_child_at : t -> column:int -> row:int -> widget option

  (** Insert row/column *)
  val insert_row : t -> position:int -> unit
  val insert_column : t -> position:int -> unit
  val insert_next_to : t -> sibling:widget -> side:position_type -> unit

  (** Remove row/column *)
  val remove_row : t -> position:int -> unit
  val remove_column : t -> position:int -> unit

  (** Spacing *)
  val set_row_spacing : t -> int -> unit
  val get_row_spacing : t -> int
  val set_column_spacing : t -> int -> unit
  val get_column_spacing : t -> int

  (** Homogeneous sizing *)
  val set_row_homogeneous : t -> bool -> unit
  val get_row_homogeneous : t -> bool
  val set_column_homogeneous : t -> bool -> unit
  val get_column_homogeneous : t -> bool

  (** Baseline row *)
  val set_baseline_row : t -> int -> unit
  val get_baseline_row : t -> int
end
```

**C bindings** are straightforward wrappers around `gtk_grid_*` functions.

#### 4.3.2 High-Level Wrapper

**Location**: `lablgtk4/src/gGrid.ml`, `lablgtk4/src/gGrid.mli` (NEW FILES)

```ocaml
class grid obj = object
  inherit GObj.widget_impl obj

  method attach ~left ~top ~width ~height (child : GObj.widget) =
    Gtk.Grid.attach obj ~child:child#as_widget ~column:left ~row:top ~width ~height

  method remove (child : GObj.widget) =
    Gtk.Grid.remove obj child#as_widget

  method set_row_spacing spacing =
    Gtk.Grid.set_row_spacing obj spacing

  method set_column_spacing spacing =
    Gtk.Grid.set_column_spacing obj spacing

  (* ... other wrappers ... *)
end

let create ?(row_spacing=0) ?(column_spacing=0)
           ?(row_homogeneous=false) ?(column_homogeneous=false) () =
  let grid = Gtk.Grid.create () in
  Gtk.Grid.set_row_spacing grid row_spacing;
  Gtk.Grid.set_column_spacing grid column_spacing;
  Gtk.Grid.set_row_homogeneous grid row_homogeneous;
  Gtk.Grid.set_column_homogeneous grid column_homogeneous;
  new grid grid
```

#### 4.3.3 Testing

```ocaml
let test_grid () =
  let grid = Gtk.Grid.create () in
  let button = Gtk.Button.create ~label:"Test" in

  Gtk.Grid.attach grid ~child:button ~column:0 ~row:0 ~width:1 ~height:1;

  match Gtk.Grid.get_child_at grid ~column:0 ~row:0 with
  | Some _ -> () (* Success *)
  | None -> fail "child not found"
```

**Success Criteria**:
- Can create grids and attach children
- Row/column insertion works
- Spacing and homogeneous properties work

**Estimated Time**: 1 week

---

## 4.4 Additional Containers (1 week)

**Priority**: MEDIUM

### Overview

Port remaining commonly-used containers with GTK4 APIs.

### Containers to Port

#### 4.4.1 GtkFixed

**GTK4 changes**: Minimal - still has `gtk_fixed_put()` and `gtk_fixed_move()`

```ocaml
module Fixed : sig
  type t = [`fixed] obj

  val create : unit -> t
  val put : t -> widget -> x:float -> y:float -> unit
  val remove : t -> widget -> unit
  val move : t -> widget -> x:float -> y:float -> unit
end
```

#### 4.4.2 GtkPaned

**GTK4 changes**: Now uses `set_start_child()` and `set_end_child()` instead of `pack1`/`pack2`

```ocaml
module Paned : sig
  type t = [`paned] obj

  val create : orientation:orientation -> t

  val set_start_child : t -> widget option -> unit
  val get_start_child : t -> widget option

  val set_end_child : t -> widget option -> unit
  val get_end_child : t -> widget option

  val set_position : t -> int -> unit
  val get_position : t -> int

  val set_wide_handle : t -> bool -> unit
  val get_wide_handle : t -> bool
end
```

#### 4.4.3 GtkNotebook

**GTK4 changes**: Simplified tab management

```ocaml
module Notebook : sig
  type t = [`notebook] obj

  val create : unit -> t

  (** Append/prepend/insert pages *)
  val append_page : t -> child:widget -> ?tab_label:widget -> unit -> int
  val prepend_page : t -> child:widget -> ?tab_label:widget -> unit -> int
  val insert_page : t -> child:widget -> ?tab_label:widget -> position:int -> unit -> int

  (** Remove page *)
  val remove_page : t -> page:int -> unit
  val detach_tab : t -> child:widget -> unit

  (** Page navigation *)
  val get_current_page : t -> int
  val set_current_page : t -> int -> unit
  val next_page : t -> unit
  val prev_page : t -> unit

  (** Page queries *)
  val get_nth_page : t -> int -> widget option
  val get_n_pages : t -> int
  val page_num : t -> widget -> int

  (** Tab properties *)
  val set_show_tabs : t -> bool -> unit
  val get_show_tabs : t -> bool
  val set_show_border : t -> bool -> unit
  val get_show_border : t -> bool
end
```

#### 4.4.4 GtkStack

**GTK4 changes**: Minimal

```ocaml
module Stack : sig
  type t = [`stack] obj

  val create : unit -> t

  val add_named : t -> child:widget -> name:string -> unit
  val add_titled : t -> child:widget -> name:string -> title:string -> unit
  val remove : t -> widget -> unit

  val get_visible_child : t -> widget option
  val set_visible_child : t -> widget -> unit
  val set_visible_child_name : t -> string -> unit

  val set_transition_type : t -> stack_transition_type -> unit
  val get_transition_type : t -> stack_transition_type
end
```

**Success Criteria**:
- All containers compile and link
- Basic functionality works for each
- High-level wrappers provided

**Estimated Time**: 1 week

---

## 4.5 GPack Module Redesign (0.5 weeks)

**Priority**: MEDIUM (convenience module)

### Overview

The GPack module provided convenient constructors in LablGTK3. It needs redesign for GTK4's new APIs.

### Tasks

**Location**: `lablgtk4/src/gPack.ml`, `lablgtk4/src/gPack.mli` (NEW FILES)

**New design**:
```ocaml
(** Convenience functions for creating and packing widgets *)

(** Create horizontal box with packed widgets *)
val hbox_pack : ?spacing:int -> ?homogeneous:bool ->
                GObj.widget list -> GBox.box

(** Create vertical box with packed widgets *)
val vbox_pack : ?spacing:int -> ?homogeneous:bool ->
                GObj.widget list -> GBox.box

(** Create grid with positioned widgets *)
val grid_attach : ?row_spacing:int -> ?column_spacing:int ->
                  (GObj.widget * int * int * int * int) list -> GGrid.grid

(** Create window with child *)
val window : ?title:string -> ?width:int -> ?height:int ->
             GObj.widget -> GWindow.window

(** Create scrolled window with child *)
val scrolled : ?hpolicy:policy_type -> ?vpolicy:policy_type ->
               GObj.widget -> GScrolledWindow.scrolled_window
```

**Success Criteria**:
- Convenience functions simplify common patterns
- Compatible with GTK4 philosophy

**Estimated Time**: 0.5 weeks

---

## Phase 4 Deliverables

At the end of Phase 4, the following should be complete:

### Code

- [ ] GtkBox with append/prepend/remove API
- [ ] GtkWindow, GtkScrolledWindow, GtkFrame with set_child API
- [ ] GtkGrid with attach/remove API
- [ ] GtkFixed, GtkPaned, GtkNotebook, GtkStack
- [ ] Widget packing properties (hexpand, vexpand, margins, align)
- [ ] High-level wrappers (GBox, GWindow, GGrid, etc.)
- [ ] GPack convenience module
- [ ] All tests passing

### Documentation

- [ ] Container migration guide (GTK3 → GTK4)
- [ ] Packing API changes document
- [ ] Examples showing new container patterns
- [ ] API documentation for all container modules

### Testing

- [ ] test_box.ml (creation, packing, removal)
- [ ] test_window.ml (set_child, properties)
- [ ] test_grid.ml (attach, remove, spacing)
- [ ] test_containers.ml (all other containers)
- [ ] No memory leaks (valgrind clean)

### Validation

- [ ] Can create and pack boxes
- [ ] Can create windows with children
- [ ] Grid layouts work correctly
- [ ] All deprecated GTK3 APIs removed
- [ ] User code migration path clear

### Next Phase Prerequisites

- Container infrastructure ready for high-level widgets (Phase 5)
- Window system ready for dialogs and applications
- Layout system ready for complex UIs

---

## Migration Guide: GTK3 → GTK4 Containers

**For users migrating code from LablGTK3:**

### GtkBox Packing

**Old GTK3 Pattern (REMOVED)**:
```ocaml
let box = GPack.vbox () in
box#pack ~expand:true ~fill:true ~padding:5 button;
```

**New GTK4 Pattern - Option 1 (Direct)**:
```ocaml
let box = GBox.vbox () in
button#set_vexpand true;
button#set_valign `FILL;
button#set_margin_top 5;
button#set_margin_bottom 5;
box#append button;
```

**New GTK4 Pattern - Option 2 (Helper)**:
```ocaml
let box = GBox.vbox_pack () in
box#pack ~expand:true ~fill:true ~padding:5 button;
```

### GtkWindow Children

**Old GTK3 Pattern**:
```ocaml
let window = GWindow.window () in
window#add button;
```

**New GTK4 Pattern**:
```ocaml
let window = GWindow.window () in
window#set_child (Some button);
(* or *)
window#add button; (* wrapper for compatibility *)
```

### Container Hierarchy

**GTK3 (using GtkContainer)**:
```ocaml
let container = (button :> GObj.container) in
container#add child;
```

**GTK4 (no GtkContainer)**:
```ocaml
(* Each container has specific methods *)
match container with
| `box box -> Gtk.Box.append box child
| `grid grid -> Gtk.Grid.attach grid ~child ~column:0 ~row:0 ~width:1 ~height:1
| `window win -> Gtk.Window.set_child win (Some child)
```

---

## Timeline Summary

| Task | Duration | Cumulative |
|------|----------|------------|
| 4.1 GtkBox Migration | 1.5 weeks | 1.5 weeks |
| 4.2 Single-Child Containers | 1 week | 2.5 weeks |
| 4.3 GtkGrid Migration | 1 week | 3.5 weeks |
| 4.4 Additional Containers | 1 week | 4.5 weeks |
| 4.5 GPack Module Redesign | 0.5 weeks | 5 weeks |

**Total Phase 4 time**: 5 weeks (within 4-6 week estimate)

---

## Risk Assessment

### Technical Risks

**High Risk**:
- **Breaking API changes**: Every container has different API - users must update code
- **No generic container operations**: Loss of polymorphism from GtkContainer removal
- **Migration complexity**: Users need to learn new packing philosophy

**Medium Risk**:
- **Widget property management**: Expand/fill/padding now per-widget, not per-packing
- **Testing without applications**: Hard to test until Phase 5 widgets available

### Mitigation Strategies

1. **Compatibility Helpers**: Provide `box_pack` class with GTK3-like API
2. **Clear Documentation**: Comprehensive migration guide with examples
3. **Incremental Testing**: Test each container independently
4. **Code Generation**: Consider using gir_gen for repetitive container code
5. **User Feedback**: Early alpha release for testing

---

## Next Steps After Phase 4

Once Phase 4 is complete:

1. **Phase 5: High-Level Widgets** (8-12 weeks)
   - Port buttons, entries, text widgets
   - Implement new menu system (GtkPopoverMenu)
   - Port tree/list widgets

2. **Create Working Examples**
   - Multi-widget window with box layout
   - Grid-based form
   - Notebook with multiple pages
   - Scrolled text view

3. **Performance Testing**
   - Benchmark layout performance
   - Memory usage analysis
   - Compare with GTK3

4. **User Documentation**
   - Container cookbook
   - Layout patterns guide
   - Common migration pitfalls

---

## Code Generation Opportunity

**Note**: Many container methods are repetitive. Consider using the `gir_gen` tool (from Phase 3.0) to generate container bindings from GIR files:

```bash
dune exec -- gir_gen \
  --gir-file /usr/share/gir-1.0/Gtk-4.0.gir \
  --class GtkBox \
  --output lablgtk4/src/gtkBox_generated.ml
```

This could significantly reduce Phase 4 implementation time.

---
