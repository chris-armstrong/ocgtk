(* GENERATED CODE - DO NOT EDIT *)
(* DragSurface: DragSurface *)

type t = [ `drag_surface ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t = "ml_gdk_drag_surface_from_gobject"

(* Methods *)

external present : t -> int -> int -> bool = "ml_gdk_drag_surface_present"
(** Present @drag_surface. *)

val on_compute_size :
  ?after:bool ->
  t ->
  callback:(size:Drag_surface_size.t -> unit) ->
  Gobject.Signal.handler_id
