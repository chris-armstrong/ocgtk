(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Vec4 from cyclic group Vec3_and__vec4 *)

(** A structure capable of holding a vector with four dimensions: x, y, z, and
    w.

    The contents of the #graphene_vec4_t structure are private and should never
    be accessed directly.

    Its methods, signals and properties are on {!class-type-vec4_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgraphene.Raw.Vec4}. *)

class type vec4_t = Vec3_and__vec4.vec4_t
(** {b The methods, signals and properties of a [Vec4].}

    A structure capable of holding a vector with four dimensions: x, y, z, and
    w.

    The contents of the #graphene_vec4_t structure are private and should never
    be accessed directly. *)

class vec4 : Raw.Vec4.t -> vec4_t
(** Wraps a raw handle of {!Ocgraphene.Raw.Vec4.t}. *)

(** {2:constructors Constructors} *)

val alloc : unit -> vec4_t
(** Allocates a new #graphene_vec4_t structure.

    The contents of the returned structure are undefined.

    Use graphene_vec4_init() to initialize the vector. *)
