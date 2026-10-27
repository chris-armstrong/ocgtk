(** Recognizes drag gestures.

    The drag operation itself can be tracked throughout the
    [Gtk.GestureDrag::drag-begin], [Gtk.GestureDrag::drag-update] and
    [Gtk.GestureDrag::drag-end] signals, and the relevant coordinates can be
    extracted through [Gtk.GestureDrag.get_offset] and
    [Gtk.GestureDrag.get_start_point].

    Its methods, signals and properties are on {!class-type-gesture_drag_t}. The
    functions it is built on are in {!Ocgtk.Raw.Gesture_drag}. *)

(** The methods, signals and properties of a [GtkGestureDrag]. *)
class type gesture_drag_t = object
  inherit Gesture_single.gesture_single_t

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

  method as_gesture_drag : Raw.Gesture_drag.t
end

class gesture_drag : Raw.Gesture_drag.t -> gesture_drag_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Gesture_drag.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkGestureDrag], give one already wrapped. *)

val new_ : unit -> gesture_drag_t
