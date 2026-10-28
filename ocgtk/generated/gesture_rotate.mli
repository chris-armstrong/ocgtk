(** Recognizes 2-finger rotation gestures.

    Its methods, signals and properties are on {!class-type-gesture_rotate_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Gesture_rotate}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [GestureRotate].}

    Recognizes 2-finger rotation gestures.

    Whenever the angle between both handled sequences changes, the
    [Gtk.GestureRotate::angle-changed] signal is emitted. *)
class type gesture_rotate_t = object
  inherit Gesture.gesture_t

  (** {2:signals Signals} *)

  method on_angle_changed :
    ?after:bool ->
    callback:(angle:float -> angle_delta:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the angle between both tracked points changes. *)

  (** {2:methods Methods} *)

  method get_angle_delta : unit -> float
  (** Gets the angle delta in radians.

      If [gesture] is active, this function returns the angle difference in
      radians since the gesture was first recognized. If [gesture] is not
      active, 0 is returned. *)

  (** {2:conversions Conversions} *)

  method as_gesture_rotate : Raw.Gesture_rotate.t
end

class gesture_rotate : Raw.Gesture_rotate.t -> gesture_rotate_t
(** Wraps a raw handle of {!Ocgtk.Raw.Gesture_rotate.t}. *)

(** {1:description Description}

    Recognizes 2-finger rotation gestures.

    Whenever the angle between both handled sequences changes, the
    [Gtk.GestureRotate::angle-changed] signal is emitted. *)

(** {1:constructors Constructors} *)

val new_ : unit -> gesture_rotate_t
(** Returns a newly created [GtkGesture] that recognizes 2-touch rotation
    gestures. *)
