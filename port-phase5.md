# Phase 5: High-Level Widgets (4-6 weeks)

**Objective**: Generate GTK4 widget bindings using GIR code generation infrastructure, implementing high-level OCaml wrappers and comprehensive testing.

**Dependencies**: Phase 4 complete (containers and layout system working)

**Status**: 📋 **READY TO START**

---

## Overview

Phase 5 leverages the GIR-based code generation infrastructure from Phase 3 to automatically generate widget bindings. Instead of hand-writing thousands of lines of C FFI code, we'll:

1. **Extend gir_gen** to handle widget classes (not just event controllers)
2. **Generate C bindings** and OCaml modules from Gtk-4.0.gir
3. **Write high-level wrappers** by hand (GButton, GEdit, etc.)
4. **Create comprehensive tests** for all widgets
5. **Integrate with dune build** for automatic regeneration

### Code Generation Strategy

**Auto-Generated** (from GIR):
- ✅ C FFI bindings (`ml_gtk_widgets_gen.c`)
- ✅ Low-level OCaml modules (`Gtk.Button`, `Gtk.Entry`, etc.)
- ✅ Type conversions and external declarations

**Hand-Written** (custom code):
- ✅ High-level wrappers (`GButton.button`, `GEdit.entry`, etc.)
- ✅ OCaml class hierarchies
- ✅ Convenience functions and constructors
- ✅ Tests for each widget category

**Key Advantage**: Adding a new widget becomes a matter of adding its name to a configuration file and regenerating, rather than writing hundreds of lines of boilerplate code.

### Critical Changes from GTK3

1. **Radio Buttons**: `GtkRadioButton` removed → use grouped `GtkCheckButton`
2. **Menu System**: Complete redesign from `GtkMenu` to `GMenuModel` + `PopoverMenu`
3. **Dialogs**: `gtk_dialog_run()` removed → async callback pattern required
4. **Widget Properties**: Many container-specific properties moved to `GtkWidget`

---

## 5.0 Extend GIR Code Generator (1-1.5 weeks)

**Priority**: CRITICAL (foundation for all widget generation)

### Overview

The existing `gir_gen.ml` tool generates bindings for event controllers. We need to extend it to handle widget classes, which have additional complexities:

- Multiple inheritance patterns (GtkButton → GtkWidget → GInitiallyUnowned)
- Property system integration
- Signal connection helpers
- Child widget management (set_child, get_child for single-child containers)
- Specialized methods beyond basic getters/setters

### Tasks

#### 5.0.1 Enhance GIR Parser for Widgets

**Location**: `lablgtk4/src/tools/gir_gen.ml`

**Enhancements needed**:

```ocaml
(* Add property support *)
type gir_property = {
  prop_name : string;
  prop_type : gir_type;
  readable : bool;
  writable : bool;
  construct_only : bool;
  doc : string option;
}

(* Update gir_class to include properties *)
type gir_class = {
  class_name : string;
  c_type : string;
  parent : string option;
  implements : string list;  (* NEW: interfaces *)
  constructors : gir_constructor list;
  methods : gir_method list;
  properties : gir_property list;  (* NEW *)
  signals : gir_signal list;
  class_doc : string option;
}
```

**Additional type mappings** for widgets:
```ocaml
let extended_type_mappings = [
  (* Existing mappings... *)
  ("GtkOrientation", {
    ocaml_type = "orientation";
    c_to_ml = "Val_orientation";
    ml_to_c = "Orientation_val";
    needs_copy = false;
  });
  ("GtkAlign", {
    ocaml_type = "align";
    c_to_ml = "Val_align";
    ml_to_c = "Align_val";
    needs_copy = false;
  });
  ("GtkJustification", {
    ocaml_type = "justification";
    c_to_ml = "Val_justification";
    ml_to_c = "Justification_val";
    needs_copy = false;
  });
  ("GtkWrapMode", {
    ocaml_type = "Pango.wrap_mode";
    c_to_ml = "Val_PangoWrapMode";
    ml_to_c = "PangoWrapMode_val";
    needs_copy = false;
  });
  (* Add more as needed *)
]
```

#### 5.0.2 Add Widget Filter Configuration

**Location**: `lablgtk4/src/tools/widget_filter.conf` (NEW FILE)

**Purpose**: Specify which widgets to generate bindings for

