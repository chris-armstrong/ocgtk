(* GENERATED CODE - DO NOT EDIT *)
(* DragSurfaceSize: DragSurfaceSize *)

(** Contains information that is useful to compute the size of a drag surface.
*)

type t = [ `drag_surface_size ] Gobject.obj

(* Methods *)

external set_size : t -> int -> int -> unit
  = "ml_gdk_drag_surface_size_set_size"
(** Sets the size the drag surface prefers to be resized to. *)

external get_type : unit -> Gobject.Type.t = "ml_gdk_drag_surface_size_get_type"
