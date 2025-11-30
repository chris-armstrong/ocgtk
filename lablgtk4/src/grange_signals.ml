(* Signal handlers for Range *)
class range_signals (obj : Range.t) = object
  method adjust_bounds ~callback =
    Gobject.Signal.connect_simple (Range.as_widget obj :> [`widget] Gobject.obj) ~name:"adjust-bounds" ~callback ~after:false

  method change_value ~callback =
    Gobject.Signal.connect_simple (Range.as_widget obj :> [`widget] Gobject.obj) ~name:"change-value" ~callback ~after:false

  method move_slider ~callback =
    Gobject.Signal.connect_simple (Range.as_widget obj :> [`widget] Gobject.obj) ~name:"move-slider" ~callback ~after:false

  method value_changed ~callback =
    Gobject.Signal.connect_simple (Range.as_widget obj :> [`widget] Gobject.obj) ~name:"value-changed" ~callback ~after:false

end
