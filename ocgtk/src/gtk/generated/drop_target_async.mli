(* GENERATED CODE - DO NOT EDIT *)
(* DropTargetAsync: DropTargetAsync *)

type t = [`drop_target_async | `event_controller | `object_] Gobject.obj

(** Create a new DropTargetAsync *)
external new_ : Ocgtk_gdk.Gdk.Wrappers.Content_formats.t option -> Ocgtk_gdk.Gdk.dragaction -> t = "ml_gtk_drop_target_async_new"

(* Methods *)
(** Sets the data formats that this drop target will accept. *)
external set_formats : t -> Ocgtk_gdk.Gdk.Wrappers.Content_formats.t option -> unit = "ml_gtk_drop_target_async_set_formats"

(** Sets the actions that this drop target supports. *)
external set_actions : t -> Ocgtk_gdk.Gdk.dragaction -> unit = "ml_gtk_drop_target_async_set_actions"

(** Sets the @drop as not accepted on this drag site.

This function should be used when delaying the decision
on whether to accept a drag or not until after reading
the data. *)
external reject_drop : t -> Ocgtk_gdk.Gdk.Wrappers.Drop.t -> unit = "ml_gtk_drop_target_async_reject_drop"

(** Gets the data formats that this drop target accepts.

If the result is %NULL, all formats are expected to be supported. *)
external get_formats : t -> Ocgtk_gdk.Gdk.Wrappers.Content_formats.t option = "ml_gtk_drop_target_async_get_formats"

(** Gets the actions that this drop target supports. *)
external get_actions : t -> Ocgtk_gdk.Gdk.dragaction = "ml_gtk_drop_target_async_get_actions"

(* Properties *)

