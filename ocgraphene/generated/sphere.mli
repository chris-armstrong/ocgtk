(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Sphere from cyclic group Box_and__sphere *)

(** A sphere, represented by its center and radius.

    Its methods, signals and properties are on {!class-type-sphere_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgraphene.Raw.Sphere}. *)

class type sphere_t = Box_and__sphere.sphere_t
(** The methods, signals and properties of a [Sphere]. *)

class sphere : Raw.Sphere.t -> sphere_t
(** Wraps a raw handle of {!Ocgraphene.Raw.Sphere.t}. *)

(** {2:constructors Constructors} *)

val alloc : unit -> sphere_t
(** Allocates a new #graphene_sphere_t.

    The contents of the newly allocated structure are undefined. *)
