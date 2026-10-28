(** Recognizes 2-finger pinch/zoom gestures.

    Its methods, signals and properties are on {!class-type-gesture_zoom_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Gesture_zoom}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [GestureZoom].}

    Recognizes 2-finger pinch/zoom gestures.

    Whenever the distance between both tracked sequences changes, the
    [Gtk.GestureZoom::scale-changed] signal is emitted to report the scale
    factor. *)
class type gesture_zoom_t = object
  inherit Gesture.gesture_t

  (** {2:signals Signals} *)

  method on_scale_changed :
    ?after:bool ->
    callback:(scale:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever the distance between both tracked sequences changes. *)

  (** {2:methods Methods} *)

  method get_scale_delta : unit -> float
  (** Gets the scale delta.

      If [gesture] is active, this function returns the zooming difference since
      the gesture was recognized (hence the starting point is considered 1:1).
      If [gesture] is not active, 1 is returned. *)

  (** {2:conversions Conversions} *)

  method as_gesture_zoom : Raw.Gesture_zoom.t
end

class gesture_zoom : Raw.Gesture_zoom.t -> gesture_zoom_t
(** Wraps a raw handle of {!Ocgtk.Raw.Gesture_zoom.t}. *)

(** {1:description Description}

    Recognizes 2-finger pinch/zoom gestures.

    Whenever the distance between both tracked sequences changes, the
    [Gtk.GestureZoom::scale-changed] signal is emitted to report the scale
    factor. *)

(** {1:constructors Constructors} *)

val new_ : unit -> gesture_zoom_t
(** Returns a newly created [GtkGesture] that recognizes pinch/zoom gestures. *)
