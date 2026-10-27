(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Vec3 from cyclic group Vec3_and__vec4 *)

(** A structure capable of holding a vector with three dimensions: x, y, and z.

    The contents of the #graphene_vec3_t structure are private and should never
    be accessed directly.

    Its methods, signals and properties are on {!class-type-vec3_t}. The
    functions it is built on are in {!Ocgraphene.Raw.Vec3}. *)

class type vec3_t = Vec3_and__vec4.vec3_t
(** The methods, signals and properties of a [graphene_vec3_t]. *)

class vec3 : Raw.Vec3.t -> vec3_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Vec3.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_vec3_t], give one already wrapped. *)

val alloc : unit -> vec3_t
