(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: DropTarget *)

type t = [`drop_target | `event_controller | `object_] Gobject.obj

let as_event_controller (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t = Obj.magic obj

(* Methods *)
(** Sets whether data should be preloaded on hover. *)
external set_preload : t -> bool -> unit = "ml_gtk_drop_target_set_preload"

(** Rejects the ongoing drop operation.

If no drop operation is ongoing, i.e when [property@Gtk.DropTarget:current-drop]
is %NULL, this function does nothing.

This function should be used when delaying the decision
on whether to accept a drag or not until after reading
the data. *)
external reject : t -> unit = "ml_gtk_drop_target_reject"

(** Gets whether data should be preloaded on hover. *)
external get_preload : t -> bool = "ml_gtk_drop_target_get_preload"

(* Properties *)

