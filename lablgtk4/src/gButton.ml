(**************************************************************************)
(*    High-level button widget wrappers for lablgtk4                     *)
(**************************************************************************)

open Gaux
open Gtk
open GObj

(** {2 Button Signals} *)

class button_signals (obj : Button.t) = object
  method clicked ~callback =
    Gobject.Signal.connect_simple
      (Button.as_widget obj :> [`widget] Gobject.obj)
      ~name:"clicked"
      ~callback
      ~after:false
end

(** {2 Button} *)

class button_skel (obj : Button.t) = object (self)
  inherit widget_impl (Button.as_widget obj)

  method connect = new button_signals obj

  method set_label label = GtkButton.set_label obj label
  method label = GtkButton.get_label obj

  method set_has_frame has_frame = GtkButton.set_has_frame obj has_frame
  method has_frame = GtkButton.get_has_frame obj

  method set_use_underline use_underline = GtkButton.set_use_underline obj use_underline
  method use_underline = GtkButton.get_use_underline obj

  method set_icon_name icon_name = GtkButton.set_icon_name obj icon_name
  method icon_name = GtkButton.get_icon_name obj

  method set_can_shrink can_shrink = GtkButton.set_can_shrink obj can_shrink
  method can_shrink = GtkButton.get_can_shrink obj

  method set_child child = GtkButton.set_child obj child
  method child = GtkButton.get_child obj
end

class button obj = object
  inherit button_skel obj
end

let button ?label ?use_mnemonic ?icon_name ?has_frame ?packing ?show () =
  let btn =
    match label, use_mnemonic with
    | Some l, Some true -> GtkButton.new_with_mnemonic l
    | Some l, _ -> GtkButton.new_with_label l
    | None, _ when icon_name <> None ->
        GtkButton.new_from_icon_name (Option.get icon_name)
    | None, _ -> GtkButton.new_ ()
  in
  let widget = new button btn in
  Option.iter (fun f -> widget#set_has_frame f) has_frame;
  Option.iter (fun p -> p (widget :> widget)) packing;
  if show = Some true then widget#show;
  widget

(** {2 Check Button} *)

class check_button_skel (obj : Check_button.t) = object
  inherit widget_impl (Check_button.as_widget obj)
  method as_widget = Check_button.as_widget obj

  method set_active active = GtkCheckButton.set_active obj active
  method active = GtkCheckButton.get_active obj

  method set_label label = GtkCheckButton.set_label obj label
  method label = GtkCheckButton.get_label obj

  method set_use_underline use_underline = GtkCheckButton.set_use_underline obj use_underline
  method use_underline = GtkCheckButton.get_use_underline obj

  method set_inconsistent inconsistent = GtkCheckButton.set_inconsistent obj inconsistent
  method inconsistent = GtkCheckButton.get_inconsistent obj

  method set_group group =
    let mapped = Option.map (fun (g : check_button) -> (Obj.magic g : Check_button.t)) group in
    GtkCheckButton.set_group obj mapped
end

and check_button (obj : Check_button.t) = object
  inherit check_button_skel obj
end

let check_button ?label ?use_mnemonic ?active ?group ?packing ?show () =
  let btn =
    match label, use_mnemonic with
    | Some l, Some true -> GtkCheckButton.new_with_mnemonic (Some l)
    | Some l, _ -> GtkCheckButton.new_with_label (Some l)
    | None, _ -> GtkCheckButton.new_ ()
  in
  let widget = new check_button btn in
  Option.iter (fun a -> widget#set_active a) active;
  Option.iter (fun g -> widget#set_group (Some g)) group;
  Option.iter (fun p -> p (widget :> widget)) packing;
  if show = Some true then widget#show;
  widget

(** Radio button is implemented using check_button with grouping in GTK4 *)
let radio_button ?label ?use_mnemonic ?group ?packing ?show () =
  check_button ?label ?use_mnemonic ?group ?packing ?show ()

(** {2 Toggle Button} *)

class toggle_button_skel (obj : Toggle_button.t) = object
  (* ToggleButton is a subclass of Button; we downcast for shared helpers. *)
  val btn = (Obj.magic obj : Button.t)
  inherit widget_impl (Toggle_button.as_widget obj)

  method connect = new button_signals btn

  method set_label label = GtkButton.set_label btn label
  method label = GtkButton.get_label btn

  method set_has_frame has_frame = GtkButton.set_has_frame btn has_frame
  method has_frame = GtkButton.get_has_frame btn

  method set_use_underline use_underline = GtkButton.set_use_underline btn use_underline
  method use_underline = GtkButton.get_use_underline btn

  method set_icon_name icon_name = GtkButton.set_icon_name btn icon_name
  method icon_name = GtkButton.get_icon_name btn

  method set_can_shrink can_shrink = GtkButton.set_can_shrink btn can_shrink
  method can_shrink = GtkButton.get_can_shrink btn

  method set_child child = GtkButton.set_child btn child
  method child = GtkButton.get_child btn

  method set_active active = GtkToggleButton.set_active obj active
  method active = GtkToggleButton.get_active obj

  method toggled () = GtkToggleButton.toggled obj
end

class toggle_button (obj : Toggle_button.t) = object
  inherit toggle_button_skel obj
end

let toggle_button ?label ?use_mnemonic ?active ?packing ?show () =
  let btn =
    match label, use_mnemonic with
    | Some l, Some true -> GtkToggleButton.new_with_mnemonic l
    | Some l, _ -> GtkToggleButton.new_with_label l
    | None, _ -> GtkToggleButton.new_ ()
  in
  let widget = new toggle_button btn in
  Option.iter (fun a -> widget#set_active a) active;
  Option.iter (fun p -> p (widget :> widget)) packing;
  if show = Some true then widget#show;
  widget
