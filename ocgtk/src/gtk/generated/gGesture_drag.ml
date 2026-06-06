class type gesture_drag_t = object
  inherit GGesture_single.gesture_single_t

  method on_drag_begin :
    ?after:bool ->
    callback:(start_x:float -> start_y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drag_end :
    ?after:bool ->
    callback:(offset_x:float -> offset_y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drag_update :
    ?after:bool ->
    callback:(offset_x:float -> offset_y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method as_gesture_drag : Gesture_drag.t
end

(* High-level class for GestureDrag *)
class gesture_drag (obj : Gesture_drag.t) : gesture_drag_t =
  object (self)
    inherit GGesture_single.gesture_single (obj :> Gesture_single.t)

    method on_drag_begin ?(after = false) ~callback () =
      Gesture_drag.on_drag_begin ~after self#as_gesture_drag ~callback

    method on_drag_end ?(after = false) ~callback () =
      Gesture_drag.on_drag_end ~after self#as_gesture_drag ~callback

    method on_drag_update ?(after = false) ~callback () =
      Gesture_drag.on_drag_update ~after self#as_gesture_drag ~callback

    method as_gesture_drag = obj
  end

let new_ () : gesture_drag_t = new gesture_drag (Gesture_drag.new_ ())
