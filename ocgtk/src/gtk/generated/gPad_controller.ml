(* High-level class for PadController *)
class pad_controller (obj : Pad_controller.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Pad_controller.as_event_controller obj)

  method set_action : Gtk_enums.padactiontype -> int -> int -> string -> string -> unit =
    fun type_ index mode label action_name ->
      (Pad_controller.set_action obj type_ index mode label action_name)

  method set_action_entries : Pad_action_entry.t array -> int -> unit =
    fun entries n_entries ->
      (Pad_controller.set_action_entries obj entries n_entries)

  method as_event_controller = (Pad_controller.as_event_controller obj)
    method as_pad_controller = obj
end

