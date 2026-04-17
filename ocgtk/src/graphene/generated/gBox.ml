(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Box from cyclic group Box_and__sphere *)

class type box_t = GBox_and__sphere.box_t

class box = GBox_and__sphere.box
let alloc () : box_t =
  new box (Box_and__sphere.Box.alloc ())

