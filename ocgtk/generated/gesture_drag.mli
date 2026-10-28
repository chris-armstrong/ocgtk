(** Recognizes drag gestures.

    Its methods, signals and properties are on {!class-type-gesture_drag_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Gesture_drag}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [GestureDrag].}

    Inherits from:
    {{!Ocgtk.Gesture_single.class-type-gesture_single_t}Ocgtk.Gesture_single}

    Recognizes drag gestures.

    The drag operation itself can be tracked throughout the
    [Gtk.GestureDrag::drag-begin], [Gtk.GestureDrag::drag-update] and
    [Gtk.GestureDrag::drag-end] signals, and the relevant coordinates can be
    extracted through [Gtk.GestureDrag.get_offset] and
    [Gtk.GestureDrag.get_start_point]. *)
class type gesture_drag_t = object
  inherit Gesture_single.gesture_single_t

  (** {2:signals Signals} *)

  method on_drag_begin :
    ?after:bool ->
    callback:(start_x:float -> start_y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever dragging starts. *)

  method on_drag_end :
    ?after:bool ->
    callback:(offset_x:float -> offset_y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever the dragging is finished. *)

  method on_drag_update :
    ?after:bool ->
    callback:(offset_x:float -> offset_y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever the dragging point moves. *)

  (** {2:conversions Conversions} *)

  method as_gesture_drag : Raw.Gesture_drag.t
end

class gesture_drag : Raw.Gesture_drag.t -> gesture_drag_t
(** Wraps a raw handle of {!Ocgtk.Raw.Gesture_drag.t}. *)

(** {1:description Description}

    Recognizes drag gestures.

    The drag operation itself can be tracked throughout the
    [Gtk.GestureDrag::drag-begin], [Gtk.GestureDrag::drag-update] and
    [Gtk.GestureDrag::drag-end] signals, and the relevant coordinates can be
    extracted through [Gtk.GestureDrag.get_offset] and
    [Gtk.GestureDrag.get_start_point]. *)

(** {1:constructors Constructors} *)

val new_ : unit -> gesture_drag_t
(** Returns a newly created [GtkGesture] that recognizes drags. *)
