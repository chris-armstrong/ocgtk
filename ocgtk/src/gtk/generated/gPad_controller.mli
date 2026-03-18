class pad_controller : Pad_controller.t ->
  object
    method set_action : Gtk_enums.padactiontype -> int -> int -> string -> string -> unit
    method set_action_entries : Pad_action_entry.t array -> int -> unit
    method action_group : Ocgtk_gio.Gio.action_group
    method pad : Ocgtk_gdk.Gdk.device
    method as_pad_controller : Pad_controller.t
  end

