(* GENERATED CODE - DO NOT EDIT *)
(* DragSurfaceSize: DragSurfaceSize *)

(** Contains information that is useful to compute the size of a drag surface.

    The class built on this module is in {!Ocgdk.Drag_surface_size}. *)

type t = [ `drag_surface_size ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gdk_drag_surface_size_get_type"

(* Methods *)

external set_size : t -> int -> int -> unit
  = "ml_gdk_drag_surface_size_set_size"
(** Sets the size the drag surface prefers to be resized to. *)
