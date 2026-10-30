(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Triangle from cyclic group Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle *)

(** A triangle.

    Its methods, signals and properties are on {!class-type-triangle_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgraphene.Raw.Triangle}. *)

(** {1:class Class} *)

class type triangle_t =
  Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.triangle_t
(** {b The methods, signals and properties of a [Triangle].}

    A triangle. *)

class triangle : Raw.Triangle.t -> triangle_t
(** Wraps a raw handle of {!Ocgraphene.Raw.Triangle.t}. *)

(** {1:constructors Constructors} *)

val alloc : unit -> triangle_t
(** Allocates a new #graphene_triangle_t.

    The contents of the returned structure are undefined. *)
