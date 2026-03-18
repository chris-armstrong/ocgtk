(* High-level class for PadController *)
class pad_controller (obj : Pad_controller.t) = object (self)

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

