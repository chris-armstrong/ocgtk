(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Matrix from cyclic group Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle *)

(** A structure capable of holding a 4x4 matrix.

    The contents of the #graphene_matrix_t structure are private and should
    never be accessed directly.

    Its methods, signals and properties are on {!class-type-matrix_t}. The
    functions it is built on are in {!Ocgraphene.Raw.Matrix}. *)

class type matrix_t =
  Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.matrix_t
(** The methods, signals and properties of a [graphene_matrix_t]. *)

class matrix : Raw.Matrix.t -> matrix_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Matrix.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_matrix_t], give one already wrapped. *)

val alloc : unit -> matrix_t
