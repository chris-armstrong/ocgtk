(* Signal handlers for PasswordEntry *)
class password_entry_signals (obj : Password_entry.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Password_entry.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
