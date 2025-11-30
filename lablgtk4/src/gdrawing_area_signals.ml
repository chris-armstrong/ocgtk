(* Signal handlers for DrawingArea *)
class drawing_area_signals (obj : Drawing_area.t) = object
  method resize ~callback =
    Gobject.Signal.connect_simple (Drawing_area.as_widget obj :> [`widget] Gobject.obj) ~name:"resize" ~callback ~after:false

end
