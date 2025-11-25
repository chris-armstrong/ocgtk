(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: GesturePan *)

type t = EventController.t

(** Create a new GesturePan *)
external new_ : Gtk_enums.orientation -> t = "ml_gtk_gesture_pan_new"

(* Properties *)

(** Sets the orientation to be expected on pan gestures. *)
external set_orientation : t -> Gtk_enums.orientation -> unit = "ml_gtk_gesture_pan_set_orientation"

(** Returns the orientation of the pan gestures that this @gesture expects. *)
external get_orientation : t -> Gtk_enums.orientation = "ml_gtk_gesture_pan_get_orientation"

