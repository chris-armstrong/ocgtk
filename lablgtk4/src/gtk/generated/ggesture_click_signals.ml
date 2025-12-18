(* Signal handlers for GestureClick *)
class gesture_click_signals (obj : Gesture_click.t) = object
  (** Emitted whenever any time/distance threshold has been exceeded. *)
  method on_stopped ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"stopped" ~callback ~after:false

end
