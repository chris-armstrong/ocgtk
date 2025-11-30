(* Signal handlers for Label *)
class label_signals (obj : Label.t) = object
  method activate_current_link ~callback =
    Gobject.Signal.connect_simple (Label.as_widget obj :> [`widget] Gobject.obj) ~name:"activate-current-link" ~callback ~after:false

  method activate_link ~callback =
    Gobject.Signal.connect_simple (Label.as_widget obj :> [`widget] Gobject.obj) ~name:"activate-link" ~callback ~after:false

  method copy_clipboard ~callback =
    Gobject.Signal.connect_simple (Label.as_widget obj :> [`widget] Gobject.obj) ~name:"copy-clipboard" ~callback ~after:false

  method move_cursor ~callback =
    Gobject.Signal.connect_simple (Label.as_widget obj :> [`widget] Gobject.obj) ~name:"move-cursor" ~callback ~after:false

end
