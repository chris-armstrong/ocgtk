(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Euler from cyclic group Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle *)

(** Describe a rotation using Euler angles.

    Its methods, signals and properties are on {!class-type-euler_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgraphene.Raw.Euler}. *)

(** {1:class Class} *)

class type euler_t =
  Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.euler_t
(** {b The methods, signals and properties of a [Euler].}

    Describe a rotation using Euler angles.

    The contents of the #graphene_euler_t structure are private and should never
    be accessed directly. *)

class euler : Raw.Euler.t -> euler_t
(** Wraps a raw handle of {!Ocgraphene.Raw.Euler.t}. *)

(** {1:description Description}

    Describe a rotation using Euler angles.

    The contents of the #graphene_euler_t structure are private and should never
    be accessed directly. *)

(** {1:constructors Constructors} *)

val alloc : unit -> euler_t
(** Allocates a new #graphene_euler_t.

    The contents of the returned structure are undefined. *)
