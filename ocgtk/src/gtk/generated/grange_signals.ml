(* Signal handlers for Range *)
class range_signals (obj : Range.t) =
  object
    method on_value_changed ~callback =
      Gobject.Signal.connect_simple obj ~name:"value-changed" ~callback
        ~after:false
    (** Emitted when the range value changes. *)
  end
