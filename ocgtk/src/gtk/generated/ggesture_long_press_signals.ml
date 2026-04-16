(* Signal handlers for GestureLongPress *)
class gesture_long_press_signals (obj : Gesture_long_press.t) =
  object
    method on_cancelled ~callback =
      Gobject.Signal.connect_simple obj ~name:"cancelled" ~callback ~after:false
    (** Emitted whenever a press moved too far, or was released before
        [signal@Gtk.GestureLongPress::pressed] happened. *)
  end
