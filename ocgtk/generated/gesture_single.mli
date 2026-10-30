(** A [GtkGesture] subclass optimized for singe-touch and mouse gestures.

    Its methods, signals and properties are on {!class-type-gesture_single_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Gesture_single}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [GestureSingle].}

    Inherits from: {{!Ocgtk.Gesture.class-type-gesture_t}Ocgtk.Gesture}

    A [GtkGesture] subclass optimized for singe-touch and mouse gestures.

    Under interaction, these gestures stick to the first interacting sequence,
    which is accessible through
    {{!Ocgtk.Gesture_single.class-type-gesture_single_t.method-get_current_sequence}
     [Gtk.GestureSingle.get_current_sequence]} while the gesture is being
    interacted with.

    By default gestures react to both
    {{!Ocgdk.Constants.button_primary}[GDK_BUTTON_PRIMARY]} and touch events.
    {{!Ocgtk.Gesture_single.class-type-gesture_single_t.method-set_touch_only}[Gtk.GestureSingle.set_touch_only]}
    can be used to change the touch behavior. Callers may also specify a
    different mouse button number to interact with through
    {{!Ocgtk.Gesture_single.class-type-gesture_single_t.method-set_button}[Gtk.GestureSingle.set_button]},
    or react to any mouse button by setting it to 0. While the gesture is
    active, the button being currently pressed can be known through
    {{!Ocgtk.Gesture_single.class-type-gesture_single_t.method-get_current_button}
     [Gtk.GestureSingle.get_current_button]}. *)
class type gesture_single_t = object
  inherit Gesture.gesture_t

  (** {2:methods Methods} *)

  method get_button : unit -> int
  (** Returns the button number [gesture] listens for.

      If this is 0, the gesture reacts to any button press. *)

  method get_current_button : unit -> int
  (** Returns the button number currently interacting with [gesture], or 0 if
      there is none. *)

  method get_current_sequence :
    unit -> Ocgdk.Event_sequence.event_sequence_t option
  (** Returns the event sequence currently interacting with [gesture].

      This is only meaningful if [Gtk.Gesture.is_active] returns [true]. *)

  method get_exclusive : unit -> bool
  (** Gets whether a gesture is exclusive.

      For more information, see [Gtk.GestureSingle.set_exclusive]. *)

  method get_touch_only : unit -> bool
  (** Returns [true] if the gesture is only triggered by touch events. *)

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

      If [touch_only] is [true], [gesture] will only handle events of type
      [GDK_TOUCH_BEGIN], [GDK_TOUCH_UPDATE] or [GDK_TOUCH_END]. If [false],
      mouse events will be handled too. *)

  (** {2:conversions Conversions} *)

  method as_gesture_single : Raw.Gesture_single.t
end

class gesture_single : Raw.Gesture_single.t -> gesture_single_t
(** Wraps a raw handle of {!Ocgtk.Raw.Gesture_single.t}. *)

(** {1:description Description}

    A [GtkGesture] subclass optimized for singe-touch and mouse gestures.

    Under interaction, these gestures stick to the first interacting sequence,
    which is accessible through
    {{!Ocgtk.Gesture_single.class-type-gesture_single_t.method-get_current_sequence}
     [Gtk.GestureSingle.get_current_sequence]} while the gesture is being
    interacted with.

    By default gestures react to both
    {{!Ocgdk.Constants.button_primary}[GDK_BUTTON_PRIMARY]} and touch events.
    {{!Ocgtk.Gesture_single.class-type-gesture_single_t.method-set_touch_only}[Gtk.GestureSingle.set_touch_only]}
    can be used to change the touch behavior. Callers may also specify a
    different mouse button number to interact with through
    {{!Ocgtk.Gesture_single.class-type-gesture_single_t.method-set_button}[Gtk.GestureSingle.set_button]},
    or react to any mouse button by setting it to 0. While the gesture is
    active, the button being currently pressed can be known through
    {{!Ocgtk.Gesture_single.class-type-gesture_single_t.method-get_current_button}
     [Gtk.GestureSingle.get_current_button]}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
