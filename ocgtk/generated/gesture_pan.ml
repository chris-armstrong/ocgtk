class type gesture_pan_t = object
  inherit Gesture_drag.gesture_drag_t

  method on_pan :
    ?after:bool ->
    callback:(direction:Enums.pandirection -> offset:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_orientation : unit -> Enums.orientation
  (** Returns the orientation of the pan gestures that this [gesture] expects.
  *)

  method set_orientation : Enums.orientation -> unit
  (** Sets the orientation to be expected on pan gestures. *)

  method as_gesture_pan : Raw.Gesture_pan.t
end

(* High-level class for GesturePan *)
class gesture_pan (obj : Raw.Gesture_pan.t) : gesture_pan_t =
  object (self)
    inherit Gesture_drag.gesture_drag (obj :> Raw.Gesture_drag.t)

    method on_pan ?(after = false) ~callback () =
      Raw.Gesture_pan.on_pan ~after self#as_gesture_pan ~callback

    method get_orientation : unit -> Enums.orientation =
      fun () -> Raw.Gesture_pan.get_orientation obj

    method set_orientation : Enums.orientation -> unit =
      fun orientation -> Raw.Gesture_pan.set_orientation obj orientation

    method as_gesture_pan = obj
  end

let new_ (orientation : Enums.orientation) : gesture_pan_t =
  let obj_ = Raw.Gesture_pan.new_ orientation in
  new gesture_pan obj_
