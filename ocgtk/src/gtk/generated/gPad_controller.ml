class type pad_controller_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller_t
    method set_action : Gtk_enums.padactiontype -> int -> int -> string -> string -> unit
    method set_action_entries : Pad_action_entry.t array -> int -> unit
    method action_group : Ocgtk_gio.Gio.action_group_t
    method pad : Ocgtk_gdk.Gdk.device_t
    method as_pad_controller : Pad_controller.t
end

(* High-level class for PadController *)
class pad_controller (obj : Pad_controller.t) : pad_controller_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t)

  method set_action : Gtk_enums.padactiontype -> int -> int -> string -> string -> unit =
    fun type_ index mode label action_name ->
      (Pad_controller.set_action obj type_ index mode label action_name)

  method set_action_entries : Pad_action_entry.t array -> int -> unit =
    fun entries n_entries ->
      (Pad_controller.set_action_entries obj entries n_entries)

  method action_group = new Ocgtk_gio.Gio.action_group (Pad_controller.get_action_group obj)

  method pad = new Ocgtk_gdk.Gdk.device (Pad_controller.get_pad obj)

    method as_pad_controller = obj
end

