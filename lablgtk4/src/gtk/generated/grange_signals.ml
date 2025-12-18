(* Signal handlers for Range *)
class range_signals (obj : Range.t) = object
  method on_adjust_bounds ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"adjust-bounds" ~callback ~after:false

  method on_change_value ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"change-value" ~callback ~after:false

  method on_move_slider ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"move-slider" ~callback ~after:false

  method on_value_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"value-changed" ~callback ~after:false

end
