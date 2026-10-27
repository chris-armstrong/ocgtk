(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Quaternion from cyclic group Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle *)

(** A quaternion.

    The contents of the #graphene_quaternion_t structure are private and should
    never be accessed directly.

    Its methods, signals and properties are on {!class-type-quaternion_t}. The
    functions it is built on are in {!Ocgraphene.Raw.Quaternion}. *)

class type quaternion_t =
  Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle
  .quaternion_t
(** The methods, signals and properties of a [graphene_quaternion_t]. *)

class quaternion : Raw.Quaternion.t -> quaternion_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Quaternion.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [graphene_quaternion_t], give one already wrapped. *)

val alloc : unit -> quaternion_t
