(* Signal handlers for PasswordEntry *)
class password_entry_signals (obj : Password_entry.t) =
  object
    method on_activate ~callback =
      Gobject.Signal.connect_simple obj ~name:"activate" ~callback ~after:false
    (** Emitted when the entry is activated.

        The keybindings for this signal are all forms of the Enter key. *)
  end
