(* GENERATED CODE - DO NOT EDIT *)
(* Widget: DragSource *)

type t = Gtk.widget

(** Create a new DragSource *)
external new_ : unit -> t = "ml_gtk_drag_source_new"

(* Properties *)

(** Sets the actions on the `GtkDragSource`.

During a DND operation, the actions are offered to potential
drop targets. If @actions include %GDK_ACTION_MOVE, you need
to listen to the [signal@Gtk.DragSource::drag-end] signal and
handle @delete_data being %TRUE.

This function can be called before a drag is started,
or in a handler for the [signal@Gtk.DragSource::prepare] signal. *)
external set_actions : t -> Gdk.dragaction -> unit = "ml_gtk_drag_source_set_actions"

(** Gets the actions that are currently set on the `GtkDragSource`. *)
external get_actions : t -> Gdk.dragaction = "ml_gtk_drag_source_get_actions"

(** Cancels a currently ongoing drag operation. *)
external drag_cancel : t -> unit = "ml_gtk_drag_source_drag_cancel"

