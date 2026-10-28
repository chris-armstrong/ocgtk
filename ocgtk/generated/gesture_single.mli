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

(** The methods, signals and properties of a [GestureSingle]. *)
class type gesture_single_t = object
  inherit Gesture.gesture_t

  method get_button : unit -> int
  (** Returns the button number [gesture] listens for.

      If this is 0, the gesture reacts to any button press. *)

  method get_current_button : unit -> int
  (** Returns the button number currently interacting with [gesture], or 0 if
      there is none. *)

  method get_current_sequence :
    unit -> Ocgdk.Event_sequence.event_sequence_t option
  (** Returns the event sequence currently interacting with [gesture].

      This is only meaningful if [Gtk.Gesture.is_active] returns [TRUE]. *)

  method get_exclusive : unit -> bool
  (** Gets whether a gesture is exclusive.

      For more information, see [Gtk.GestureSingle.set_exclusive]. *)

  method get_touch_only : unit -> bool
  (** Returns [TRUE] if the gesture is only triggered by touch events. *)

  method set_button : int -> unit
  (** Sets the button number [gesture] listens to.

      If non-0, every button press from a different button number will be
      ignored. Touch events implicitly match with button 1. *)

  method set_exclusive : bool -> unit
  [@@ocaml.doc
    "Sets whether [gesture] is exclusive.\n\n\
     An exclusive gesture will only handle pointer and \"pointer emulated\"\n\
     touch events, so at any given time, there is only one sequence able\n\
     to interact with those."]

  method set_touch_only : bool -> unit
  (** Sets whether to handle only touch events.

      If [touch_only] is [TRUE], [gesture] will only handle events of type
      [GDK_TOUCH_BEGIN], [GDK_TOUCH_UPDATE] or [GDK_TOUCH_END]. If [FALSE],
      mouse events will be handled too. *)

  method as_gesture_single : Raw.Gesture_single.t
end

class gesture_single : Raw.Gesture_single.t -> gesture_single_t
(** Wraps a raw handle of {!Ocgtk.Raw.Gesture_single.t}. *)
