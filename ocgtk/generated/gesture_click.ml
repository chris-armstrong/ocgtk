class type gesture_click_t = object
  inherit Gesture_single.gesture_single_t

  (** {2:signals Signals} *)

  method on_pressed :
    ?after:bool ->
    callback:(n_press:int -> x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever a button or touch press happens. *)

  method on_released :
    ?after:bool ->
    callback:(n_press:int -> x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a button or touch is released.

      [n_press] will report the number of press that is paired to this event,
      note that [Gtk.GestureClick::stopped] may have been emitted between the
      press and its release, [n_press] will only start over at the next press.
  *)

  method on_stopped :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted whenever any time/distance threshold has been exceeded. *)

  (** {2:conversions Conversions} *)

  method as_gesture_click : Raw.Gesture_click.t
end

(* High-level class for GestureClick *)
class gesture_click (obj : Raw.Gesture_click.t) : gesture_click_t =
  object (self)
    inherit Gesture_single.gesture_single (obj :> Raw.Gesture_single.t)

    method on_pressed ?(after = false) ~callback () =
      Raw.Gesture_click.on_pressed ~after self#as_gesture_click ~callback

    method on_released ?(after = false) ~callback () =
      Raw.Gesture_click.on_released ~after self#as_gesture_click ~callback

    method on_stopped ?(after = false) ~callback () =
      Raw.Gesture_click.on_stopped ~after self#as_gesture_click ~callback

    method as_gesture_click = obj
  end

let new_ () : gesture_click_t = new gesture_click (Raw.Gesture_click.new_ ())
