(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Triangle from cyclic group Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle *)

class type triangle_t =
  Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.triangle_t

class triangle =
  Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.triangle

let alloc () : triangle_t = new triangle (Raw.Triangle.alloc ())
