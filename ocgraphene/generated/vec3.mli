(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Vec3 from cyclic group Vec3_and__vec4 *)

(** A structure capable of holding a vector with three dimensions: x, y, and z.

    Its methods, signals and properties are on {!class-type-vec3_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgraphene.Raw.Vec3}. *)

(** {1:class Class} *)

class type vec3_t = Vec3_and__vec4.vec3_t
(** {b The methods, signals and properties of a [Vec3].}

    A structure capable of holding a vector with three dimensions: x, y, and z.

    The contents of the #graphene_vec3_t structure are private and should never
    be accessed directly. *)

class vec3 : Raw.Vec3.t -> vec3_t
(** Wraps a raw handle of {!Ocgraphene.Raw.Vec3.t}. *)

(** {1:description Description}

    A structure capable of holding a vector with three dimensions: x, y, and z.

    The contents of the #graphene_vec3_t structure are private and should never
    be accessed directly. *)

(** {1:constructors Constructors} *)

val alloc : unit -> vec3_t
(** Allocates a new #graphene_vec3_t structure.

    The contents of the returned structure are undefined.

    Use graphene_vec3_init() to initialize the vector. *)
