(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: GesturePan *)

type t = [`gesture_pan | `gesture_drag | `gesture_single | `gesture | `event_controller | `object_] Gobject.obj

let as_event_controller (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t = Obj.magic obj

(** Create a new GesturePan *)
external new_ : Gtk_enums.orientation -> t = "ml_gtk_gesture_pan_new"

(* Properties *)

(** Sets the orientation to be expected on pan gestures. *)
external set_orientation : t -> Gtk_enums.orientation -> unit = "ml_gtk_gesture_pan_set_orientation"

(** Returns the orientation of the pan gestures that this @gesture expects. *)
external get_orientation : t -> Gtk_enums.orientation = "ml_gtk_gesture_pan_get_orientation"

