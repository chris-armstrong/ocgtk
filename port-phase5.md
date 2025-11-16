# Phase 5: High-Level Widgets (8-12 weeks)

**Objective**: Port all essential widgets to GTK4, implementing new GTK4 widget replacements and redesigning the menu system for GMenuModel.

**Dependencies**: Phase 4 complete (containers and layout system working)

**Status**: 📋 **READY TO START**

---

## Overview

Phase 5 is the largest and most comprehensive phase of the migration, covering the majority of user-facing widgets. This phase transforms LablGTK from a widget infrastructure to a fully functional GUI toolkit.

### Critical Changes from GTK3

1. **Radio Buttons Redesigned** (BREAKING)
   - `GtkRadioButton` removed
   - Replaced with grouped `GtkCheckButton`
   - Different grouping mechanism

2. **Menu System Complete Redesign** (CRITICAL BREAKING)
   - `GtkMenu`, `GtkMenuBar`, `GtkMenuItem` removed
   - Replaced with `GtkPopoverMenu` and `GMenuModel`
   - Action-based menu system required
   - Complete API redesign needed

3. **Dialog Modal Pattern Changed** (BREAKING)
   - `gtk_dialog_run()` removed
   - Async callbacks required
   - No synchronous blocking dialogs

4. **Tree/List Widget Duality** (DECISION REQUIRED)
   - `GtkTreeView` still available but deprecated for new code
   - New `GtkListView`, `GtkColumnView`, `GtkGridView` recommended
   - Uses `GListModel` instead of `GtkTreeModel`
   - Decision: Port old API, new API, or both?

5. **Window Management Changes** (MEDIUM)
   - `GtkApplicationWindow` now preferred
   - Window properties and behavior changed
   - Title bar customization different

### Architecture Impact

This phase affects:
- **User-facing API**: Most breaking changes for end users
- **Migration complexity**: Largest compatibility challenge
- **Testing surface**: Requires extensive widget interaction testing
- **Documentation needs**: Comprehensive migration guide essential

---

## 5.1 Button Widgets (1.5 weeks)

**Priority**: HIGH (fundamental interactive widgets)

### Overview

Button widgets are among the most common UI elements. GTK4 made significant changes to the button hierarchy, most notably removing `GtkRadioButton`.

**Key changes**:
- `GtkRadioButton` → grouped `GtkCheckButton`
- `GtkToggleButton` still exists but simplified
- Button content now uses `set_child()` (can contain any widget)

### Tasks

#### 5.1.1 Port GtkButton

**Location**: `lablgtk4/src/gtk.ml`, `lablgtk4/src/ml_gtk.c`

**Add Button module**:
```ocaml
module Button : sig
  type t = [`button] obj

  (** Create a new button *)
  val create : unit -> t

  (** Create button with label *)
  val create_with_label : string -> t

  (** Create button with mnemonic *)
  val create_with_mnemonic : string -> t

  (** Set/get label (convenience for common case) *)
  val set_label : t -> string -> unit
  val get_label : t -> string

  (** Set/get whether label is used as mnemonic *)
  val set_use_underline : t -> bool -> unit
  val get_use_underline : t -> bool

  (** Set/get child widget (can be any widget, not just label) *)
  val set_child : t -> widget option -> unit
  val get_child : t -> widget option

  (** Set/get icon name *)
  val set_icon_name : t -> string -> unit
  val get_icon_name : t -> string

  (** Set whether button has frame *)
  val set_has_frame : t -> bool -> unit
  val get_has_frame : t -> bool

  (** Signals *)
  val connect_clicked : t -> callback:(unit -> unit) -> GObject.signal_id
end
```

**C bindings in ml_gtk.c**:
```c
/* Button creation */
CAMLprim value ml_gtk_button_new(value unit)
{
  CAMLparam1(unit);
  GtkWidget *button = gtk_button_new();
  CAMLreturn(Val_GtkWidget(button));
}

CAMLprim value ml_gtk_button_new_with_label(value label)
{
  CAMLparam1(label);
  GtkWidget *button = gtk_button_new_with_label(String_val(label));
  CAMLreturn(Val_GtkWidget(button));
}

CAMLprim value ml_gtk_button_new_with_mnemonic(value label)
{
  CAMLparam1(label);
  GtkWidget *button = gtk_button_new_with_mnemonic(String_val(label));
  CAMLreturn(Val_GtkWidget(button));
}

