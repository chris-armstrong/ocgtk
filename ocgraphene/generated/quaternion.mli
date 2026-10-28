(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Quaternion from cyclic group Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle *)

(** A quaternion.

    Its methods, signals and properties are on {!class-type-quaternion_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgraphene.Raw.Quaternion}. *)

(** {1:class Class} *)

class type quaternion_t =
  Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle
  .quaternion_t
(** {b The methods, signals and properties of a [Quaternion].}

    A quaternion.

    The contents of the #graphene_quaternion_t structure are private and should
    never be accessed directly. *)

class quaternion : Raw.Quaternion.t -> quaternion_t
(** Wraps a raw handle of {!Ocgraphene.Raw.Quaternion.t}. *)

(** {1:description Description}

    A quaternion.

    The contents of the #graphene_quaternion_t structure are private and should
    never be accessed directly. *)

(** {1:constructors Constructors} *)

val alloc : unit -> quaternion_t
(** Allocates a new #graphene_quaternion_t.

    The contents of the returned value are undefined. *)
