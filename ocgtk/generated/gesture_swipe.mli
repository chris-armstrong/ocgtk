(** Recognizes swipe gestures.

    Its methods, signals and properties are on {!class-type-gesture_swipe_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Gesture_swipe}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [GestureSwipe].}

    Recognizes swipe gestures.

    After a press/move/.../move/release sequence happens, the
    [Gtk.GestureSwipe::swipe] signal will be emitted, providing the velocity and
    directionality of the sequence at the time it was lifted.

    If the velocity is desired in intermediate points,
    [Gtk.GestureSwipe.get_velocity] can be called in a [Gtk.Gesture::update]
    handler.

    All velocities are reported in pixels/sec units. *)
class type gesture_swipe_t = object
  inherit Gesture_single.gesture_single_t

  (** {2:signals Signals} *)

  method on_swipe :
    ?after:bool ->
    callback:(velocity_x:float -> velocity_y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the recognized gesture is finished.

      Velocity and direction are a product of previously recorded events. *)

  (** {2:conversions Conversions} *)

  method as_gesture_swipe : Raw.Gesture_swipe.t
end

class gesture_swipe : Raw.Gesture_swipe.t -> gesture_swipe_t
(** Wraps a raw handle of {!Ocgtk.Raw.Gesture_swipe.t}. *)

(** {1:description Description}

    Recognizes swipe gestures.

    After a press/move/.../move/release sequence happens, the
    [Gtk.GestureSwipe::swipe] signal will be emitted, providing the velocity and
    directionality of the sequence at the time it was lifted.

    If the velocity is desired in intermediate points,
    [Gtk.GestureSwipe.get_velocity] can be called in a [Gtk.Gesture::update]
    handler.

    All velocities are reported in pixels/sec units. *)

(** {1:constructors Constructors} *)

val new_ : unit -> gesture_swipe_t
(** Returns a newly created [GtkGesture] that recognizes swipes. *)
