(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Sphere from cyclic group Box_and__sphere *)

class type sphere_t = Box_and__sphere.sphere_t

class sphere = Box_and__sphere.sphere

let alloc () : sphere_t = new sphere (Raw.Sphere.alloc ())
