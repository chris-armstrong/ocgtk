(* Signal handlers for Entry *)
class entry_signals (obj : Entry.t) = object
  (** Emitted when the entry is activated.

The keybindings for this signal are all forms of the Enter key. *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
