(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Ray from cyclic group Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle *)

(** A ray emitted from an origin in a given direction.

    The contents of the [graphene_ray_t] structure are private, and should not
    be modified directly.

    Its methods, signals and properties are on {!class-type-ray_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgraphene.Raw.Ray}. *)

class type ray_t =
  Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.ray_t
(** {b The methods, signals and properties of a [Ray].}

    A ray emitted from an origin in a given direction.

    The contents of the [graphene_ray_t] structure are private, and should not
    be modified directly. *)

class ray : Raw.Ray.t -> ray_t
(** Wraps a raw handle of {!Ocgraphene.Raw.Ray.t}. *)

(** {2:constructors Constructors} *)

val alloc : unit -> ray_t
(** Allocates a new #graphene_ray_t structure.

    The contents of the returned structure are undefined. *)
