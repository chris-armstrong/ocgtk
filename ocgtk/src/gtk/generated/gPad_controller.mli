class pad_controller : Pad_controller.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    method set_action : Gtk_enums.padactiontype -> int -> int -> string -> string -> unit
    method set_action_entries : Pad_action_entry.t array -> int -> unit
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_pad_controller : Pad_controller.t
  end

