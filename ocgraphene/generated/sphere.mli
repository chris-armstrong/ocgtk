(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Sphere from cyclic group Box_and__sphere *)

class type sphere_t = Box_and__sphere.sphere_t

class sphere : Raw.Sphere.t -> sphere_t

val alloc : unit -> sphere_t
