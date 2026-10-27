(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Triangle from cyclic group Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle *)

(** A triangle.

    Its methods, signals and properties are on {!class-type-triangle_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgraphene.Raw.Triangle}. *)

class type triangle_t =
  Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.triangle_t
(** The methods, signals and properties of a [graphene_triangle_t]. *)

class triangle : Raw.Triangle.t -> triangle_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Triangle.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_triangle_t], give one already wrapped. *)

(** {2:constructors Constructors} *)

val alloc : unit -> triangle_t
(** Allocates a new #graphene_triangle_t.

    The contents of the returned structure are undefined. *)
