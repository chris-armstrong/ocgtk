(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Matrix from cyclic group Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle *)

(** A structure capable of holding a 4x4 matrix.

    Its methods, signals and properties are on {!class-type-matrix_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgraphene.Raw.Matrix}. *)

(** {1:class Class} *)

class type matrix_t =
  Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.matrix_t
(** {b The methods, signals and properties of a [Matrix].}

    A structure capable of holding a 4x4 matrix.

    The contents of the #graphene_matrix_t structure are private and should
    never be accessed directly. *)

class matrix : Raw.Matrix.t -> matrix_t
(** Wraps a raw handle of {!Ocgraphene.Raw.Matrix.t}. *)

(** {1:description Description}

    A structure capable of holding a 4x4 matrix.

    The contents of the #graphene_matrix_t structure are private and should
    never be accessed directly. *)

(** {1:constructors Constructors} *)

val alloc : unit -> matrix_t
(** Allocates a new #graphene_matrix_t. *)
