(* GENERATED CODE - DO NOT EDIT *)
(* DragSurface: DragSurface *)

type t = [ `drag_surface ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t = "ml_gdk_drag_surface_from_gobject"

(* Methods *)

external present : t -> int -> int -> bool = "ml_gdk_drag_surface_present"
(** Present @drag_surface. *)

let on_compute_size ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let size =
          let v = Gobject.Closure.nth argv ~pos:1 in
          (Gobject.Value.get_boxed v : Drag_surface_size.t)
        in
        callback ~size)
  in
  Gobject.Signal.connect obj ~name:"compute-size" ~callback:closure
    ~after:(Option.value after ~default:false)
