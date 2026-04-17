(* GENERATED CODE - DO NOT EDIT *)
(* DragSurfaceSize: DragSurfaceSize *)

(** The `GdkDragSurfaceSize` struct contains information that is useful
to compute the size of a drag surface. *)
type t = [`drag_surface_size] Gobject.obj

(* Methods *)
(** Sets the size the drag surface prefers to be resized to. *)
external set_size : t -> int -> int -> unit = "ml_gdk_drag_surface_size_set_size"

