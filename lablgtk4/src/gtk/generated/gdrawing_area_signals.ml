(* Signal handlers for DrawingArea *)
class drawing_area_signals (obj : Drawing_area.t) = object
  method on_resize ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"resize" ~callback ~after:false

end
