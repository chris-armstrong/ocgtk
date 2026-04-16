(* Signal handlers for Switch *)
class switch_signals (obj : Switch.t) =
  object
    method on_activate ~callback =
      Gobject.Signal.connect_simple obj ~name:"activate" ~callback ~after:false
    (** Emitted to animate the switch.

        Applications should never connect to this signal, but use the
        [property@Gtk.Switch:active] property. *)
  end
