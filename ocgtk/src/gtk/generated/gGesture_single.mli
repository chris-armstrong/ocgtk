class gesture_single : Gesture_single.t ->
  object
    method get_button : unit -> int
    method get_current_button : unit -> int
    method get_current_sequence : unit -> Ocgtk_gdk.Gdk.event_sequence option
    method get_exclusive : unit -> bool
    method get_touch_only : unit -> bool
    method set_button : int -> unit
    method set_exclusive : bool -> unit
    method set_touch_only : bool -> unit
    method as_gesture_single : Gesture_single.t
  end

