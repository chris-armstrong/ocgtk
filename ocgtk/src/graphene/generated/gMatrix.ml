(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Matrix from cyclic group Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle *)

class type matrix_t = GEuler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.matrix_t

class matrix = GEuler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.matrix

let alloc () : matrix_t =
  new matrix
    (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.alloc ())