```
# Phase 5 Widget Generation Configuration
# Format: widget_class_name [options]

# 5.1 Button Widgets
GtkButton
GtkCheckButton
GtkToggleButton
GtkLinkButton
GtkMenuButton
GtkSwitch

# 5.2 Entry Widgets
GtkEntry
GtkSearchEntry
GtkPasswordEntry
GtkSpinButton
GtkEditable  # Interface

# 5.3 Text Widgets
GtkTextView
GtkTextBuffer
GtkTextTag
GtkTextTagTable
GtkTextIter
GtkTextMark

# 5.4 Range Widgets
GtkScale
GtkRange
GtkProgressBar
GtkLevelBar
GtkAdjustment

# 5.5 Tree Widgets
GtkTreeView
GtkTreeModel  # Interface
GtkListStore
GtkTreeStore
GtkTreeViewColumn
GtkTreeSelection
GtkCellRenderer
GtkCellRendererText
GtkCellRendererToggle
GtkCellRendererPixbuf

# 5.6 Misc Widgets
GtkLabel
GtkImage
GtkSeparator
GtkSpinner
GtkStatusbar
GtkInfoBar

# 5.7 Window Widgets (additional to Phase 4)
GtkDialog
GtkMessageDialog
GtkAboutDialog
GtkApplicationWindow

# 5.8 Menu System (NEW in GTK4)
GMenuModel  # Interface
GMenu
GtkPopoverMenu
GtkPopoverMenuBar
GtkPopover  # Base class
```

#### 5.0.3 Implement Generator Enhancements

**Location**: `lablgtk4/src/tools/gir_gen.ml`

**Add generation modes**:

```ocaml
type generation_mode =
  | EventControllers  (* Existing mode *)
  | Widgets           (* New mode *)
  | All

let parse_command_line () =
  let gir_file = ref "" in
  let output_dir = ref "." in
  let mode = ref Widgets in
  let filter_file = ref None in

  let usage = "Usage: gir_gen [options] <gir-file> <output-dir>" in
  let specs = [
    ("-mode", Arg.Symbol (["controllers"; "widgets"; "all"],
                          fun s -> mode := match s with
                            | "controllers" -> EventControllers
                            | "widgets" -> Widgets
                            | "all" -> All
                            | _ -> Widgets),
     " Generation mode (controllers|widgets|all)");
    ("-filter", Arg.String (fun s -> filter_file := Some s),
     " Filter file specifying which classes to generate");
  ] in

  Arg.parse specs (fun arg ->
    if !gir_file = "" then gir_file := arg
    else if !output_dir = "." then output_dir := arg
  ) usage;

  if !gir_file = "" then begin
    prerr_endline "Error: GIR file not specified";
    Arg.usage specs usage;
    exit 1
  end;

  (!gir_file, !output_dir, !mode, !filter_file)
```

**Add property generation**:

```ocaml
(* Generate property getter/setter *)
let generate_property_bindings prop class_name =
  let c_class_name = "Gtk" ^ class_name in
  let prop_snake = to_snake_case prop.prop_name in
  let c_getter = sprintf "gtk_%s_get_%s" (to_snake_case class_name) prop_snake in
  let c_setter = sprintf "gtk_%s_set_%s" (to_snake_case class_name) prop_snake in

  let getter_code =
    if prop.readable then
      sprintf "CAMLprim value ml_%s(value self)\n{\n  CAMLparam1(self);\n  /* Generated getter for %s */\n  ...\n  CAMLreturn(result);\n}\n"
        c_getter prop.prop_name
    else ""
  in

  let setter_code =
    if prop.writable && not prop.construct_only then
      sprintf "CAMLprim value ml_%s(value self, value v)\n{\n  CAMLparam2(self, v);\n  /* Generated setter for %s */\n  ...\n  CAMLreturn(Val_unit);\n}\n"
        c_setter prop.prop_name
    else ""
  in

  (getter_code, setter_code)
```

#### 5.0.4 Add Signal Connection Helpers

**Enhancement**: Generate signal connection helpers automatically

```ocaml
(* Generate signal connection helper *)
let generate_signal_connection signal class_name =
  let signal_snake = String.map (function '-' -> '_' | c -> c) signal.signal_name in
  let c_func_name = sprintf "ml_gtk_%s_connect_%s"
    (to_snake_case class_name) signal_snake in

  (* Generate C callback wrapper *)
  let callback_wrapper = sprintf {|
static void %s_wrapper(
    Gtk%s *obj,
    /* signal parameters here */
    gpointer user_data)
{
  CAMLparam0();
  value *ocaml_callback = (value*)user_data;
  /* Marshal parameters and call OCaml callback */
  caml_callback_exn(*ocaml_callback, /* args */);
  CAMLreturn0;
}
|} signal_snake class_name in

  (* Generate FFI function *)
  let ffi_function = sprintf {|
CAMLprim value %s(value widget, value callback)
{
  CAMLparam2(widget, callback);
  value *callback_root = ml_global_root_new(callback);
  gulong signal_id = g_signal_connect(
    GtkWidget_val(widget),
    "%s",
    G_CALLBACK(%s_wrapper),
    callback_root
  );
  CAMLreturn(Val_long(signal_id));
}
|} c_func_name signal.signal_name signal_snake in

  (callback_wrapper, ffi_function)
```

#### 5.0.5 Update Build Integration

**Location**: `lablgtk4/src/tools/dune`

