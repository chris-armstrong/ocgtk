class type gesture_rotate_t = object
  inherit Gesture.gesture_t

  method on_angle_changed :
    ?after:bool ->
    callback:(angle:float -> angle_delta:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_angle_delta : unit -> float
  (** Gets the angle delta in radians.

      If [gesture] is active, this function returns the angle difference in
      radians since the gesture was first recognized. If [gesture] is not
      active, 0 is returned. *)

  method as_gesture_rotate : Raw.Gesture_rotate.t
end

(* High-level class for GestureRotate *)
class gesture_rotate (obj : Raw.Gesture_rotate.t) : gesture_rotate_t =
  object (self)
    inherit Gesture.gesture (obj :> Raw.Gesture.t)

    method on_angle_changed ?(after = false) ~callback () =
      Raw.Gesture_rotate.on_angle_changed ~after self#as_gesture_rotate
        ~callback

    method get_angle_delta : unit -> float =
      fun () -> Raw.Gesture_rotate.get_angle_delta obj

    method as_gesture_rotate = obj
  end

let new_ () : gesture_rotate_t = new gesture_rotate (Raw.Gesture_rotate.new_ ())