/* Label property */
CAMLprim value ml_gtk_button_set_label(value button, value label)
{
  CAMLparam2(button, label);
  gtk_button_set_label(GTK_BUTTON(GtkWidget_val(button)), String_val(label));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_get_label(value button)
{
  CAMLparam1(button);
  const char *label = gtk_button_get_label(GTK_BUTTON(GtkWidget_val(button)));
  CAMLreturn(caml_copy_string(label ? label : ""));
}

/* Child widget */
CAMLprim value ml_gtk_button_set_child(value button, value child)
{
  CAMLparam2(button, child);
  GtkWidget *child_widget = NULL;
  if (Is_some(child)) {
    child_widget = GtkWidget_val(Some_val(child));
  }
  gtk_button_set_child(GTK_BUTTON(GtkWidget_val(button)), child_widget);
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_get_child(value button)
{
  CAMLparam1(button);
  GtkWidget *child = gtk_button_get_child(GTK_BUTTON(GtkWidget_val(button)));
  CAMLreturn(Val_option(child, Val_GtkWidget));
}

/* Icon name */
CAMLprim value ml_gtk_button_set_icon_name(value button, value icon_name)
{
  CAMLparam2(button, icon_name);
  gtk_button_set_icon_name(
    GTK_BUTTON(GtkWidget_val(button)),
    String_val(icon_name)
  );
  CAMLreturn(Val_unit);
}

/* Has frame (new in GTK4) */
CAMLprim value ml_gtk_button_set_has_frame(value button, value has_frame)
{
  CAMLparam2(button, has_frame);
  gtk_button_set_has_frame(
    GTK_BUTTON(GtkWidget_val(button)),
    Bool_val(has_frame)
  );
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_get_has_frame(value button)
{
  CAMLparam1(button);
  gboolean has_frame = gtk_button_get_has_frame(
    GTK_BUTTON(GtkWidget_val(button))
  );
  CAMLreturn(Val_bool(has_frame));
}
```

#### 5.1.2 Port GtkCheckButton (with Radio Grouping)

**Location**: `lablgtk4/src/gtk.ml`

**Add CheckButton module**:
```ocaml
module CheckButton : sig
  type t = [`check_button] obj

  (** Create a new check button *)
  val create : unit -> t

  (** Create with label *)
  val create_with_label : string -> t

  (** Create with mnemonic *)
  val create_with_mnemonic : string -> t

  (** Set/get label *)
  val set_label : t -> string -> unit
  val get_label : t -> string

  (** Set/get active state *)
  val set_active : t -> bool -> unit
  val get_active : t -> bool

  (** Set/get inconsistent state (for tri-state) *)
  val set_inconsistent : t -> bool -> unit
  val get_inconsistent : t -> bool

  (** Radio button grouping (NEW in GTK4) *)
  val set_group : t -> t option -> unit
  val get_group : t -> t option

  (** Signals *)
  val connect_toggled : t -> callback:(unit -> unit) -> GObject.signal_id
end
```

**C bindings**:
```c
CAMLprim value ml_gtk_check_button_new(value unit)
{
  CAMLparam1(unit);
  GtkWidget *button = gtk_check_button_new();
  CAMLreturn(Val_GtkWidget(button));
}

CAMLprim value ml_gtk_check_button_new_with_label(value label)
{
  CAMLparam1(label);
  GtkWidget *button = gtk_check_button_new_with_label(String_val(label));
  CAMLreturn(Val_GtkWidget(button));
}

/* Active state */
CAMLprim value ml_gtk_check_button_set_active(value button, value active)
{
  CAMLparam2(button, active);
  gtk_check_button_set_active(
    GTK_CHECK_BUTTON(GtkWidget_val(button)),
    Bool_val(active)
  );
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_get_active(value button)
{
  CAMLparam1(button);
  gboolean active = gtk_check_button_get_active(
    GTK_CHECK_BUTTON(GtkWidget_val(button))
  );
  CAMLreturn(Val_bool(active));
}

/* Radio grouping - NEW in GTK4 */
CAMLprim value ml_gtk_check_button_set_group(value button, value group_member)
{
  CAMLparam2(button, group_member);

  GtkCheckButton *group = NULL;
  if (Is_some(group_member)) {
    group = GTK_CHECK_BUTTON(GtkWidget_val(Some_val(group_member)));
  }

  gtk_check_button_set_group(
    GTK_CHECK_BUTTON(GtkWidget_val(button)),
    group
  );

  CAMLreturn(Val_unit);
}
```

#### 5.1.3 Port GtkToggleButton

**Location**: `lablgtk4/src/gtk.ml`

**Add ToggleButton module**:
```ocaml
module ToggleButton : sig
  type t = [`toggle_button] obj

  val create : unit -> t
  val create_with_label : string -> t
  val create_with_mnemonic : string -> t

  val set_active : t -> bool -> unit
  val get_active : t -> bool

  val connect_toggled : t -> callback:(unit -> unit) -> GObject.signal_id
end
```

#### 5.1.4 Port GtkLinkButton, GtkMenuButton, GtkSwitch

**Location**: `lablgtk4/src/gtk.ml`

Similar patterns to above buttons.

#### 5.1.5 Create GButton High-Level API

**Location**: `lablgtk4/src/gButton.ml`, `lablgtk4/src/gButton.mli`

**High-level wrappers**:
```ocaml
(** High-level button wrappers *)

class button_skel obj = object
  inherit GObj.widget_impl obj

  method clicked () = ()  (* Placeholder for signal emission *)

  method set_label label = Gtk.Button.set_label obj label
  method label = Gtk.Button.get_label obj

  method set_has_frame has_frame = Gtk.Button.set_has_frame obj has_frame
  method has_frame = Gtk.Button.get_has_frame obj

  method connect_clicked ~callback =
    Gtk.Button.connect_clicked obj ~callback
end

class button obj = object
  inherit button_skel (Gtk.Widget.coerce obj)
end

let button ?label ?use_underline ?packing ?show () =
  let btn = match label with
    | Some l when use_underline = Some true ->
        Gtk.Button.create_with_mnemonic l
    | Some l ->
        Gtk.Button.create_with_label l
    | None ->
        Gtk.Button.create ()
  in
  let widget = new button btn in
  (* Apply packing if provided *)
  (match packing with
   | Some f -> f (widget :> GObj.widget)
   | None -> ());
  (* Show if requested *)
  if show = Some true then widget#show;
  widget

(** Check button with radio grouping support *)
class check_button_skel obj = object
  inherit GObj.widget_impl obj

  method set_active active = Gtk.CheckButton.set_active obj active
  method active = Gtk.CheckButton.get_active obj

  method set_label label = Gtk.CheckButton.set_label obj label
  method label = Gtk.CheckButton.get_label obj

  method set_inconsistent inc = Gtk.CheckButton.set_inconsistent obj inc
  method inconsistent = Gtk.CheckButton.get_inconsistent obj

  (* Radio grouping *)
  method set_group (group : check_button option) =
    let group_obj = match group with
      | Some g -> Some g#as_widget
      | None -> None
    in
    Gtk.CheckButton.set_group obj group_obj

  method connect_toggled ~callback =
    Gtk.CheckButton.connect_toggled obj ~callback
end

and check_button obj = object
  inherit check_button_skel (Gtk.Widget.coerce obj)
end

let check_button ?label ?active ?group ?packing ?show () =
  let btn = match label with
    | Some l -> Gtk.CheckButton.create_with_label l
    | None -> Gtk.CheckButton.create ()
  in
  let widget = new check_button btn in
  (match active with
   | Some a -> widget#set_active a
   | None -> ());
  (match group with
   | Some g -> widget#set_group (Some g)
   | None -> ());
  (match packing with
   | Some f -> f (widget :> GObj.widget)
   | None -> ());
  if show = Some true then widget#show;
  widget

(** Radio button using check button grouping *)
let radio_button ?label ?group ?packing ?show () =
  let btn = check_button ?label ?packing ?show () in
  (match group with
   | Some g -> btn#set_group (Some g)
   | None -> ());
  btn
```

#### 5.1.6 Testing

**Location**: `tests/test_button.ml`

```ocaml
open Alcotest

let test_button_creation () =
  let btn = Gtk.Button.create_with_label "Test" in
  check string "label" "Test" (Gtk.Button.get_label btn)

let test_check_button_toggle () =
  let cb = Gtk.CheckButton.create () in
  check bool "initial state" false (Gtk.CheckButton.get_active cb);
  Gtk.CheckButton.set_active cb true;
  check bool "toggled state" true (Gtk.CheckButton.get_active cb)

let test_radio_button_group () =
  let rb1 = Gtk.CheckButton.create_with_label "Option 1" in
  let rb2 = Gtk.CheckButton.create_with_label "Option 2" in
  let rb3 = Gtk.CheckButton.create_with_label "Option 3" in

  (* Group them together *)
  Gtk.CheckButton.set_group rb2 (Some rb1);
  Gtk.CheckButton.set_group rb3 (Some rb1);

  (* Set rb1 active *)
  Gtk.CheckButton.set_active rb1 true;
  check bool "rb1 active" true (Gtk.CheckButton.get_active rb1);

  (* Set rb2 active should deactivate rb1 *)
  Gtk.CheckButton.set_active rb2 true;
  check bool "rb2 active" true (Gtk.CheckButton.get_active rb2)
  (* Note: Can't easily test rb1 deactivation without signal handling *)

let test_high_level_button () =
  let btn = GButton.button ~label:"Click me" () in
  check string "label" "Click me" btn#label

let () =
  run "Button Tests" [
    "button", [
      test_case "creation" `Quick test_button_creation
    ];
    "check_button", [
      test_case "toggle" `Quick test_check_button_toggle;
      test_case "radio_group" `Quick test_radio_button_group;
    ];
    "high_level", [
      test_case "gbutton" `Quick test_high_level_button;
    ];
  ]
```

**Success Criteria**:
- All button types can be created
- Labels and icons work correctly
- Check button toggling works
- Radio button grouping works (mutual exclusion)
- Signals connect properly
- High-level API provides convenient interface

**Estimated Time**: 1.5 weeks

---

## 5.2 Entry Widgets (1 week)

**Priority**: HIGH (text input essential)

### Overview

Entry widgets have minimal changes from GTK3. The core `GtkEntry` API is largely unchanged, with some refinements.

**Key widgets**:
- `GtkEntry` - single-line text entry
- `GtkSearchEntry` - search-optimized entry
- `GtkPasswordEntry` - password entry (new in GTK4)
- `GtkSpinButton` - numeric entry with up/down buttons
- `GtkEditable` - interface for editable widgets

### Tasks

#### 5.2.1 Port GtkEntry

**Location**: `lablgtk4/src/gtk.ml`

**Add Entry module**:
```ocaml
module Entry : sig
  type t = [`entry] obj

  val create : unit -> t

  (** Text content *)
  val set_text : t -> string -> unit
  val get_text : t -> string

  (** Visibility (for passwords) *)
  val set_visibility : t -> bool -> unit
  val get_visibility : t -> bool

  (** Max length *)
  val set_max_length : t -> int -> unit
  val get_max_length : t -> int

  (** Placeholder text *)
  val set_placeholder_text : t -> string -> unit
  val get_placeholder_text : t -> string

  (** Alignment *)
  val set_alignment : t -> float -> unit
  val get_alignment : t -> float

  (** Progress (for progress indication in entry) *)
  val set_progress_fraction : t -> float -> unit
  val get_progress_fraction : t -> float

  (** Icons (primary/secondary) *)
  val set_icon_from_icon_name :
    t -> position:[`PRIMARY | `SECONDARY] -> icon_name:string option -> unit

  (** Signals *)
  val connect_activate : t -> callback:(unit -> unit) -> GObject.signal_id
  val connect_changed : t -> callback:(unit -> unit) -> GObject.signal_id
end
```

**C bindings** (straightforward wrappers):
```c
CAMLprim value ml_gtk_entry_new(value unit)
{
  CAMLparam1(unit);
  GtkWidget *entry = gtk_entry_new();
  CAMLreturn(Val_GtkWidget(entry));
}

CAMLprim value ml_gtk_entry_set_text(value entry, value text)
{
  CAMLparam2(entry, text);
  gtk_editable_set_text(
    GTK_EDITABLE(GtkWidget_val(entry)),
    String_val(text)
  );
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_text(value entry)
{
  CAMLparam1(entry);
  const char *text = gtk_editable_get_text(GTK_EDITABLE(GtkWidget_val(entry)));
  CAMLreturn(caml_copy_string(text ? text : ""));
}

CAMLprim value ml_gtk_entry_set_visibility(value entry, value visible)
{
  CAMLparam2(entry, visible);
  gtk_entry_set_visibility(
    GTK_ENTRY(GtkWidget_val(entry)),
    Bool_val(visible)
  );
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_max_length(value entry, value max)
{
  CAMLparam2(entry, max);
  gtk_entry_set_max_length(
    GTK_ENTRY(GtkWidget_val(entry)),
    Int_val(max)
  );
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_placeholder_text(value entry, value text)
{
  CAMLparam2(entry, text);
  gtk_entry_set_placeholder_text(
    GTK_ENTRY(GtkWidget_val(entry)),
    String_val(text)
  );
  CAMLreturn(Val_unit);
}
```

#### 5.2.2 Port GtkSpinButton

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module SpinButton : sig
  type t = [`spin_button] obj

  val create :
    ?adjustment:Gtk.Adjustment.t ->
    ?climb_rate:float ->
    ?digits:int ->
    unit -> t

  val set_value : t -> float -> unit
  val get_value : t -> float
  val get_value_as_int : t -> int

  val set_digits : t -> int -> unit
  val get_digits : t -> int

  val set_increments : t -> step:float -> page:float -> unit
  val set_range : t -> min:float -> max:float -> unit

  val set_wrap : t -> bool -> unit
  val get_wrap : t -> bool

  val set_numeric : t -> bool -> unit
  val get_numeric : t -> bool

  val connect_value_changed : t -> callback:(unit -> unit) -> GObject.signal_id
end
```

#### 5.2.3 Create GEdit High-Level API

**Location**: `lablgtk4/src/gEdit.ml`

```ocaml
class entry_skel obj = object
  inherit GObj.widget_impl obj

  method text = Gtk.Entry.get_text obj
  method set_text text = Gtk.Entry.set_text obj text

  method set_visibility v = Gtk.Entry.set_visibility obj v
  method visibility = Gtk.Entry.get_visibility obj

  method set_max_length len = Gtk.Entry.set_max_length obj len
  method max_length = Gtk.Entry.get_max_length obj

  method set_placeholder_text text = Gtk.Entry.set_placeholder_text obj text

  method connect_activate ~callback =
    Gtk.Entry.connect_activate obj ~callback

  method connect_changed ~callback =
    Gtk.Entry.connect_changed obj ~callback
end

class entry obj = object
  inherit entry_skel (Gtk.Widget.coerce obj)
end

let entry ?max_length ?visibility ?text ?placeholder ?packing ?show () =
  let e = Gtk.Entry.create () in
  let widget = new entry e in
  (match max_length with Some len -> widget#set_max_length len | None -> ());
  (match visibility with Some v -> widget#set_visibility v | None -> ());
  (match text with Some t -> widget#set_text t | None -> ());
  (match placeholder with Some p -> widget#set_placeholder_text p | None -> ());
  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());
  if show = Some true then widget#show;
  widget

class spin_button_skel obj = object
  inherit GObj.widget_impl obj

  method value = Gtk.SpinButton.get_value obj
  method set_value v = Gtk.SpinButton.set_value obj v
  method value_as_int = Gtk.SpinButton.get_value_as_int obj

  method set_digits d = Gtk.SpinButton.set_digits obj d
  method set_increments ~step ~page = Gtk.SpinButton.set_increments obj ~step ~page
  method set_range ~min ~max = Gtk.SpinButton.set_range obj ~min ~max

  method connect_value_changed ~callback =
    Gtk.SpinButton.connect_value_changed obj ~callback
end

class spin_button obj = object
  inherit spin_button_skel (Gtk.Widget.coerce obj)
end

let spin_button ?rate ?digits ?value ?lower ?upper ?step ?page ?packing ?show () =
  let sb = Gtk.SpinButton.create ?climb_rate:rate ?digits () in
  let widget = new spin_button sb in
  (match lower, upper with
   | Some l, Some u -> widget#set_range ~min:l ~max:u
   | _ -> ());
  (match step, page with
   | Some s, Some p -> widget#set_increments ~step:s ~page:p
   | _ -> ());
  (match value with Some v -> widget#set_value v | None -> ());
  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());
  if show = Some true then widget#show;
  widget
```

**Success Criteria**:
- Entry widgets accept text input
- Password visibility toggle works
- Spin button increments/decrements
- Placeholder text displays
- All signals work correctly

**Estimated Time**: 1 week

---

## 5.3 Text Widgets (1.5-2 weeks)

**Priority**: HIGH (complex multi-line text editing)

### Overview

The GTK4 text widget (`GtkTextView` / `GtkTextBuffer`) has refinements but no major API breaks. The core architecture remains similar to GTK3.

**Key components**:
- `GtkTextView` - multi-line text display/editing widget
- `GtkTextBuffer` - text storage and manipulation
- `GtkTextTag` - text formatting
- `GtkTextMark` - position markers in buffer

### Tasks

#### 5.3.1 Port GtkTextBuffer

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module TextBuffer : sig
  type t

  val create : ?tag_table:TextTagTable.t -> unit -> t

  (** Text manipulation *)
  val get_text :
    t ->
    ?start:TextIter.t ->
    ?stop:TextIter.t ->
    ?include_hidden_chars:bool ->
    unit -> string

  val set_text : t -> string -> unit
  val insert : t -> iter:TextIter.t -> string -> unit
  val insert_at_cursor : t -> string -> unit

  val delete : t -> start:TextIter.t -> stop:TextIter.t -> unit

  (** Iterators *)
  val get_start_iter : t -> TextIter.t
  val get_end_iter : t -> TextIter.t
  val get_iter_at_offset : t -> int -> TextIter.t
  val get_iter_at_line : t -> int -> TextIter.t

  (** Marks *)
  val create_mark :
    t ->
    ?name:string ->
    ?left_gravity:bool ->
    where:TextIter.t ->
    unit -> TextMark.t

  val get_insert : t -> TextMark.t
  val get_selection_bound : t -> TextMark.t

  (** Selection *)
  val get_selection_bounds : t -> (TextIter.t * TextIter.t) option
  val select_range : t -> ins:TextIter.t -> bound:TextIter.t -> unit

  (** Modification state *)
  val get_modified : t -> bool
  val set_modified : t -> bool -> unit

  (** Signals *)
  val connect_changed : t -> callback:(unit -> unit) -> GObject.signal_id
  val connect_insert_text :
    t -> callback:(TextIter.t -> string -> unit) -> GObject.signal_id
  val connect_delete_range :
    t -> callback:(TextIter.t -> TextIter.t -> unit) -> GObject.signal_id
end
```

#### 5.3.2 Port GtkTextView

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module TextView : sig
  type t = [`text_view] obj

  val create : ?buffer:TextBuffer.t -> unit -> t

  (** Buffer *)
  val get_buffer : t -> TextBuffer.t
  val set_buffer : t -> TextBuffer.t -> unit

  (** Editing *)
  val get_editable : t -> bool
  val set_editable : t -> bool -> unit

  (** Wrapping *)
  val get_wrap_mode : t -> wrap_mode
  val set_wrap_mode : t -> wrap_mode -> unit

  (** Scrolling *)
  val scroll_to_mark :
    t ->
    mark:TextMark.t ->
    ?within_margin:float ->
    ?use_align:bool ->
    ?xalign:float ->
    ?yalign:float ->
    unit -> unit

  val scroll_to_iter :
    t ->
    iter:TextIter.t ->
    ?within_margin:float ->
    ?use_align:bool ->
    ?xalign:float ->
    ?yalign:float ->
    unit -> bool

  (** Cursor *)
  val get_cursor_visible : t -> bool
  val set_cursor_visible : t -> bool -> unit

  (** Monospace *)
  val get_monospace : t -> bool
  val set_monospace : t -> bool -> unit

  (** Indentation and spacing *)
  val set_left_margin : t -> int -> unit
  val get_left_margin : t -> int
  val set_right_margin : t -> int -> unit
  val get_right_margin : t -> int
  val set_pixels_above_lines : t -> int -> unit
  val set_pixels_below_lines : t -> int -> unit
end
```

#### 5.3.3 Port GtkTextTag and GtkTextTagTable

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module TextTag : sig
  type t

  val create : ?name:string -> unit -> t

  (** Properties can be set via GObject property system *)
  val set_property : t -> string -> 'a -> unit
end

module TextTagTable : sig
  type t

  val create : unit -> t
  val add : t -> TextTag.t -> unit
  val remove : t -> TextTag.t -> unit
  val lookup : t -> string -> TextTag.t option
end
```

#### 5.3.4 Create GText High-Level API

**Location**: `lablgtk4/src/gText.ml`

```ocaml
class buffer_skel (buffer : Gtk.TextBuffer.t) = object (self)
  method buffer = buffer

  method text = Gtk.TextBuffer.get_text buffer ()
  method set_text text = Gtk.TextBuffer.set_text buffer text

  method insert ~iter text = Gtk.TextBuffer.insert buffer ~iter text
  method insert_at_cursor text = Gtk.TextBuffer.insert_at_cursor buffer text

  method get_start_iter = Gtk.TextBuffer.get_start_iter buffer
  method get_end_iter = Gtk.TextBuffer.get_end_iter buffer

  method get_iter_at_offset offset =
    Gtk.TextBuffer.get_iter_at_offset buffer offset

  method get_selection_bounds = Gtk.TextBuffer.get_selection_bounds buffer

  method modified = Gtk.TextBuffer.get_modified buffer
  method set_modified m = Gtk.TextBuffer.set_modified buffer m

  method connect_changed = Gtk.TextBuffer.connect_changed buffer
end

class buffer ?text ?tag_table () =
  let buf = Gtk.TextBuffer.create ?tag_table () in
  object
    inherit buffer_skel buf
    initializer match text with
      | Some t -> self#set_text t
      | None -> ()
  end

class view_skel obj = object
  inherit GObj.widget_impl obj

  method buffer = Gtk.TextView.get_buffer obj
  method set_buffer buf = Gtk.TextView.set_buffer obj buf

  method editable = Gtk.TextView.get_editable obj
  method set_editable e = Gtk.TextView.set_editable obj e

  method wrap_mode = Gtk.TextView.get_wrap_mode obj
  method set_wrap_mode m = Gtk.TextView.set_wrap_mode obj m

  method cursor_visible = Gtk.TextView.get_cursor_visible obj
  method set_cursor_visible v = Gtk.TextView.set_cursor_visible obj v

  method monospace = Gtk.TextView.get_monospace obj
  method set_monospace m = Gtk.TextView.set_monospace obj m

  method scroll_to_mark
      ~mark ?within_margin ?use_align ?xalign ?yalign () =
    Gtk.TextView.scroll_to_mark obj ~mark
      ?within_margin ?use_align ?xalign ?yalign ()

  method scroll_to_iter
      ~iter ?within_margin ?use_align ?xalign ?yalign () =
    Gtk.TextView.scroll_to_iter obj ~iter
      ?within_margin ?use_align ?xalign ?yalign ()
end

class view obj = object
  inherit view_skel (Gtk.Widget.coerce obj)
end

let view ?buffer ?editable ?wrap_mode ?packing ?show () =
  let v = Gtk.TextView.create ?buffer () in
  let widget = new view v in
  (match editable with Some e -> widget#set_editable e | None -> ());
  (match wrap_mode with Some w -> widget#set_wrap_mode w | None -> ());
  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());
  if show = Some true then widget#show;
  widget
```

**Success Criteria**:
- Can create text buffer and view
- Text insertion/deletion works
- Iterators and marks work correctly
- Scrolling to positions works
- Text tags for formatting work
- Signals fire correctly

**Estimated Time**: 1.5-2 weeks

---

## 5.4 Range Widgets (0.5-1 week)

**Priority**: MEDIUM (sliders and progress bars)

### Overview

Range widgets (scales, scrollbars, progress bars) have minimal changes from GTK3.

**Key widgets**:
- `GtkScale` - slider widget
- `GtkScrollbar` - scrollbar (rarely used directly)
- `GtkProgressBar` - progress indicator
- `GtkLevelBar` - level indicator

### Tasks

#### 5.4.1 Port GtkScale

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module Scale : sig
  type t = [`scale] obj

  val create :
    orientation:orientation ->
    ?adjustment:Adjustment.t ->
    unit -> t

  val create_with_range :
    orientation:orientation ->
    min:float ->
    max:float ->
    step:float ->
    unit -> t

  val set_digits : t -> int -> unit
  val get_digits : t -> int

  val set_draw_value : t -> bool -> unit
  val get_draw_value : t -> bool

  val set_value_pos : t -> position_type -> unit
  val get_value_pos : t -> position_type

  val set_has_origin : t -> bool -> unit
  val get_has_origin : t -> bool

  (** Add mark at value *)
  val add_mark : t -> value:float -> position:position_type -> markup:string option -> unit
  val clear_marks : t -> unit

  (** Range properties (inherited from GtkRange) *)
  val set_value : t -> float -> unit
  val get_value : t -> float

  val set_increments : t -> step:float -> page:float -> unit
  val set_range : t -> min:float -> max:float -> unit

  val connect_value_changed : t -> callback:(unit -> unit) -> GObject.signal_id
end
```

#### 5.4.2 Port GtkProgressBar

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module ProgressBar : sig
  type t = [`progress_bar] obj

  val create : unit -> t

  val set_fraction : t -> float -> unit
  val get_fraction : t -> float

  val set_text : t -> string option -> unit
  val get_text : t -> string option

  val set_show_text : t -> bool -> unit
  val get_show_text : t -> bool

  val set_inverted : t -> bool -> unit
  val get_inverted : t -> bool

  val pulse : t -> unit
end
```

#### 5.4.3 Create GRange High-Level API

**Location**: `lablgtk4/src/gRange.ml`

Simple wrappers following established patterns.

**Success Criteria**:
- Scales display and respond to input
- Progress bars show progress correctly
- Value changed signals work
- Marks on scales display correctly

**Estimated Time**: 0.5-1 week

---

## 5.5 Tree/List Widgets (2-3 weeks)

**Priority**: HIGH (complex but essential)

### Overview

This is a **critical decision point**. GTK4 offers two approaches:

1. **Old API**: Port `GtkTreeView` / `GtkTreeModel` (still available, deprecated for new code)
2. **New API**: Implement `GtkListView` / `GListModel` (recommended for new code)
3. **Both**: Support both APIs (most work but best compatibility)

**Recommendation**: **Support both**, starting with old API for compatibility, then new API for future-proofing.

### Phase 5.5a: Classic TreeView API (1.5-2 weeks)

#### 5.5a.1 Port GtkTreeModel and GtkListStore

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module TreeModel : sig
  type t
  type iter

  val get_iter : t -> path:TreePath.t -> iter option
  val get_path : t -> iter -> TreePath.t
  val get_value : t -> iter -> column:int -> GObject.value

  val iter_next : t -> iter -> bool
  val iter_children : t -> parent:iter option -> iter option
  val iter_has_child : t -> iter -> bool
  val iter_n_children : t -> iter option -> int

  val connect_row_changed :
    t -> callback:(TreePath.t -> iter -> unit) -> GObject.signal_id
  val connect_row_inserted :
    t -> callback:(TreePath.t -> iter -> unit) -> GObject.signal_id
  val connect_row_deleted :
    t -> callback:(TreePath.t -> unit) -> GObject.signal_id
end

module ListStore : sig
  type t = TreeModel.t

  val create : column_types:GObject.gtype list -> t

  val append : t -> TreeModel.iter
  val prepend : t -> TreeModel.iter
  val insert : t -> position:int -> TreeModel.iter
  val remove : t -> TreeModel.iter -> bool

  val set_value : t -> iter:TreeModel.iter -> column:int -> value:GObject.value -> unit
  val clear : t -> unit
end

module TreeStore : sig
  type t = TreeModel.t

  val create : column_types:GObject.gtype list -> t

  val append : t -> parent:TreeModel.iter option -> TreeModel.iter
  val prepend : t -> parent:TreeModel.iter option -> TreeModel.iter
  val insert : t -> parent:TreeModel.iter option -> position:int -> TreeModel.iter
  val remove : t -> TreeModel.iter -> bool

  val set_value : t -> iter:TreeModel.iter -> column:int -> value:GObject.value -> unit
  val clear : t -> unit
end
```

#### 5.5a.2 Port GtkTreeView

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module TreeView : sig
  type t = [`tree_view] obj

  val create : ?model:TreeModel.t -> unit -> t

  val set_model : t -> TreeModel.t option -> unit
  val get_model : t -> TreeModel.t option

  val append_column : t -> TreeViewColumn.t -> int
  val remove_column : t -> TreeViewColumn.t -> unit
  val insert_column : t -> TreeViewColumn.t -> position:int -> int

  val get_selection : t -> TreeSelection.t

  val set_headers_visible : t -> bool -> unit
  val get_headers_visible : t -> bool

  val set_headers_clickable : t -> bool -> unit

  val expand_all : t -> unit
  val collapse_all : t -> unit
  val expand_row : t -> path:TreePath.t -> bool -> unit

  val connect_row_activated :
    t -> callback:(TreePath.t -> TreeViewColumn.t -> unit) -> GObject.signal_id
end
```

#### 5.5a.3 Port GtkTreeViewColumn and GtkCellRenderer

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module TreeViewColumn : sig
  type t

  val create : unit -> t
  val set_title : t -> string -> unit
  val get_title : t -> string

  val pack_start : t -> CellRenderer.t -> expand:bool -> unit
  val pack_end : t -> CellRenderer.t -> expand:bool -> unit

  val add_attribute : t -> CellRenderer.t -> attribute:string -> column:int -> unit
  val set_cell_data_func :
    t -> CellRenderer.t ->
    callback:(TreeModel.t -> TreeModel.iter -> unit) option -> unit

  val set_sort_column_id : t -> int -> unit
  val get_sort_column_id : t -> int

  val set_resizable : t -> bool -> unit
  val get_resizable : t -> bool
end

module CellRenderer : sig
  type t

  val set_property : t -> string -> GObject.value -> unit
  val get_property : t -> string -> GObject.value
end

module CellRendererText : sig
  type t = CellRenderer.t

  val create : unit -> t

  val connect_edited :
    t -> callback:(path:string -> new_text:string -> unit) -> GObject.signal_id
end

module CellRendererToggle : sig
  type t = CellRenderer.t

  val create : unit -> t

  val connect_toggled :
    t -> callback:(path:string -> unit) -> GObject.signal_id
end

module CellRendererPixbuf : sig
  type t = CellRenderer.t

  val create : unit -> t
end
```

#### 5.5a.4 Create GTree High-Level API

**Location**: `lablgtk4/src/gTree.ml`

```ocaml
(** Column type specification *)
type 'a column = {
  name: string;
  typ: GObject.gtype;
  index: int;
}

class ['a] list_store ~columns = object
  val store = Gtk.ListStore.create
      ~column_types:(List.map (fun c -> c.typ) columns)

  method store = store
  method columns = columns

  method append = Gtk.ListStore.append store
  method prepend = Gtk.ListStore.prepend store
  method insert ~position = Gtk.ListStore.insert store ~position
  method remove iter = Gtk.ListStore.remove store iter
  method clear = Gtk.ListStore.clear store

  method set ~iter ~column value =
    Gtk.ListStore.set_value store ~iter
      ~column:column.index ~value

  method get ~iter ~column =
    Gtk.TreeModel.get_value store ~iter
      ~column:column.index
end

class view_skel obj = object
  inherit GObj.widget_impl obj

  method model = Gtk.TreeView.get_model obj
  method set_model model = Gtk.TreeView.set_model obj model

  method append_column col = Gtk.TreeView.append_column obj col
  method remove_column col = Gtk.TreeView.remove_column obj col

  method selection = Gtk.TreeView.get_selection obj

  method headers_visible = Gtk.TreeView.get_headers_visible obj
  method set_headers_visible v = Gtk.TreeView.set_headers_visible obj v

  method expand_all = Gtk.TreeView.expand_all obj
  method collapse_all = Gtk.TreeView.collapse_all obj

  method connect_row_activated ~callback =
    Gtk.TreeView.connect_row_activated obj ~callback
end

class view obj = object
  inherit view_skel (Gtk.Widget.coerce obj)
end

let view ?model ?packing ?show () =
  let v = Gtk.TreeView.create ?model () in
  let widget = new view v in
  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());
  if show = Some true then widget#show;
  widget

(** Column creation helpers *)
module Column = struct
  let create ~title ~renderer () =
    let col = Gtk.TreeViewColumn.create () in
    Gtk.TreeViewColumn.set_title col title;
    Gtk.TreeViewColumn.pack_start col renderer ~expand:true;
    col
end
```

### Phase 5.5b: New ListView API (1-1.5 weeks) - OPTIONAL for Phase 5

**Note**: Can be deferred to Phase 6 or 7 if time is limited.

#### 5.5b.1 Port GListModel

Basic `GListModel` interface support for future compatibility.

```ocaml
module ListModel : sig
  type t

  val get_n_items : t -> int
  val get_item : t -> position:int -> GObject.obj option

  val connect_items_changed :
    t -> callback:(position:int -> removed:int -> added:int -> unit) ->
    GObject.signal_id
end
```

**Success Criteria**:
- TreeView displays data correctly
- Cell renderers work (text, toggle, pixbuf)
- Row selection works
- Sorting and filtering work
- Tree expansion/collapse works
- High-level API provides convenient interface

**Estimated Time**: 2-3 weeks (old API only), +1-1.5 weeks (with new API)

---

## 5.6 Misc Widgets (1 week)

**Priority**: MEDIUM (various utility widgets)

### Overview

Miscellaneous widgets include labels, images, separators, spinners, and status bars. Most have minimal changes from GTK3.

### Tasks

#### 5.6.1 Port GtkLabel

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module Label : sig
  type t = [`label] obj

  val create : ?text:string -> ?mnemonic:string -> unit -> t

  val set_text : t -> string -> unit
  val get_text : t -> string

  val set_markup : t -> string -> unit

  val set_use_markup : t -> bool -> unit
  val get_use_markup : t -> bool

  val set_use_underline : t -> bool -> unit
  val get_use_underline : t -> bool

  val set_justify : t -> justification -> unit
  val get_justify : t -> justification

  val set_ellipsize : t -> Pango.ellipsize_mode -> unit
  val get_ellipsize : t -> Pango.ellipsize_mode

  val set_width_chars : t -> int -> unit
  val get_width_chars : t -> int

  val set_max_width_chars : t -> int -> unit
  val get_max_width_chars : t -> int

  val set_wrap : t -> bool -> unit
  val get_wrap : t -> bool

  val set_wrap_mode : t -> Pango.wrap_mode -> unit
  val get_wrap_mode : t -> Pango.wrap_mode

  val set_selectable : t -> bool -> unit
  val get_selectable : t -> bool
end
```

#### 5.6.2 Port GtkImage

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module Image : sig
  type t = [`image] obj

  val create : unit -> t
  val create_from_file : string -> t
  val create_from_icon_name : string -> t
  val create_from_pixbuf : GdkPixbuf.t -> t

  val set_from_file : t -> string -> unit
  val set_from_icon_name : t -> string -> unit
  val set_from_pixbuf : t -> GdkPixbuf.t -> unit

  val clear : t -> unit

  val set_pixel_size : t -> int -> unit
  val get_pixel_size : t -> int
end
```

#### 5.6.3 Port GtkSeparator, GtkSpinner, GtkStatusbar

Simple widgets with straightforward APIs.

#### 5.6.4 Create GMisc High-Level API

**Location**: `lablgtk4/src/gMisc.ml`

```ocaml
class label_skel obj = object
  inherit GObj.widget_impl obj

  method text = Gtk.Label.get_text obj
  method set_text text = Gtk.Label.set_text obj text

  method set_markup markup = Gtk.Label.set_markup obj markup

  method justify = Gtk.Label.get_justify obj
  method set_justify j = Gtk.Label.set_justify obj j

  method set_ellipsize mode = Gtk.Label.set_ellipsize obj mode

  method set_wrap wrap = Gtk.Label.set_wrap obj wrap
  method set_wrap_mode mode = Gtk.Label.set_wrap_mode obj mode

  method selectable = Gtk.Label.get_selectable obj
  method set_selectable s = Gtk.Label.set_selectable obj s
end

class label obj = object
  inherit label_skel (Gtk.Widget.coerce obj)
end

let label ?text ?markup ?justify ?packing ?show () =
  let lbl = Gtk.Label.create ?text () in
  let widget = new label lbl in
  (match markup with Some m -> widget#set_markup m | None -> ());
  (match justify with Some j -> widget#set_justify j | None -> ());
  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());
  if show = Some true then widget#show;
  widget

class image_skel obj = object
  inherit GObj.widget_impl obj

  method set_from_file file = Gtk.Image.set_from_file obj file
  method set_from_icon_name name = Gtk.Image.set_from_icon_name obj name
  method set_from_pixbuf pixbuf = Gtk.Image.set_from_pixbuf obj pixbuf
  method clear = Gtk.Image.clear obj
end

class image obj = object
  inherit image_skel (Gtk.Widget.coerce obj)
end

let image ?file ?icon_name ?pixbuf ?packing ?show () =
  let img = Gtk.Image.create () in
  let widget = new image img in
  (match file with Some f -> widget#set_from_file f | None -> ());
  (match icon_name with Some n -> widget#set_from_icon_name n | None -> ());
  (match pixbuf with Some p -> widget#set_from_pixbuf p | None -> ());
  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());
  if show = Some true then widget#show;
  widget
```

**Success Criteria**:
- Labels display text correctly
- Markup and formatting work
- Images load from files and icon names
- Separators display correctly
- Spinner animates
- Status bars show messages

**Estimated Time**: 1 week

---

## 5.7 Window Widgets (1 week)

**Priority**: HIGH (top-level windows and dialogs)

### Overview

Window widgets form the top-level containers for applications. GTK4 made significant changes to dialogs and window management.

**Key changes**:
- `gtk_dialog_run()` removed - must use async/callback pattern
- `GtkApplicationWindow` now strongly preferred
- Window properties and behavior changed

### Tasks

#### 5.7.1 Port GtkWindow

**Location**: Already started in Phase 4, complete remaining methods

#### 5.7.2 Port GtkApplicationWindow

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module ApplicationWindow : sig
  type t = [`application_window] obj

  val create : application:Application.t -> t

  (** Show menubar (from GMenuModel) *)
  val set_show_menubar : t -> bool -> unit
  val get_show_menubar : t -> bool

  (* Inherits all GtkWindow methods *)
end
```

#### 5.7.3 Port GtkDialog (Async Pattern)

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module Dialog : sig
  type t = [`dialog] obj
  type response_type = int

  val create : unit -> t

  (** Content area *)
  val get_content_area : t -> Box.t

  (** Add action widget (button) *)
  val add_button : t -> button_text:string -> response_id:response_type -> Widget.t

  (** Add action widget *)
  val add_action_widget : t -> child:Widget.t -> response_id:response_type -> unit

  (** Set response sensitive *)
  val set_response_sensitive : t -> response_id:response_type -> sensitive:bool -> unit

  (** Set default response *)
  val set_default_response : t -> response_type -> unit

  (** Get widget for response *)
  val get_widget_for_response : t -> response_type -> Widget.t option

  (** Response signal (for async pattern) *)
  val connect_response :
    t -> callback:(response_type -> unit) -> GObject.signal_id

  (** Close signal *)
  val connect_close :
    t -> callback:(unit -> unit) -> GObject.signal_id
end
```

**CRITICAL**: No `run()` method - users must connect to response signal.

#### 5.7.4 Port GtkMessageDialog

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module MessageDialog : sig
  type t = [`message_dialog] obj
  type message_type = [
    | `INFO
    | `WARNING
    | `QUESTION
    | `ERROR
    | `OTHER
  ]
  type buttons_type = [
    | `NONE
    | `OK
    | `CLOSE
    | `CANCEL
    | `YES_NO
    | `OK_CANCEL
  ]

  val create :
    ?message_type:message_type ->
    ?buttons:buttons_type ->
    ?text:string ->
    ?parent:Window.t ->
    unit -> t

  val set_markup : t -> string -> unit

  (* Inherits Dialog methods including connect_response *)
end
```

#### 5.7.5 Create GWindow High-Level API

**Location**: `lablgtk4/src/gWindow.ml`

```ocaml
class window_skel obj = object
  inherit GObj.widget_impl obj

  method set_title title = Gtk.Window.set_title obj title
  method title = Gtk.Window.get_title obj

  method set_default_size ~width ~height =
    Gtk.Window.set_default_size obj ~width ~height
  method default_size = Gtk.Window.get_default_size obj

  method set_resizable r = Gtk.Window.set_resizable obj r
  method resizable = Gtk.Window.get_resizable obj

  method set_modal m = Gtk.Window.set_modal obj m
  method modal = Gtk.Window.get_modal obj

  method present = Gtk.Window.present obj
  method close = Gtk.Window.close obj
  method destroy = Gtk.Window.destroy obj

  method set_child child = Gtk.Window.set_child obj child
  method child = Gtk.Window.get_child obj

  method connect_close_request ~callback =
    Gtk.Window.connect_close_request obj ~callback
end

class window obj = object
  inherit window_skel (Gtk.Widget.coerce obj)
end

let window ?title ?width ?height ?resizable ?modal ?show () =
  let w = Gtk.Window.create () in
  let widget = new window w in
  (match title with Some t -> widget#set_title t | None -> ());
  (match width, height with
   | Some w, Some h -> widget#set_default_size ~width:w ~height:h
   | _ -> ());
  (match resizable with Some r -> widget#set_resizable r | None -> ());
  (match modal with Some m -> widget#set_modal m | None -> ());
  if show = Some true then widget#show;
  widget

class dialog_skel obj = object
  inherit window_skel obj

  method content_area = Gtk.Dialog.get_content_area obj
  method add_button ~text ~response = Gtk.Dialog.add_button obj ~button_text:text ~response_id:response

  method connect_response ~callback =
    Gtk.Dialog.connect_response obj ~callback

  (* No run() method - use connect_response instead *)
end

class dialog obj = object
  inherit dialog_skel (Gtk.Widget.coerce obj)
end

let dialog ?title ?parent ?modal ?show () =
  let d = Gtk.Dialog.create () in
  let widget = new dialog d in
  (match title with Some t -> widget#set_title t | None -> ());
  (match parent with Some p -> widget#set_transient_for (Some p#as_widget) | None -> ());
  (match modal with Some m -> widget#set_modal m | None -> ());
  if show = Some true then widget#show;
  widget

(** Message dialog convenience functions *)
let message_dialog
    ?message_type ?buttons ?text ?parent ?modal () =
  let md = Gtk.MessageDialog.create
      ?message_type ?buttons ?text ?parent () in
  let widget = new dialog md in
  (match modal with Some m -> widget#set_modal m | None -> widget#set_modal true);
  widget
```

**Migration helper for dialog run pattern**:
```ocaml
(** Compatibility helper for GTK3 run() pattern
    NOTE: This uses a nested event loop which is NOT recommended in GTK4.
    Use async callback pattern instead when possible. *)
let dialog_run (dialog : dialog) =
  let response = ref None in
  let loop = GMain.main_loop () in

  let _sig = dialog#connect_response ~callback:(fun r ->
    response := Some r;
    GMain.quit loop
  ) in

  dialog#show;
  GMain.run loop;

  match !response with
  | Some r -> r
  | None -> -1  (* Closed without response *)
```

**Success Criteria**:
- Windows can be created and displayed
- Window properties work correctly
- Dialogs work with async response pattern
- Message dialogs display correctly
- ApplicationWindow integrates with GtkApplication

**Estimated Time**: 1 week

---

## 5.8 Menu System (2-3 weeks)

**Priority**: CRITICAL (complete redesign required)

### Overview

This is the **most significant breaking change** in Phase 5. The entire menu system has been redesigned around `GMenuModel` and actions.

**GTK3 approach (REMOVED)**:
```ocaml
let menubar = GMenu.menu_bar () in
let file_menu = GMenu.menu () in
let file_item = GMenu.menu_item ~label:"File" () in
file_item#set_submenu file_menu;
let open_item = GMenu.menu_item ~label:"Open" () in
ignore (open_item#connect#activate ~callback:on_open);
file_menu#append open_item;
menubar#append file_item
```

**GTK4 approach (NEW)**:
```ocaml
let menu = GMenu.Model.create () in
GMenu.Model.append menu ~label:"Open" ~action:"app.open";
let popover = GMenu.PopoverMenu.create_from_model menu in
button#set_popover (Some popover)
```

### Tasks

#### 5.8.1 Port GMenuModel

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module MenuModel : sig
  type t

  val get_n_items : t -> int
  val get_item_link : t -> index:int -> link:string -> t option
  val get_item_attribute_value :
    t -> index:int -> attribute:string -> GLib.Variant.t option

  val connect_items_changed :
    t -> callback:(position:int -> removed:int -> added:int -> unit) ->
    GObject.signal_id
end
```

#### 5.8.2 Port GMenu (Model Builder)

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module Menu : sig
  type t = MenuModel.t

  val create : unit -> t

  (** Append item with label and action *)
  val append : t -> ?label:string -> ?action:string -> unit

  (** Append item with detailed action (with target) *)
  val append_with_target :
    t -> label:string -> action:string -> target:GLib.Variant.t -> unit

  (** Append submenu *)
  val append_submenu : t -> label:string -> submenu:MenuModel.t -> unit

  (** Append section *)
  val append_section : t -> ?label:string -> section:MenuModel.t -> unit

  (** Prepend variants *)
  val prepend : t -> ?label:string -> ?action:string -> unit
  val prepend_submenu : t -> label:string -> submenu:MenuModel.t -> unit
  val prepend_section : t -> ?label:string -> section:MenuModel.t -> unit

  (** Insert variants *)
  val insert : t -> position:int -> ?label:string -> ?action:string -> unit
  val insert_submenu :
    t -> position:int -> label:string -> submenu:MenuModel.t -> unit
  val insert_section :
    t -> position:int -> ?label:string -> section:MenuModel.t -> unit

  (** Remove item *)
  val remove : t -> position:int -> unit

  (** Remove all *)
  val remove_all : t -> unit
end
```

#### 5.8.3 Port GtkPopoverMenu

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module PopoverMenu : sig
  type t = [`popover_menu] obj

  val create_from_model : MenuModel.t -> t
  val create_from_model_full :
    MenuModel.t -> flags:popover_menu_flags -> t

  val set_menu_model : t -> MenuModel.t option -> unit
  val get_menu_model : t -> MenuModel.t option

  (* Inherits popover methods *)
  val set_pointing_to : t -> Gdk.Rectangle.t -> unit
  val set_position : t -> position_type -> unit
  val popup : t -> unit
  val popdown : t -> unit

  val set_autohide : t -> bool -> unit
  val get_autohide : t -> bool
end
```

#### 5.8.4 Port GtkPopoverMenuBar

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module PopoverMenuBar : sig
  type t = [`popover_menu_bar] obj

  val create_from_model : MenuModel.t option -> t

  val set_menu_model : t -> MenuModel.t option -> unit
  val get_menu_model : t -> MenuModel.t option

  (** Add child widget (for custom menu bar items) *)
  val add_child : t -> child:Widget.t -> id:string -> unit
  val remove_child : t -> child:Widget.t -> unit
end
```

#### 5.8.5 Port GtkMenuButton

**Location**: `lablgtk4/src/gtk.ml`

```ocaml
module MenuButton : sig
  type t = [`menu_button] obj

  val create : unit -> t

  val set_popover : t -> Popover.t option -> unit
  val get_popover : t -> Popover.t option

  val set_menu_model : t -> MenuModel.t option -> unit
  val get_menu_model : t -> MenuModel.t option

  val set_icon_name : t -> string -> unit
  val get_icon_name : t -> string

  val set_direction : t -> arrow_type -> unit
  val get_direction : t -> arrow_type

  val set_label : t -> string -> unit
  val get_label : t -> string

  val set_has_frame : t -> bool -> unit
  val get_has_frame : t -> bool

  val popup : t -> unit
  val popdown : t -> unit
end
```

#### 5.8.6 Create GMenu High-Level API

**Location**: `lablgtk4/src/gMenu.ml`

```ocaml
(** High-level menu model wrapper *)
class menu_model (model : Gtk.MenuModel.t) = object
  method model = model
  method n_items = Gtk.MenuModel.get_n_items model
end

class menu (menu : Gtk.Menu.t) = object
  inherit menu_model (menu :> Gtk.MenuModel.t)

  method append ?label ?action () =
    Gtk.Menu.append menu ?label ?action

  method append_submenu ~label ~submenu =
    Gtk.Menu.append_submenu menu ~label ~submenu:(submenu#model)

  method append_section ?label ~section =
    Gtk.Menu.append_section menu ?label ~section:(section#model)

  method prepend ?label ?action () =
    Gtk.Menu.prepend menu ?label ?action

  method insert ~position ?label ?action () =
    Gtk.Menu.insert menu ~position ?label ?action

  method remove ~position =
    Gtk.Menu.remove menu ~position

  method remove_all =
    Gtk.Menu.remove_all menu
end

let menu () = new menu (Gtk.Menu.create ())

(** Popover menu wrapper *)
class popover_menu_skel obj = object
  inherit GObj.widget_impl obj

  method set_menu_model model =
    Gtk.PopoverMenu.set_menu_model obj model

  method menu_model = Gtk.PopoverMenu.get_menu_model obj

  method popup = Gtk.PopoverMenu.popup obj
  method popdown = Gtk.PopoverMenu.popdown obj

  method set_autohide a = Gtk.PopoverMenu.set_autohide obj a
  method autohide = Gtk.PopoverMenu.get_autohide obj
end

class popover_menu obj = object
  inherit popover_menu_skel (Gtk.Widget.coerce obj)
end

let popover_menu (menu_model : menu) =
  let pm = Gtk.PopoverMenu.create_from_model menu_model#model in
  new popover_menu pm

(** Menu bar wrapper *)
class popover_menu_bar_skel obj = object
  inherit GObj.widget_impl obj

  method set_menu_model model =
    Gtk.PopoverMenuBar.set_menu_model obj model

  method menu_model = Gtk.PopoverMenuBar.get_menu_model obj

  method add_child ~child ~id =
    Gtk.PopoverMenuBar.add_child obj ~child ~id

  method remove_child ~child =
    Gtk.PopoverMenuBar.remove_child obj ~child
end

class popover_menu_bar obj = object
  inherit popover_menu_bar_skel (Gtk.Widget.coerce obj)
end

let popover_menu_bar ?menu_model () =
  let model = match menu_model with
    | Some (m : menu) -> Some m#model
    | None -> None
  in
  let mb = Gtk.PopoverMenuBar.create_from_model model in
  new popover_menu_bar mb

(** Menu button wrapper *)
class menu_button_skel obj = object
  inherit GObj.widget_impl obj

  method set_popover popover =
    Gtk.MenuButton.set_popover obj popover

  method popover = Gtk.MenuButton.get_popover obj

  method set_menu_model (model : menu option) =
    let m = match model with
      | Some menu -> Some menu#model
      | None -> None
    in
    Gtk.MenuButton.set_menu_model obj m

  method set_label label = Gtk.MenuButton.set_label obj label
  method label = Gtk.MenuButton.get_label obj

  method set_icon_name name = Gtk.MenuButton.set_icon_name obj name

  method popup = Gtk.MenuButton.popup obj
  method popdown = Gtk.MenuButton.popdown obj
end

class menu_button obj = object
  inherit menu_button_skel (Gtk.Widget.coerce obj)
end

let menu_button ?label ?icon_name ?menu_model ?packing ?show () =
  let mb = Gtk.MenuButton.create () in
  let widget = new menu_button mb in
  (match label with Some l -> widget#set_label l | None -> ());
  (match icon_name with Some n -> widget#set_icon_name n | None -> ());
  (match menu_model with Some m -> widget#set_menu_model (Some m) | None -> ());
  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());
  if show = Some true then widget#show;
  widget
```

#### 5.8.7 Testing

**Location**: `tests/test_menu.ml`

```ocaml
open Alcotest

let test_menu_model_creation () =
  let menu = Gtk.Menu.create () in
  Gtk.Menu.append menu ~label:"Item 1" ~action:"app.item1";
  Gtk.Menu.append menu ~label:"Item 2" ~action:"app.item2";
  check int "items" 2 (Gtk.MenuModel.get_n_items (menu :> Gtk.MenuModel.t))

let test_submenu () =
  let main_menu = Gtk.Menu.create () in
  let file_menu = Gtk.Menu.create () in
  Gtk.Menu.append file_menu ~label:"Open" ~action:"app.open";
  Gtk.Menu.append file_menu ~label:"Save" ~action:"app.save";
  Gtk.Menu.append_submenu main_menu ~label:"File" ~submenu:(file_menu :> Gtk.MenuModel.t);
  check int "main items" 1 (Gtk.MenuModel.get_n_items (main_menu :> Gtk.MenuModel.t))

let test_popover_menu () =
  let menu = Gtk.Menu.create () in
  Gtk.Menu.append menu ~label:"Action" ~action:"app.action";
  let popover = Gtk.PopoverMenu.create_from_model (menu :> Gtk.MenuModel.t) in
  check bool "created" true (popover <> Obj.magic 0)

let test_high_level_menu () =
  let menu = GMenu.menu () in
  menu#append ~label:"Item 1" ~action:"app.item1" ();
  menu#append ~label:"Item 2" ~action:"app.item2" ();
  check int "items" 2 menu#n_items

let () =
  run "Menu Tests" [
    "menu_model", [
      test_case "creation" `Quick test_menu_model_creation;
      test_case "submenu" `Quick test_submenu;
    ];
    "popover", [
      test_case "creation" `Quick test_popover_menu;
    ];
    "high_level", [
      test_case "gmenu" `Quick test_high_level_menu;
    ];
  ]
```

**Success Criteria**:
- Can create menu models programmatically
- Can build hierarchical menus with submenus
- Popover menus display correctly
- Menu bar uses GMenuModel
- Menu buttons work with popovers
- Actions integration works (requires GAction from Phase 6)

**Estimated Time**: 2-3 weeks

---

## Phase 5 Deliverables

At the end of Phase 5, the following should be complete:

### Code

- [ ] All button widgets (Button, CheckButton, ToggleButton, LinkButton, MenuButton, Switch)
- [ ] Radio button emulation via grouped CheckButton
- [ ] Entry widgets (Entry, SearchEntry, PasswordEntry, SpinButton)
- [ ] Text widgets (TextView, TextBuffer, TextTag, TextTagTable)
- [ ] Range widgets (Scale, ProgressBar, LevelBar)
- [ ] Tree/List widgets (TreeView, TreeModel, ListStore, TreeStore, TreeViewColumn, CellRenderers)
- [ ] Misc widgets (Label, Image, Separator, Spinner, Statusbar, InfoBar)
- [ ] Window widgets (Window, ApplicationWindow, Dialog, MessageDialog, AboutDialog)
- [ ] Menu system (GMenuModel, GMenu, PopoverMenu, PopoverMenuBar, MenuButton)
- [ ] High-level wrappers for all widgets (GButton, GEdit, GText, GRange, GTree, GMisc, GWindow, GMenu)

### Documentation

- [ ] Widget-by-widget migration guide
- [ ] Radio button migration (GtkRadioButton → grouped GtkCheckButton)
- [ ] Menu system migration (GtkMenu → GMenuModel + PopoverMenu)
- [ ] Dialog async pattern guide (no more dialog.run())
- [ ] TreeView usage examples
- [ ] Complete code examples for each widget category

### Testing

- [ ] Button widget tests
- [ ] Entry widget tests
- [ ] Text widget tests (buffer, view, tags)
- [ ] Tree widget tests (model, view, selection)
- [ ] Label and image tests
- [ ] Window and dialog tests
- [ ] Menu model and popover menu tests
- [ ] Interactive tests for user input widgets
- [ ] Memory leak tests for all widgets

### Validation

- [ ] Can build complete applications with all widgets
- [ ] Menu system works with actions (basic integration)
- [ ] Dialogs work with async callback pattern
- [ ] Radio buttons work via check button grouping
- [ ] Text editing fully functional
- [ ] Tree views display and interact correctly
- [ ] All GTK3 menu code removed

### Examples

- [ ] Button showcase example
- [ ] Text editor example
- [ ] Tree/list view example
- [ ] Menu and menu bar example
- [ ] Dialog examples (message, custom)
- [ ] Complete mini application combining multiple widgets

---

## Migration Guide: GTK3 → GTK4 Widgets

### Radio Buttons

**GTK3 (REMOVED)**:
```ocaml
let rb1 = GButton.radio_button ~label:"Option 1" () in
let rb2 = GButton.radio_button ~group:rb1#group ~label:"Option 2" () in
let rb3 = GButton.radio_button ~group:rb1#group ~label:"Option 3" () in
```

**GTK4 (NEW)**:
```ocaml
let rb1 = GButton.check_button ~label:"Option 1" () in
let rb2 = GButton.check_button ~label:"Option 2" ~group:rb1 () in
let rb3 = GButton.check_button ~label:"Option 3" ~group:rb1 () in
```

### Menus

**GTK3 (REMOVED)**:
```ocaml
let menubar = GMenu.menu_bar () in
let file_menu = GMenu.menu () in
let file_item = GMenu.menu_item ~label:"File" () in
file_item#set_submenu file_menu;
let open_item = GMenu.menu_item ~label:"Open" () in
ignore (open_item#connect#activate ~callback:on_open);
file_menu#append open_item;
menubar#append file_item;
window#add menubar#coerce
```

**GTK4 (NEW)**:
```ocaml
(* Create menu model *)
let file_menu = GMenu.menu () in
file_menu#append ~label:"Open" ~action:"app.open" ();
file_menu#append ~label:"Save" ~action:"app.save" ();

let main_menu = GMenu.menu () in
main_menu#append_submenu ~label:"File" ~submenu:file_menu ();

(* Create menu bar from model *)
let menubar = GMenu.popover_menu_bar ~menu_model:main_menu () in
box#append menubar#coerce;

(* Actions must be registered separately - see Phase 6 *)
```

### Dialogs

**GTK3 (REMOVED)**:
```ocaml
let dialog = GWindow.dialog ~title:"Question" () in
dialog#add_button_stock `YES `YES;
dialog#add_button_stock `NO `NO;
let response = dialog#run () in  (* BLOCKING *)
dialog#destroy ();
match response with
| `YES -> handle_yes ()
| `NO -> handle_no ()
```

**GTK4 (NEW - Async)**:
```ocaml
let dialog = GWindow.dialog ~title:"Question" () in
ignore (dialog#add_button ~text:"Yes" ~response:1);
ignore (dialog#add_button ~text:"No" ~response:0);
ignore (dialog#connect_response ~callback:(fun response ->
  dialog#destroy ();
  match response with
  | 1 -> handle_yes ()
  | 0 -> handle_no ()
  | _ -> ()
));
dialog#show
```

### Text Widgets

**Minimal changes** - GTK4 text API is largely compatible:
```ocaml
(* Works in both GTK3 and GTK4 *)
let buffer = GText.buffer () in
let view = GText.view ~buffer () in
buffer#set_text "Hello, world!";
view#set_editable true
```

---

## Timeline Summary

| Task | Duration | Cumulative |
|------|----------|------------|
| 5.1 Button Widgets | 1.5 weeks | 1.5 weeks |
| 5.2 Entry Widgets | 1 week | 2.5 weeks |
| 5.3 Text Widgets | 1.5-2 weeks | 4-4.5 weeks |
| 5.4 Range Widgets | 0.5-1 week | 4.5-5.5 weeks |
| 5.5 Tree/List Widgets | 2-3 weeks | 6.5-8.5 weeks |
| 5.6 Misc Widgets | 1 week | 7.5-9.5 weeks |
| 5.7 Window Widgets | 1 week | 8.5-10.5 weeks |
| 5.8 Menu System | 2-3 weeks | 10.5-13.5 weeks |

**Total Phase 5 time**: 10.5-13.5 weeks (adjust to 8-12 weeks with optimization)

**Optimization opportunities**:
- Parallelize independent widget categories
- Defer optional widgets to Phase 7
- Use code generation for repetitive bindings

---

## Risk Assessment

### Technical Risks

**High Risk**:
- **Menu system redesign**: Complete paradigm shift, no backward compatibility path
- **Dialog async pattern**: Users must change all dialog code
- **Radio button replacement**: Different conceptual model
- **Testing complexity**: Large surface area, many interactions

**Medium Risk**:
- **Tree widget complexity**: Large API surface, complex interactions
- **Text widget edge cases**: Rich text editing has many corner cases
- **Action integration**: Menus require action system (Phase 6 dependency)

**Low Risk**:
- **Entry widgets**: Minimal changes from GTK3
- **Range widgets**: Straightforward ports
- **Label/Image**: Simple widgets

### Mitigation Strategies

1. **Early Menu Prototype**: Build menu system early to validate approach
2. **Comprehensive Examples**: Create examples for each major widget type
3. **Migration Guide**: Detailed guide with before/after code samples
4. **Incremental Testing**: Test each widget category as completed
5. **Code Review**: Reference lablgtk3 implementations frequently
6. **Community Feedback**: Share examples early for user feedback

### User Migration Impact

**Breaking changes users will face**:
1. All menu code must be rewritten (highest impact)
2. Dialog.run() must be replaced with callbacks (high impact)
3. Radio buttons use different API (medium impact)
4. No generic container add/remove in widget creation (already handled in Phase 4)

**Recommendation**: Create migration utility functions where possible to ease transition.

---

## Next Steps After Phase 5

Once Phase 5 is complete:

1. **Phase 6: Advanced Features** (4-6 weeks)
   - GtkBuilder and UI file loading
   - GtkApplication and action system (required for menus to be functional)
   - File chooser with GFile API
   - Drag-and-drop controllers
   - Keyboard shortcuts

2. **Application Testing**
   - Build complete example applications
   - Test all widgets in realistic scenarios
   - Performance benchmarking
   - Memory leak testing with valgrind

3. **Documentation Sprint**
   - Complete API documentation
   - Migration guide refinement
   - Tutorial creation
   - FAQ for common issues

---

**Last Updated**: 2025-11-16
**Status**: Phase 5 plan complete, ready for implementation
