(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: GestureSingle *)

type t = [`gesture_single | `gesture | `event_controller | `object_] Gobject.obj

let as_event_controller (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t = Obj.magic obj

(* Methods *)
(** Sets whether to handle only touch events.

If @touch_only is %TRUE, @gesture will only handle events of type
%GDK_TOUCH_BEGIN, %GDK_TOUCH_UPDATE or %GDK_TOUCH_END. If %FALSE,
mouse events will be handled too. *)
external set_touch_only : t -> bool -> unit = "ml_gtk_gesture_single_set_touch_only"

(** Sets whether @gesture is exclusive.

An exclusive gesture will only handle pointer and "pointer emulated"
touch events, so at any given time, there is only one sequence able
to interact with those. *)
external set_exclusive : t -> bool -> unit = "ml_gtk_gesture_single_set_exclusive"

(** Sets the button number @gesture listens to.

If non-0, every button press from a different button
number will be ignored. Touch events implicitly match
with button 1. *)
external set_button : t -> int -> unit = "ml_gtk_gesture_single_set_button"

(** Returns %TRUE if the gesture is only triggered by touch events. *)
external get_touch_only : t -> bool = "ml_gtk_gesture_single_get_touch_only"

(** Gets whether a gesture is exclusive.

For more information, see [method@Gtk.GestureSingle.set_exclusive]. *)
external get_exclusive : t -> bool = "ml_gtk_gesture_single_get_exclusive"

(** Returns the button number currently interacting
with @gesture, or 0 if there is none. *)
external get_current_button : t -> int = "ml_gtk_gesture_single_get_current_button"

(** Returns the button number @gesture listens for.

If this is 0, the gesture reacts to any button press. *)
external get_button : t -> int = "ml_gtk_gesture_single_get_button"

(* Properties *)

