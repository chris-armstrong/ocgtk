(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Box from cyclic group Box_and__sphere *)

class type box_t = Box_and__sphere.box_t

class box : Raw.Box.t -> box_t

val alloc : unit -> box_t
