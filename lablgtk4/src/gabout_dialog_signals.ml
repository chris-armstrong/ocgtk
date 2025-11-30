(* Signal handlers for AboutDialog *)
class about_dialog_signals (obj : About_dialog.t) = object
  method activate_link ~callback =
    Gobject.Signal.connect_simple (About_dialog.as_widget obj :> [`widget] Gobject.obj) ~name:"activate-link" ~callback ~after:false

end
