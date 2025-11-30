(* Signal handlers for Overlay *)
class overlay_signals (obj : Overlay.t) = object
  method get_child_position ~callback =
    Gobject.Signal.connect_simple (Overlay.as_widget obj :> [`widget] Gobject.obj) ~name:"get-child-position" ~callback ~after:false

end
