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

(* High-level class for GestureSingle *)
class gesture_single (obj : Raw.Gesture_single.t) : gesture_single_t =
  object (self)
    inherit Gesture.gesture (obj :> Raw.Gesture.t)

    method get_button : unit -> int =
      fun () -> Raw.Gesture_single.get_button obj

    method get_current_button : unit -> int =
      fun () -> Raw.Gesture_single.get_current_button obj

    method get_current_sequence :
        unit -> Ocgdk.Event_sequence.event_sequence_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Event_sequence.event_sequence ret)
          (Raw.Gesture_single.get_current_sequence obj)

    method get_exclusive : unit -> bool =
      fun () -> Raw.Gesture_single.get_exclusive obj

    method get_touch_only : unit -> bool =
      fun () -> Raw.Gesture_single.get_touch_only obj

    method set_button : int -> unit =
      fun button -> Raw.Gesture_single.set_button obj button

    method set_exclusive : bool -> unit =
      fun exclusive -> Raw.Gesture_single.set_exclusive obj exclusive

    method set_touch_only : bool -> unit =
      fun touch_only -> Raw.Gesture_single.set_touch_only obj touch_only

    method as_gesture_single = obj
  end