```lisp
; Generator executable
(executable
 (name gir_gen)
 (modules gir_gen)
 (libraries xmlm str))

; Add generation rule
(rule
 (targets ml_gtk_widgets_gen.c
          gtk_button.mli gtk_check_button.mli gtk_toggle_button.mli
          gtk_entry.mli gtk_text_view.mli gtk_text_buffer.mli
          gtk_label.mli gtk_image.mli
          gtk_tree_view.mli gtk_tree_model.mli gtk_list_store.mli
          ; ... add all generated files
 )
 (deps ../tools/gir_gen.exe widget_filter.conf
       (env_var GTK_GIR_FILE))
 (action
  (run %{deps} -mode widgets -filter widget_filter.conf
       %{env:GTK_GIR_FILE=/usr/share/gir-1.0/Gtk-4.0.gir}
       .)))
```

**Location**: `lablgtk4/src/dune`

Update to use generated files:

```lisp
(library
 (name lablgtk4)
 (public_name lablgtk4)
 (wrapped false)
 (c_names
   wrappers
   ml_glib ml_gobject ml_gdk ml_gdkpixbuf
   ml_gdk_clipboard ml_pango ml_gtk
   ml_gtk_widgets_gen)  ; Generated C file
 ; ... rest of configuration
 (modules
   ; Existing modules
   gpointer glib gobject gdk gdkPixbuf pango gtk
   ; Generated modules (specified in .mli files)
   gtkButton gtkCheckButton gtkToggleButton
   gtkEntry gtkSearchEntry gtkSpinButton
   gtkTextView gtkTextBuffer
   gtkLabel gtkImage
   ; High-level wrappers (hand-written)
   gButton gEdit gText gMisc gWindow gMenu))
```

**Success Criteria**:
- gir_gen can parse widget classes from Gtk-4.0.gir
- Generated C code compiles without errors
- Generated .mli files are type-correct
- dune build automatically regenerates bindings when filter changes
- Properties and signals are generated correctly

**Estimated Time**: 1-1.5 weeks

---

## 5.1 Generate Button Widget Bindings (0.5 weeks)

**Priority**: HIGH (validates generation approach)

### Overview

Button widgets are the first category to generate, serving as validation for the code generation approach. These are simple widgets with straightforward APIs.

### Tasks

#### 5.1.1 Configure Button Widget Generation

**Location**: `lablgtk4/src/tools/widget_filter.conf`

Ensure button widgets are enabled:
```
GtkButton
GtkCheckButton
GtkToggleButton
GtkLinkButton
GtkMenuButton
GtkSwitch
```

#### 5.1.2 Run Code Generation

```bash
cd lablgtk4
dune build src/tools/gir_gen.exe

# Generate button bindings
./_build/default/src/tools/gir_gen.exe \
  -mode widgets \
  -filter src/tools/widget_filter.conf \
  /usr/share/gir-1.0/Gtk-4.0.gir \
  src/
```

**Generated files**:
- `src/ml_gtk_widgets_gen.c` - C FFI bindings
- `src/gtkButton.mli` - GtkButton module interface
- `src/gtkCheckButton.mli` - GtkCheckButton module interface
- `src/gtkToggleButton.mli` - etc.

#### 5.1.3 Create High-Level GButton Module

**Location**: `lablgtk4/src/gButton.ml`, `lablgtk4/src/gButton.mli` (HAND-WRITTEN)

**Purpose**: Provide OCaml-friendly class-based API on top of generated bindings

```ocaml
(** High-level button widget wrappers *)

(** {2 Button} *)

class button_skel obj = object
  inherit GObj.widget_impl obj

  method set_label label = GtkButton.set_label obj label
  method label = GtkButton.get_label obj

  method set_has_frame has_frame = GtkButton.set_has_frame obj has_frame
  method has_frame = GtkButton.get_has_frame obj

  method set_icon_name name = GtkButton.set_icon_name obj name
  method icon_name = GtkButton.get_icon_name obj

  method connect_clicked ~callback =
    GtkButton.connect_clicked obj ~callback
end

class button obj = object
  inherit button_skel (Gtk.Widget.coerce obj)
end

let button ?label ?use_underline ?icon_name ?packing ?show () =
  let btn = match label, use_underline with
    | Some l, Some true -> GtkButton.new_with_mnemonic l
    | Some l, _ -> GtkButton.new_with_label l
    | None, _ -> GtkButton.new_ ()
  in
  let widget = new button btn in
  (match icon_name with Some n -> widget#set_icon_name n | None -> ());
  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());
  if show = Some true then widget#show;
  widget

(** {2 Check Button} *)

class check_button_skel obj = object
  inherit GObj.widget_impl obj

  method set_active active = GtkCheckButton.set_active obj active
  method active = GtkCheckButton.get_active obj

  method set_label label = GtkCheckButton.set_label obj label
  method label = GtkCheckButton.get_label obj

  (** Radio button grouping *)
  method set_group (group : check_button option) =
    let group_obj = match group with
      | Some g -> Some g#as_widget
      | None -> None
    in
    GtkCheckButton.set_group obj group_obj

  method connect_toggled ~callback =
    GtkCheckButton.connect_toggled obj ~callback
end

and check_button obj = object
  inherit check_button_skel (Gtk.Widget.coerce obj)
end

let check_button ?label ?active ?group ?packing ?show () =
  let btn = match label with
    | Some l -> GtkCheckButton.new_with_label l
    | None -> GtkCheckButton.new_ ()
  in
  let widget = new check_button btn in
  (match active with Some a -> widget#set_active a | None -> ());
  (match group with Some g -> widget#set_group (Some g) | None -> ());
  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());
  if show = Some true then widget#show;
  widget

(** Radio button using check button grouping *)
let radio_button ?label ?group ?packing ?show () =
  check_button ?label ?group ?packing ?show ()

(** {2 Toggle Button} *)

class toggle_button_skel obj = object
  inherit button_skel obj

  method set_active active = GtkToggleButton.set_active obj active
  method active = GtkToggleButton.get_active obj

  method connect_toggled ~callback =
    GtkToggleButton.connect_toggled obj ~callback
end

class toggle_button obj = object
  inherit toggle_button_skel (Gtk.Widget.coerce obj)
end

let toggle_button ?label ?active ?packing ?show () =
  let btn = match label with
    | Some l -> GtkToggleButton.new_with_label l
    | None -> GtkToggleButton.new_ ()
  in
  let widget = new toggle_button btn in
  (match active with Some a -> widget#set_active a | None -> ());
  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());
  if show = Some true then widget#show;
  widget
```

