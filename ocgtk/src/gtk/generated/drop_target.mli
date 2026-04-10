(* GENERATED CODE - DO NOT EDIT *)
(* DropTarget: DropTarget *)

type t = [`drop_target | `event_controller | `object_] Gobject.obj

(** Create a new DropTarget *)
external new_ : int -> Ocgtk_gdk.Gdk.dragaction -> t = "ml_gtk_drop_target_new"

(* Methods *)
(** Sets whether data should be preloaded on hover. *)
external set_preload : t -> bool -> unit = "ml_gtk_drop_target_set_preload"

(** Sets the supported `GType`s for this drop target. *)
external set_gtypes : t -> int array option -> int -> unit = "ml_gtk_drop_target_set_gtypes"

(** Sets the actions that this drop target supports. *)
external set_actions : t -> Ocgtk_gdk.Gdk.dragaction -> unit = "ml_gtk_drop_target_set_actions"

(** Rejects the ongoing drop operation.

If no drop operation is ongoing, i.e when [property@Gtk.DropTarget:current-drop]
is %NULL, this function does nothing.

This function should be used when delaying the decision
on whether to accept a drag or not until after reading
the data. *)
external reject : t -> unit = "ml_gtk_drop_target_reject"

(** Gets whether data should be preloaded on hover. *)
external get_preload : t -> bool = "ml_gtk_drop_target_get_preload"

(** Gets the list of supported `GType`s that can be dropped on the target.

If no types have been set, `NULL` will be returned. *)
external get_gtypes : t -> int array option * int = "ml_gtk_drop_target_get_gtypes"

(** Gets the data formats that this drop target accepts.

If the result is %NULL, all formats are expected to be supported. *)
external get_formats : t -> Ocgtk_gdk.Gdk.Wrappers.Content_formats.t option = "ml_gtk_drop_target_get_formats"

(** Gets the currently handled drop operation.

If no drop operation is going on, %NULL is returned. *)
external get_drop : t -> Ocgtk_gdk.Gdk.Wrappers.Drop.t option = "ml_gtk_drop_target_get_drop"

(** Gets the currently handled drop operation.

If no drop operation is going on, %NULL is returned. *)
external get_current_drop : t -> Ocgtk_gdk.Gdk.Wrappers.Drop.t option = "ml_gtk_drop_target_get_current_drop"

(** Gets the actions that this drop target supports. *)
external get_actions : t -> Ocgtk_gdk.Gdk.dragaction = "ml_gtk_drop_target_get_actions"

(* Properties *)

