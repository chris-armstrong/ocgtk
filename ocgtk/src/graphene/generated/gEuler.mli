(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Euler from cyclic group Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle *)

class type euler_t =
  GEuler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.euler_t

class euler :
  Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t ->
  euler_t

val alloc : unit -> euler_t
