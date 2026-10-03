(* GENERATED CODE - DO NOT EDIT *)
(* GestureSwipe: GestureSwipe *)

type t =
  [ `gesture_swipe | `gesture_single | `gesture | `event_controller | `object_ ]
  Gobject.obj
(** Recognizes swipe gestures.

    After a press/move/.../move/release sequence happens, the
    [Gtk.GestureSwipe::swipe] signal will be emitted, providing the velocity and
    directionality of the sequence at the time it was lifted.

    If the velocity is desired in intermediate points,
    [Gtk.GestureSwipe.get_velocity] can be called in a [Gtk.Gesture::update]
    handler.

    All velocities are reported in pixels/sec units. *)

external new_ : unit -> t = "ml_gtk_gesture_swipe_new"
(** Create a new GestureSwipe *)

(* Methods *)

external get_velocity : t -> bool * float * float
  = "ml_gtk_gesture_swipe_get_velocity"
(** Gets the current velocity.

    If the gesture is recognized, this function returns [TRUE] and fills in
    [velocity_x] and [velocity_y] with the recorded velocity, as per the last
    events processed. *)

val on_swipe :
  ?after:bool ->
  t ->
  callback:(velocity_x:float -> velocity_y:float -> unit) ->
  Gobject.Signal.handler_id
