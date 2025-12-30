(* Signal handlers for Range *)
class range_signals (obj : Range.t) = object
  (** Emitted when the range value changes. *)
  method on_value_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"value-changed" ~callback ~after:false

end
