(* GENERATED CODE - DO NOT EDIT *)
(* Widget: DropTargetAsync *)

type t = Gtk.widget

(** Create a new DropTargetAsync *)
external new_ : unit -> Gdk.dragaction -> t = "ml_gtk_drop_target_async_new"

(* Properties *)

(** Sets the actions that this drop target supports. *)
external set_actions : t -> Gdk.dragaction -> unit = "ml_gtk_drop_target_async_set_actions"

(** Gets the actions that this drop target supports. *)
external get_actions : t -> Gdk.dragaction = "ml_gtk_drop_target_async_get_actions"

