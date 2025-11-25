(* GENERATED CODE - DO NOT EDIT *)
(* Widget: DropControllerMotion *)

type t = Gtk.widget

(** Create a new DropControllerMotion *)
external new_ : unit -> t = "ml_gtk_drop_controller_motion_new"

(* Properties *)

(** Returns if a Drag-and-Drop operation is within the widget
@self, not one of its children. *)
external is_pointer : t -> bool = "ml_gtk_drop_controller_motion_is_pointer"

(** Returns if a Drag-and-Drop operation is within the widget
@self or one of its children. *)
external contains_pointer : t -> bool = "ml_gtk_drop_controller_motion_contains_pointer"

