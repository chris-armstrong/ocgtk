(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Ray from cyclic group Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle *)

(** A ray emitted from an origin in a given direction.

    The contents of the [graphene_ray_t] structure are private, and should not
    be modified directly.

    Its methods, signals and properties are on {!class-type-ray_t}. The
    functions it is built on are in {!Ocgraphene.Raw.Ray}. *)

class type ray_t =
  Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.ray_t
(** The methods, signals and properties of a [graphene_ray_t]. *)

class ray : Raw.Ray.t -> ray_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Ray.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_ray_t], give one already wrapped. *)

val alloc : unit -> ray_t
