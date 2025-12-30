(* Signal handlers for Adjustment *)
class adjustment_signals (obj : Adjustment.t) = object
  (** Emitted when one or more of the `GtkAdjustment` properties have been
changed.

Note that the [property@Gtk.Adjustment:value] property is
covered by the [signal@Gtk.Adjustment::value-changed] signal. *)
  method on_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"changed" ~callback ~after:false

  (** Emitted when the value has been changed. *)
  method on_value_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"value-changed" ~callback ~after:false

end
