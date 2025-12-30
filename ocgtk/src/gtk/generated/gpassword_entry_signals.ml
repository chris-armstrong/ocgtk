(* Signal handlers for PasswordEntry *)
class password_entry_signals (obj : Password_entry.t) = object
  (** Emitted when the entry is activated.

The keybindings for this signal are all forms of the Enter key. *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
