(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: DropControllerMotion *)

type t = [`drop_controller_motion | `event_controller | `object_] Gobject.obj

let as_event_controller (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t = Obj.magic obj

(** Create a new DropControllerMotion *)
external new_ : unit -> t = "ml_gtk_drop_controller_motion_new"

(* Methods *)
(** Returns if a Drag-and-Drop operation is within the widget
@self, not one of its children. *)
external is_pointer : t -> bool = "ml_gtk_drop_controller_motion_is_pointer"

(** Returns if a Drag-and-Drop operation is within the widget
@self or one of its children. *)
external contains_pointer : t -> bool = "ml_gtk_drop_controller_motion_contains_pointer"

(* Properties *)

