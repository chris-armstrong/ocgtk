(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Vec4 from cyclic group Vec3_and__vec4 *)

(** A structure capable of holding a vector with four dimensions: x, y, z, and
    w.

    The contents of the #graphene_vec4_t structure are private and should never
    be accessed directly.

    Its methods, signals and properties are on {!class-type-vec4_t}. The
    functions it is built on are in {!Ocgraphene.Raw.Vec4}. *)

class type vec4_t = Vec3_and__vec4.vec4_t
(** The methods, signals and properties of a [graphene_vec4_t]. *)

class vec4 : Raw.Vec4.t -> vec4_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Vec4.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_vec4_t], give one already wrapped. *)

val alloc : unit -> vec4_t
