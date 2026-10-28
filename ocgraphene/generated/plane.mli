(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Plane from cyclic group Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle *)

(** A 2D plane that extends infinitely in a 3D volume.

    The contents of the [graphene_plane_t] are private, and should not be
    modified directly.

    Its methods, signals and properties are on {!class-type-plane_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgraphene.Raw.Plane}. *)

class type plane_t =
  Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.plane_t
(** The methods, signals and properties of a [Plane]. *)

class plane : Raw.Plane.t -> plane_t
(** Wraps a raw handle of {!Ocgraphene.Raw.Plane.t}. *)

(** {2:constructors Constructors} *)

val alloc : unit -> plane_t
(** Allocates a new #graphene_plane_t structure.

    The contents of the returned structure are undefined. *)
