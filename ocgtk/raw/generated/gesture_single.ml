(* GENERATED CODE - DO NOT EDIT *)
(* GestureSingle: GestureSingle *)

(** A [GtkGesture] subclass optimized for singe-touch and mouse gestures.

    Under interaction, these gestures stick to the first interacting sequence,
    which is accessible through
    {{!Ocgtk.Raw.Gesture_single.val-get_current_sequence}[Gtk.GestureSingle.get_current_sequence]}
    while the gesture is being interacted with.

    By default gestures react to both
    {{!Ocgdk.Constants.button_primary}[GDK_BUTTON_PRIMARY]} and touch events.
    {{!Ocgtk.Raw.Gesture_single.val-set_touch_only}[Gtk.GestureSingle.set_touch_only]}
    can be used to change the touch behavior. Callers may also specify a
    different mouse button number to interact with through
    {{!Ocgtk.Raw.Gesture_single.val-set_button}[Gtk.GestureSingle.set_button]},
    or react to any mouse button by setting it to 0. While the gesture is
    active, the button being currently pressed can be known through
    {{!Ocgtk.Raw.Gesture_single.val-get_current_button}[Gtk.GestureSingle.get_current_button]}.

    The class built on this module is in {!Ocgtk.Gesture_single}. *)

type t =
  [ `gesture_single | `gesture | `event_controller | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_gesture_single_get_type"

(* Methods *)

external set_touch_only : t -> bool -> unit
  = "ml_gtk_gesture_single_set_touch_only"
(** Sets whether to handle only touch events.

    If [touch_only] is [true], [gesture] will only handle events of type
    [GDK_TOUCH_BEGIN], [GDK_TOUCH_UPDATE] or [GDK_TOUCH_END]. If [false], mouse
    events will be handled too. *)

external set_exclusive : t -> bool -> unit
  = "ml_gtk_gesture_single_set_exclusive"
[@@ocaml.doc
  "Sets whether [gesture] is exclusive.\n\n\
   An exclusive gesture will only handle pointer and \"pointer emulated\"\n\
   touch events, so at any given time, there is only one sequence able\n\
   to interact with those."]

external set_button : t -> int -> unit = "ml_gtk_gesture_single_set_button"
(** Sets the button number [gesture] listens to.

    If non-0, every button press from a different button number will be ignored.
    Touch events implicitly match with button 1. *)

external get_touch_only : t -> bool = "ml_gtk_gesture_single_get_touch_only"
(** Returns [true] if the gesture is only triggered by touch events. *)

external get_exclusive : t -> bool = "ml_gtk_gesture_single_get_exclusive"
(** Gets whether a gesture is exclusive.

    For more information, see
    {{!Ocgtk.Raw.Gesture_single.val-set_exclusive}[Gtk.GestureSingle.set_exclusive]}.
*)

external get_current_sequence : t -> Ocgdk_raw.Event_sequence.t option
  = "ml_gtk_gesture_single_get_current_sequence"
(** Returns the event sequence currently interacting with [gesture].

    This is only meaningful if
    {{!Ocgtk.Raw.Gesture.val-is_active}[Gtk.Gesture.is_active]} returns [true].
*)

external get_current_button : t -> int
  = "ml_gtk_gesture_single_get_current_button"
(** Returns the button number currently interacting with [gesture], or 0 if
    there is none. *)

external get_button : t -> int = "ml_gtk_gesture_single_get_button"
(** Returns the button number [gesture] listens for.

    If this is 0, the gesture reacts to any button press. *)

(* Properties *)
