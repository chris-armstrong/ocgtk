(* Signal handlers for GestureLongPress *)
class gesture_long_press_signals (obj : Gesture_long_press.t) = object
  (** Emitted whenever a press moved too far, or was released
before [signal@Gtk.GestureLongPress::pressed] happened. *)
  method on_cancelled ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"cancelled" ~callback ~after:false

end