#### 5.1.4 Testing

**Location**: `tests/test_button.ml` (HAND-WRITTEN)

```ocaml
open Alcotest

let test_button_generation () =
  (* Test that generated bindings work *)
  let btn = GtkButton.new_with_label "Test" in
  check string "label" "Test" (GtkButton.get_label btn)

let test_button_icon () =
  let btn = GtkButton.new_ () in
  GtkButton.set_icon_name btn "document-open";
  check string "icon" "document-open" (GtkButton.get_icon_name btn)

let test_check_button_grouping () =
  let rb1 = GtkCheckButton.new_with_label "Option 1" in
  let rb2 = GtkCheckButton.new_with_label "Option 2" in

  (* Group them *)
  GtkCheckButton.set_group rb2 (Some rb1);

  (* Activate first *)
  GtkCheckButton.set_active rb1 true;
  check bool "rb1 active" true (GtkCheckButton.get_active rb1)

let test_high_level_button () =
  let btn = GButton.button ~label:"Click me" () in
  check string "label" "Click me" btn#label;

  btn#set_label "Updated";
  check string "updated" "Updated" btn#label

let test_radio_buttons () =
  let rb1 = GButton.check_button ~label:"Option 1" () in
  let rb2 = GButton.check_button ~label:"Option 2" ~group:rb1 () in
  let rb3 = GButton.check_button ~label:"Option 3" ~group:rb1 () in

  rb1#set_active true;
  check bool "rb1 active" true rb1#active

let () =
  run "Button Tests" [
    "generated", [
      test_case "button_creation" `Quick test_button_generation;
      test_case "button_icon" `Quick test_button_icon;
      test_case "check_grouping" `Quick test_check_button_grouping;
    ];
    "high_level", [
      test_case "gbutton" `Quick test_high_level_button;
      test_case "radio" `Quick test_radio_buttons;
    ];
  ]
