(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Box from cyclic group Box_and__sphere *)

(** A 3D box, described as the volume between a minimum and a maximum vertices.

    Its methods, signals and properties are on {!class-type-box_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgraphene.Raw.Box}. *)

class type box_t = Box_and__sphere.box_t
(** The methods, signals and properties of a [graphene_box_t]. *)

class box : Raw.Box.t -> box_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Box.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_box_t], give one already wrapped. *)

(** {2:constructors Constructors} *)

val alloc : unit -> box_t
(** Allocates a new #graphene_box_t.

    The contents of the returned structure are undefined. *)
