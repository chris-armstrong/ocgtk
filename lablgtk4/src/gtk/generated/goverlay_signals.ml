(* Signal handlers for Overlay *)
class overlay_signals (obj : Overlay.t) = object
  method on_get_child_position ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"get-child-position" ~callback ~after:false

end
