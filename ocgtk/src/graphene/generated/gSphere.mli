(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Sphere from cyclic group Box_and__sphere *)

class type sphere_t = GBox_and__sphere.sphere_t

class sphere : Box_and__sphere.Sphere.t -> sphere_t
val alloc : unit -> sphere_t

