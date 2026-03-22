class type pad_controller_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller_t
    method set_action : Gtk_enums.padactiontype -> int -> int -> string -> string -> unit
    method set_action_entries : Pad_action_entry.t array -> int -> unit
    method action_group : Ocgtk_gio.Gio.action_group_t
    method pad : Ocgtk_gdk.Gdk.device_t
    method as_pad_controller : Pad_controller.t
end

class pad_controller : Pad_controller.t -> pad_controller_t

