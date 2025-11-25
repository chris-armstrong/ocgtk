(* GENERATED CODE - DO NOT EDIT *)
(* Widget: DropTarget *)

type t = Gtk.widget

(** Create a new DropTarget *)
external new_ : unit -> Gdk.dragaction -> t = "ml_gtk_drop_target_new"

(* Properties *)

(** Sets whether data should be preloaded on hover. *)
external set_preload : t -> bool -> unit = "ml_gtk_drop_target_set_preload"

(** Sets the actions that this drop target supports. *)
external set_actions : t -> Gdk.dragaction -> unit = "ml_gtk_drop_target_set_actions"

(** Rejects the ongoing drop operation.

If no drop operation is ongoing, i.e when [property@Gtk.DropTarget:current-drop]
is %NULL, this function does nothing.

This function should be used when delaying the decision
on whether to accept a drag or not until after reading
the data. *)
external reject : t -> unit = "ml_gtk_drop_target_reject"

(** Gets whether data should be preloaded on hover. *)
external get_preload : t -> bool = "ml_gtk_drop_target_get_preload"

(** Gets the actions that this drop target supports. *)
external get_actions : t -> Gdk.dragaction = "ml_gtk_drop_target_get_actions"

