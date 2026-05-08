class type gesture_pan_t = object
  inherit GGesture_drag.gesture_drag_t

  method on_pan :
    callback:(direction:Gtk_enums.pandirection -> offset:float -> unit) ->
    Gobject.Signal.handler_id

  method get_orientation : unit -> Gtk_enums.orientation
  method set_orientation : Gtk_enums.orientation -> unit
  method as_gesture_pan : Gesture_pan.t
end

(* High-level class for GesturePan *)
class gesture_pan (obj : Gesture_pan.t) : gesture_pan_t =
  object (self)
    inherit GGesture_drag.gesture_drag (obj :> Gesture_drag.t)
    method on_pan ~callback = Gesture_pan.on_pan self#as_gesture_pan ~callback

    method get_orientation : unit -> Gtk_enums.orientation =
      fun () -> Gesture_pan.get_orientation obj

    method set_orientation : Gtk_enums.orientation -> unit =
      fun orientation -> Gesture_pan.set_orientation obj orientation

    method as_gesture_pan = obj
  end

let new_ (orientation : Gtk_enums.orientation) : gesture_pan_t =
  let obj_ = Gesture_pan.new_ orientation in
  new gesture_pan obj_
