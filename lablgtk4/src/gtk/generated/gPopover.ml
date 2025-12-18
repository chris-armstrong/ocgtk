(* Signal class defined in gpopover_signals.ml *)

(* High-level class for Popover *)
class popover (obj : Popover.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Popover.as_widget obj)
  inherit Gpopover_signals.popover_signals obj

  method autohide = Popover.get_autohide obj
  method set_autohide v = Popover.set_autohide obj v

  method cascade_popdown = Popover.get_cascade_popdown obj
  method set_cascade_popdown v = Popover.set_cascade_popdown obj v

  method has_arrow = Popover.get_has_arrow obj
  method set_has_arrow v = Popover.set_has_arrow obj v

  method mnemonics_visible = Popover.get_mnemonics_visible obj
  method set_mnemonics_visible v = Popover.set_mnemonics_visible obj v

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Popover.get_child obj )

  method get_position : unit -> Gtk_enums.positiontype = fun () -> (Popover.get_position obj )

  method popdown : unit -> unit = fun () -> (Popover.popdown obj )

  method popup : unit -> unit = fun () -> (Popover.popup obj )

  method present : unit -> unit = fun () -> (Popover.present obj )

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Popover.set_child obj child)

  method set_default_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun widget ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Popover.set_default_widget obj widget)

  method set_offset : int -> int -> unit = fun x_offset y_offset -> (Popover.set_offset obj x_offset y_offset)

  method set_position : Gtk_enums.positiontype -> unit = fun position -> (Popover.set_position obj position)

  method as_widget = (Popover.as_widget obj)
    method as_popover = obj
end

