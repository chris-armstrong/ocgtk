(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Sphere from cyclic group Box_and__sphere *)

(** A sphere, represented by its center and radius.

    Its methods, signals and properties are on {!class-type-sphere_t}. The
    functions it is built on are in {!Ocgraphene.Raw.Sphere}. *)

class type sphere_t = Box_and__sphere.sphere_t
(** The methods, signals and properties of a [graphene_sphere_t]. *)

class sphere : Raw.Sphere.t -> sphere_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Sphere.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_sphere_t], give one already wrapped. *)

val alloc : unit -> sphere_t
