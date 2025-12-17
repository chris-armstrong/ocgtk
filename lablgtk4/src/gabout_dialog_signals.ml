(* Signal handlers for AboutDialog *)
class about_dialog_signals (obj : About_dialog.t) = object
  method on_activate_link ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate-link" ~callback ~after:false

end
