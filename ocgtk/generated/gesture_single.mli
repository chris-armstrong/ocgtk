class type gesture_single_t = object
  inherit Gesture.gesture_t
  method get_button : unit -> int
  method get_current_button : unit -> int

  method get_current_sequence :
    unit -> Ocgdk.Event_sequence.event_sequence_t option

  method get_exclusive : unit -> bool
  method get_touch_only : unit -> bool
  method set_button : int -> unit
  method set_exclusive : bool -> unit
  method set_touch_only : bool -> unit
  method as_gesture_single : Raw.Gesture_single.t
end

class gesture_single : Raw.Gesture_single.t -> gesture_single_t
