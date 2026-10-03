(* GENERATED CODE - DO NOT EDIT *)
(* DragSurface: DragSurface *)

(** A surface that is used during DND. *)

type t = [ `drag_surface ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t = "ml_gdk_drag_surface_from_gobject"

(* Methods *)

external present : t -> int -> int -> bool = "ml_gdk_drag_surface_present"
(** Present [drag_surface]. *)
