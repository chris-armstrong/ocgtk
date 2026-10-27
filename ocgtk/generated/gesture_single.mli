(** A [GtkGesture] subclass optimized for singe-touch and mouse gestures.

    Under interaction, these gestures stick to the first interacting sequence,
    which is accessible through [Gtk.GestureSingle.get_current_sequence] while
    the gesture is being interacted with.

    By default gestures react to both [GDK_BUTTON_PRIMARY] and touch events.
    [Gtk.GestureSingle.set_touch_only] can be used to change the touch behavior.
    Callers may also specify a different mouse button number to interact with
    through [Gtk.GestureSingle.set_button], or react to any mouse button by
    setting it to 0. While the gesture is active, the button being currently
    pressed can be known through [Gtk.GestureSingle.get_current_button].

    Its methods, signals and properties are on {!class-type-gesture_single_t}.
    The functions it is built on are in {!Ocgtk.Raw.Gesture_single}. *)

(** The methods, signals and properties of a [GtkGestureSingle]. *)
class type gesture_single_t = object
  inherit Gesture.gesture_t
  method get_button : unit -> int
  method get_current_button : unit -> int

  method get_current_sequence :
    unit -> Ocgdk.Event_sequence.event_sequence_t option

  method get_exclusive : unit -> bool
  method get_touch_only : unit -> bool
  method set_button : int -> unit
  method set_exclusive : bool -> unit
  method set_touch_only : bool -> unit
  method as_gesture_single : Raw.Gesture_single.t
end

class gesture_single : Raw.Gesture_single.t -> gesture_single_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Gesture_single.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkGestureSingle], give one already wrapped. *)
