(** Recognizes 2-finger rotation gestures.

    Whenever the angle between both handled sequences changes, the
    [Gtk.GestureRotate::angle-changed] signal is emitted.

    Its methods, signals and properties are on {!class-type-gesture_rotate_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Gesture_rotate}. *)

(** The methods, signals and properties of a [GestureRotate]. *)
class type gesture_rotate_t = object
  inherit Gesture.gesture_t

  method on_angle_changed :
    ?after:bool ->
    callback:(angle:float -> angle_delta:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the angle between both tracked points changes. *)

  method get_angle_delta : unit -> float
  (** Gets the angle delta in radians.

      If [gesture] is active, this function returns the angle difference in
      radians since the gesture was first recognized. If [gesture] is not
      active, 0 is returned. *)

  method as_gesture_rotate : Raw.Gesture_rotate.t
end

class gesture_rotate : Raw.Gesture_rotate.t -> gesture_rotate_t
(** Wraps a raw handle of {!Ocgtk.Raw.Gesture_rotate.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> gesture_rotate_t
(** Returns a newly created [GtkGesture] that recognizes 2-touch rotation
    gestures. *)
