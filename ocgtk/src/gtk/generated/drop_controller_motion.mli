(* GENERATED CODE - DO NOT EDIT *)
(* DropControllerMotion: DropControllerMotion *)

type t = [`drop_controller_motion | `event_controller | `object_] Gobject.obj

(** Create a new DropControllerMotion *)
external new_ : unit -> t = "ml_gtk_drop_controller_motion_new"

(* Methods *)
(** Returns if a Drag-and-Drop operation is within the widget
@self, not one of its children. *)
external is_pointer : t -> bool = "ml_gtk_drop_controller_motion_is_pointer"

(** Returns the `GdkDrop` of a current Drag-and-Drop operation
over the widget of @self. *)
external get_drop : t -> Ocgtk_gdk.Gdk.Wrappers.Drop.t option = "ml_gtk_drop_controller_motion_get_drop"

(** Returns if a Drag-and-Drop operation is within the widget
@self or one of its children. *)
external contains_pointer : t -> bool = "ml_gtk_drop_controller_motion_contains_pointer"

(* Properties *)

