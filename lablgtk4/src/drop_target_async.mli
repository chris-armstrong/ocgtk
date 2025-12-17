(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: DropTargetAsync *)

type t = [`drop_target_async | `event_controller | `object_] Gobject.obj

val as_event_controller : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t

(** Create a new DropTargetAsync *)
external new_ : unit -> Gdk.dragaction -> t = "ml_gtk_drop_target_async_new"

(* Properties *)

(** Sets the actions that this drop target supports. *)
external set_actions : t -> Gdk.dragaction -> unit = "ml_gtk_drop_target_async_set_actions"

(** Gets the actions that this drop target supports. *)
external get_actions : t -> Gdk.dragaction = "ml_gtk_drop_target_async_get_actions"

