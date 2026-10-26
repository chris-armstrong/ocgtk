(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Ray from cyclic group Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle *)

class type ray_t =
  GEuler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.ray_t

class ray =
  GEuler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.ray

let alloc () : ray_t =
  new ray
    (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray
     .alloc ())
