(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Plane from cyclic group Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle *)

class type plane_t =
  Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.plane_t

class plane =
  Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.plane

let alloc () : plane_t = new plane (Raw.Plane.alloc ())
