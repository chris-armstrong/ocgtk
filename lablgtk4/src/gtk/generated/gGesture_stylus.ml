(* Signal class defined in ggesture_stylus_signals.ml *)

(* High-level class for GestureStylus *)
class gesture_stylus (obj : Gesture_stylus.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Gesture_stylus.as_event_controller obj)
  inherit Ggesture_stylus_signals.gesture_stylus_signals obj

  method stylus_only = Gesture_stylus.get_stylus_only obj
  method set_stylus_only v = Gesture_stylus.set_stylus_only obj v

  method as_event_controller = (Gesture_stylus.as_event_controller obj)
    method as_gesture_stylus = obj
end