```

**Success Criteria**:
- Generated GtkButton bindings compile
- High-level GButton module provides convenient API
- Radio button grouping works correctly
- All tests pass

**Estimated Time**: 0.5 weeks

---

## 5.2-5.7 Generate Remaining Widget Categories (2-3 weeks)

### Overview

With the generation approach validated for buttons, we now apply the same pattern to all remaining widget categories. The process for each is:

1. Ensure widget is in `widget_filter.conf`
2. Run `gir_gen` to generate bindings
3. Write high-level wrapper module (G* module)
4. Write tests

### Widget Categories

#### 5.2 Entry Widgets (0.5 weeks)

**Widgets**: GtkEntry, GtkSearchEntry, GtkPasswordEntry, GtkSpinButton

**Generated files**:
- `gtkEntry.mli`, `gtkSearchEntry.mli`, `gtkPasswordEntry.mli`, `gtkSpinButton.mli`
- C bindings in `ml_gtk_widgets_gen.c`

**Hand-written**:
- `gEdit.ml/mli` - High-level entry wrapper classes

**Tests**: `tests/test_entry.ml`

#### 5.3 Text Widgets (0.5-1 week)

**Widgets**: GtkTextView, GtkTextBuffer, GtkTextTag, GtkTextTagTable, GtkTextIter, GtkTextMark

**Note**: Text widgets are complex with iterator types and buffer manipulation. May require custom handling in generator.

**Generated files**:
- `gtkTextView.mli`, `gtkTextBuffer.mli`, `gtkTextTag.mli`, etc.

**Hand-written**:
- `gText.ml/mli` - High-level text editing classes
- Custom iterator handling if needed

**Tests**: `tests/test_text.ml`

#### 5.4 Range Widgets (0.25 weeks)

**Widgets**: GtkScale, GtkRange, GtkProgressBar, GtkLevelBar, GtkAdjustment

**Generated files**:
- `gtkScale.mli`, `gtkRange.mli`, `gtkProgressBar.mli`, `gtkLevelBar.mli`

**Hand-written**:
- `gRange.ml/mli` - High-level range widget wrappers

**Tests**: `tests/test_range.ml`

#### 5.5 Tree/List Widgets (1-1.5 weeks)

**Widgets**: GtkTreeView, GtkTreeModel, GtkListStore, GtkTreeStore, GtkTreeViewColumn, GtkTreeSelection, GtkCellRenderer*, etc.

**Complexity**: Tree widgets have interfaces (GtkTreeModel), custom iterators, and cell renderers. May need special handling.

**Generated files**:
- `gtkTreeView.mli`, `gtkTreeModel.mli`, `gtkListStore.mli`, etc.
- Cell renderer types

**Hand-written**:
- `gTree.ml/mli` - High-level tree/list wrappers
- Custom column helpers
- Type-safe column specifications

**Tests**: `tests/test_tree.ml`

#### 5.6 Misc Widgets (0.25 weeks)

**Widgets**: GtkLabel, GtkImage, GtkSeparator, GtkSpinner, GtkStatusbar, GtkInfoBar

**Generated files**:
- `gtkLabel.mli`, `gtkImage.mli`, `gtkSeparator.mli`, etc.

**Hand-written**:
- `gMisc.ml/mli` - High-level misc widget wrappers

**Tests**: `tests/test_misc.ml`

#### 5.7 Window & Dialog Widgets (0.5 weeks)

**Widgets**: GtkDialog, GtkMessageDialog, GtkAboutDialog, GtkApplicationWindow

**Note**: GtkWindow basics done in Phase 4, extend with dialogs here

**Generated files**:
- `gtkDialog.mli`, `gtkMessageDialog.mli`, `gtkAboutDialog.mli`

**Hand-written**:
- `gWindow.ml/mli` - Extensions for dialogs
- Async dialog pattern helpers

**Tests**: `tests/test_dialog.ml`

### Parallel Development Strategy

These categories can be developed in parallel by different developers:
- **Track 1**: Entry + Range + Misc (simple widgets)
- **Track 2**: Text widgets (complex, needs iteration)
- **Track 3**: Tree widgets (complex, needs models/renderers)
- **Track 4**: Dialogs (async pattern design)

**Success Criteria** for each category:
- Generated bindings compile without errors
- High-level wrappers provide convenient OCaml API
- Tests validate core functionality
- No memory leaks (valgrind clean)

**Estimated Time**: 2-3 weeks (parallelized)

---

## 5.8 Menu System Code Generation (1-1.5 weeks)

**Priority**: CRITICAL (complete GTK4 redesign)

### Overview

The menu system is **completely redesigned** in GTK4. This is the most significant breaking change in Phase 5. Unlike other widgets, menus now use an action-based model architecture.

**GTK3 (REMOVED)**:
- GtkMenu, GtkMenuBar, GtkMenuItem - all removed
- Direct widget-based menu construction

**GTK4 (NEW)**:
- GMenuModel - abstract menu model
- GMenu - menu model builder
- GtkPopoverMenu - popover-based menu display
- GtkPopoverMenuBar - menu bar using popovers
- Action-based (requires GAction from Phase 6)

### Tasks

#### 5.8.1 Generate Menu Model Bindings

**Widgets to generate**:
```
# In widget_filter.conf
GMenuModel      # Interface
GMenu           # Model builder
GtkPopover      # Base class
GtkPopoverMenu
GtkPopoverMenuBar
GtkMenuButton
```

**Generated files**:
- `gMenuModel.mli`, `gMenu.mli`
- `gtkPopover.mli`, `gtkPopoverMenu.mli`, `gtkPopoverMenuBar.mli`
- `gtkMenuButton.mli`

#### 5.8.2 Handle GMenu Special Methods

**Note**: GMenu has special methods for building menus that may need manual bindings:

```ocaml
(* These may need manual implementation if generator doesn't handle them *)
module GMenu : sig
  type t

  val create : unit -> t

  val append : t -> ?label:string -> ?action:string -> unit
  val prepend : t -> ?label:string -> ?action:string -> unit
  val insert : t -> position:int -> ?label:string -> ?action:string -> unit

  val append_submenu : t -> label:string -> submenu:t -> unit
  val append_section : t -> ?label:string -> section:t -> unit

  val remove : t -> position:int -> unit
  val remove_all : t -> unit

  (* Variant types for constructing items with targets *)
  val append_item : t -> item:GMenuItem.t -> unit
end
```

**Check generated code**: If generator handles these, great. If not, write manual bindings.

#### 5.8.3 Create High-Level GMenu Module

**Location**: `lablgtk4/src/gMenu.ml`, `lablgtk4/src/gMenu.mli`

```ocaml
(** High-level menu system wrappers *)

(** Menu model wrapper *)
class menu_model (model : GMenuModel.t) = object
  method model = model
  method n_items = GMenuModel.get_n_items model
end

(** Menu builder *)
class menu (menu : GMenu.t) = object
  inherit menu_model (GMenu.to_model menu)

  method append ?label ?action () =
    GMenu.append menu ?label ?action

  method append_submenu ~label ~submenu =
    GMenu.append_submenu menu ~label ~submenu:(submenu#model)

  method append_section ?label ~section =
    GMenu.append_section menu ?label ~section:(section#model)

  method remove ~position =
    GMenu.remove menu ~position
end

let menu () = new menu (GMenu.create ())

(** Popover menu *)
class popover_menu_skel obj = object
  inherit GObj.widget_impl obj

  method set_menu_model (model : menu option) =
    let m = match model with
      | Some menu -> Some menu#model
      | None -> None
    in
    GtkPopoverMenu.set_menu_model obj m

  method popup = GtkPopoverMenu.popup obj
  method popdown = GtkPopoverMenu.popdown obj
end

class popover_menu obj = object
  inherit popover_menu_skel (Gtk.Widget.coerce obj)
end

let popover_menu (menu_model : menu) =
  let pm = GtkPopoverMenu.create_from_model menu_model#model in
  new popover_menu pm

(** Menu button *)
class menu_button_skel obj = object
  inherit GObj.widget_impl obj

  method set_menu_model (model : menu option) =
    let m = match model with
      | Some menu -> Some menu#model
      | None -> None
    in
    GtkMenuButton.set_menu_model obj m

  method set_label label = GtkMenuButton.set_label obj label
  method set_icon_name name = GtkMenuButton.set_icon_name obj name

  method popup = GtkMenuButton.popup obj
  method popdown = GtkMenuButton.popdown obj
end

class menu_button obj = object
  inherit menu_button_skel (Gtk.Widget.coerce obj)
end

let menu_button ?label ?icon_name ?menu_model ?packing ?show () =
  let mb = GtkMenuButton.new_ () in
  let widget = new menu_button mb in
  (match label with Some l -> widget#set_label l | None -> ());
  (match icon_name with Some n -> widget#set_icon_name n | None -> ());
  (match menu_model with Some m -> widget#set_menu_model (Some m) | None -> ());
  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());
  if show = Some true then widget#show;
  widget
```

#### 5.8.4 Create Menu Migration Examples

**Location**: `lablgtk4/examples/menu_new_style.ml`

```ocaml
(* GTK4 menu system example *)
open GMain

let create_menu () =
  let menu = GMenu.menu () in

  (* Add simple items *)
  menu#append ~label:"New" ~action:"app.new" ();
  menu#append ~label:"Open" ~action:"app.open" ();
  menu#append ~label:"Save" ~action:"app.save" ();

  (* Add submenu *)
  let recent_menu = GMenu.menu () in
  recent_menu#append ~label:"Document 1" ~action:"app.open-recent" ();
  recent_menu#append ~label:"Document 2" ~action:"app.open-recent" ();
  menu#append_submenu ~label:"Recent" ~submenu:recent_menu ();

  menu

let main () =
  ignore (GMain.init ());

  let window = GWindow.window ~title:"Menu Example" ~width:400 ~height:300 () in
  ignore (window#connect_close_request ~callback:(fun () -> Main.quit (); true));

  let vbox = GBox.vbox ~spacing:0 () in
  window#set_child (Some vbox#coerce);

  (* Create menu bar *)
  let menu_model = create_menu () in
  let menu_bar = GMenu.popover_menu_bar ~menu_model () in
  vbox#append menu_bar#coerce;

  (* Note: Actions need to be registered for menu to work *)
  (* See Phase 6 for GAction/GApplication integration *)

  window#show;
  GMain.main ()

let () = main ()
```

#### 5.8.5 Testing

**Location**: `tests/test_menu.ml`

```ocaml
open Alcotest

let test_menu_model_creation () =
  let menu = GMenu.create () in
  GMenu.append menu ~label:"Item 1" ~action:"app.item1";
  GMenu.append menu ~label:"Item 2" ~action:"app.item2";
  let model = GMenu.to_model menu in
  check int "items" 2 (GMenuModel.get_n_items model)

let test_submenu () =
  let main_menu = GMenu.create () in
  let file_menu = GMenu.create () in
  GMenu.append file_menu ~label:"Open" ~action:"app.open";
  GMenu.append_submenu main_menu ~label:"File" ~submenu:file_menu;
  let model = GMenu.to_model main_menu in
  check int "main items" 1 (GMenuModel.get_n_items model)

let test_high_level_menu () =
  let menu = GMenu.menu () in
  menu#append ~label:"Item 1" ~action:"app.item1" ();
  menu#append ~label:"Item 2" ~action:"app.item2" ();
  check int "items" 2 menu#n_items

let test_menu_button () =
  let menu = GMenu.menu () in
  menu#append ~label:"Action" ~action:"app.action" ();
  let btn = GMenu.menu_button ~label:"Menu" ~menu_model:menu () in
  check string "label" "Menu" btn#label

let () =
  run "Menu Tests" [
    "menu_model", [
      test_case "creation" `Quick test_menu_model_creation;
      test_case "submenu" `Quick test_submenu;
    ];
    "high_level", [
      test_case "gmenu" `Quick test_high_level_menu;
      test_case "menu_button" `Quick test_menu_button;
    ];
  ]
```

**Success Criteria**:
- GMenuModel and GMenu bindings work
- Can build hierarchical menus
- Popover menus display (when integrated with actions)
- Menu button works
- High-level API provides convenient menu building

**Estimated Time**: 1-1.5 weeks

---

## Phase 5 Deliverables

At the end of Phase 5, the following should be complete:

### Code Generation Infrastructure

- [ ] Extended gir_gen tool supports widget classes
- [ ] Property generation works
- [ ] Signal connection helpers generate correctly
- [ ] Widget filter configuration system working
- [ ] Dune build integration for automatic regeneration
- [ ] Type mappings extended for all GTK4 types needed

### Generated Code

- [ ] All button widgets (Button, CheckButton, ToggleButton, LinkButton, MenuButton, Switch)
- [ ] All entry widgets (Entry, SearchEntry, PasswordEntry, SpinButton)
- [ ] All text widgets (TextView, TextBuffer, TextTag, TextIter, TextMark)
- [ ] All range widgets (Scale, Range, ProgressBar, LevelBar)
- [ ] All tree/list widgets (TreeView, TreeModel, ListStore, TreeStore, TreeViewColumn, CellRenderers)
- [ ] All misc widgets (Label, Image, Separator, Spinner, Statusbar)
- [ ] All dialog widgets (Dialog, MessageDialog, AboutDialog)
- [ ] All menu widgets (GMenuModel, GMenu, PopoverMenu, PopoverMenuBar, MenuButton)

### Hand-Written Wrappers

- [ ] GButton module with radio button support
- [ ] GEdit module for entry widgets
- [ ] GText module for text editing
- [ ] GRange module for sliders/progress
- [ ] GTree module with type-safe columns
- [ ] GMisc module for labels/images
- [ ] GWindow module extended for dialogs
- [ ] GMenu module for new menu system

### Documentation

- [ ] Widget generation guide
- [ ] How to add new widgets to generation
- [ ] Radio button migration guide (CheckButton grouping)
- [ ] Menu system migration guide (GMenu → GMenuModel)
- [ ] Dialog async pattern guide
- [ ] Code generation tool documentation

### Testing

- [ ] Generated bindings compile cleanly
- [ ] All widget categories have test suites
- [ ] High-level wrappers tested
- [ ] Radio button grouping works
- [ ] Menu model construction works
- [ ] No memory leaks (valgrind clean)

### Examples

- [ ] Button showcase
- [ ] Entry widgets demo
- [ ] Text editor example
- [ ] Tree/list view example
- [ ] Menu system example (new style)
- [ ] Dialog examples

---

## Migration Guide: GTK3 → GTK4 Code Generation

### Adding a New Widget

**GTK3 approach (manual)**:
1. Write C FFI bindings by hand (~200-500 lines)
2. Write OCaml module interface (~100-200 lines)
3. Write high-level wrapper class (~100-150 lines)
4. Write tests

**GTK4 approach (generated)**:
1. Add widget name to `widget_filter.conf`
2. Run `dune build` (automatic regeneration)
3. Write high-level wrapper class (~100-150 lines)
4. Write tests

**Time saved**: ~70% less code to write and maintain

### Radio Buttons

**GTK3 (REMOVED)**:
```ocaml
let rb1 = GButton.radio_button ~label:"Option 1" () in
let rb2 = GButton.radio_button ~group:rb1#group ~label:"Option 2" () in
```

**GTK4 (NEW)**:
```ocaml
let rb1 = GButton.check_button ~label:"Option 1" () in
let rb2 = GButton.check_button ~label:"Option 2" ~group:rb1 () in
```

### Menus

**GTK3 (REMOVED)**:
```ocaml
let menubar = GMenu.menu_bar () in
let file_menu = GMenu.menu () in
let open_item = GMenu.menu_item ~label:"Open" () in
ignore (open_item#connect#activate ~callback:on_open);
file_menu#append open_item;
```

**GTK4 (NEW)**:
```ocaml
let menu = GMenu.menu () in
menu#append ~label:"Open" ~action:"app.open" ();
let menubar = GMenu.popover_menu_bar ~menu_model:menu () in
```

### Dialogs

**GTK3 (REMOVED)**:
```ocaml
let dialog = GWindow.dialog ~title:"Question" () in
let response = dialog#run () in  (* BLOCKING *)
```

**GTK4 (NEW)**:
```ocaml
let dialog = GWindow.dialog ~title:"Question" () in
ignore (dialog#connect_response ~callback:(fun response ->
  (* handle response *)
));
dialog#show
```

---

## Timeline Summary

| Task | Duration | Cumulative |
|------|----------|------------|
| 5.0 Extend GIR Generator | 1-1.5 weeks | 1-1.5 weeks |
| 5.1 Button Widgets | 0.5 weeks | 1.5-2 weeks |
| 5.2 Entry Widgets | 0.5 weeks | 2-2.5 weeks |
| 5.3 Text Widgets | 0.5-1 week | 2.5-3.5 weeks |
| 5.4 Range Widgets | 0.25 weeks | 2.75-3.75 weeks |
| 5.5 Tree Widgets | 1-1.5 weeks | 3.75-5.25 weeks |
| 5.6 Misc Widgets | 0.25 weeks | 4-5.5 weeks |
| 5.7 Dialogs | 0.5 weeks | 4.5-6 weeks |
| 5.8 Menu System | 1-1.5 weeks | 5.5-7.5 weeks |

**Total Phase 5 time**: 4-6 weeks (with code generation)

**Previous estimate** (manual): 8-12 weeks
**Time saved**: 50% reduction through code generation

---

## Refactoring Needed for Code Generation

### No Refactoring of Existing Code

**Important**: We do NOT refactor Phase 1-4 code to use code generation. The existing hand-written bindings stay as-is. Code generation is used ONLY for Phase 5 widgets going forward.

**Rationale**:
- Phase 1-4 code is tested and working
- Refactoring introduces risk without benefit
- Mixed approach is acceptable (some hand-written, some generated)
- Future maintenance can gradually adopt generation

### Required New Infrastructure

#### 1. Generator Extensions

**Location**: `lablgtk4/src/tools/gir_gen.ml`

**Changes**:
- Add property parsing and generation
- Add widget-specific type mappings
- Add signal connection helper generation
- Add interface handling (GtkTreeModel, GtkEditable, etc.)

#### 2. Build System Integration

**Location**: `lablgtk4/src/dune`

**Changes**:
- Add generation rule for widgets
- Include generated C file in c_names
- Include generated modules in modules list
- Set up dependency on filter config

#### 3. Type Mapping Extensions

**Location**: `lablgtk4/src/tools/gir_gen.ml` (type_mappings)

**Add mappings for**:
- All GTK enums (orientation, align, justification, etc.)
- Pango types (wrap_mode, ellipsize_mode, etc.)
- Special types (TextIter, TreeIter, etc.)

#### 4. Custom Handling for Complex Types

Some widgets may need custom code:
- **TextIter**: Stack-allocated structure, needs special handling
- **TreeIter**: Similar to TextIter
- **TreeModel**: Interface with callback-based iteration
- **Pixbuf**: Already handled in Phase 2

**Approach**: Generate as much as possible, add manual overrides where needed.

---

## Risk Assessment

### Technical Risks

**High Risk**:
- **Generator complexity**: Widget generation more complex than event controllers
- **Type mapping completeness**: May discover unmapped types during generation
- **Interface handling**: GTK interfaces (TreeModel, Editable) may need special code

**Medium Risk**:
- **Menu action integration**: Full functionality requires GAction (Phase 6)
- **TreeView complexity**: Large API surface, custom iterators
- **Text widget complexity**: TextIter is stack-allocated, needs careful handling

**Low Risk**:
- **Simple widgets**: Buttons, labels, entries straightforward to generate
- **High-level wrappers**: Well-established patterns from lablgtk3

### Mitigation Strategies

1. **Incremental validation**: Start with simple buttons, validate approach
2. **Generator testing**: Comprehensive test suite for gir_gen
3. **Manual fallback**: If generation fails for specific widget, write manually
4. **Reference lablgtk3**: Check existing implementations for complex widgets
5. **Early examples**: Build working examples to validate bindings

---

## Next Steps After Phase 5

Once Phase 5 is complete:

1. **Phase 6: Advanced Features** (4-6 weeks)
   - GtkApplication and GAction (required for menus to work!)
   - GtkBuilder and UI file loading
   - File chooser with GFile API
   - Drag-and-drop controllers
   - Keyboard shortcuts

2. **Integration Testing**
   - Build complete applications using all widgets
   - Validate menu system with actions
   - Performance testing
   - Memory leak testing

3. **Documentation**
   - Complete migration guide
   - Code generation tutorial
   - Widget-by-widget reference

---

**Last Updated**: 2025-11-16
**Status**: Phase 5 plan rewritten for code generation approach
