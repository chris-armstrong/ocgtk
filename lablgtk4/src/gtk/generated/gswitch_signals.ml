(* Signal handlers for Switch *)
class switch_signals (obj : Switch.t) = object
  (** Emitted to animate the switch.

Applications should never connect to this signal,
but use the [property@Gtk.Switch:active] property. *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
