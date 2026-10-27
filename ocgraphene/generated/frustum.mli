(** A 3D volume delimited by 2D clip planes.

    The contents of the [graphene_frustum_t] are private, and should not be
    modified directly.

    Its methods, signals and properties are on {!class-type-frustum_t}. The
    functions it is built on are in {!Ocgraphene.Raw.Frustum}. *)

(** The methods, signals and properties of a [graphene_frustum_t]. *)
class type frustum_t = object
  method contains_point : Raw.Point3_d.t -> bool
  (** Checks whether a point is inside the volume defined by the given
      #graphene_frustum_t. *)

  method equal : Raw.Frustum.t -> bool
  (** Checks whether the two given #graphene_frustum_t are equal. *)

  method init :
    Raw.Plane.t ->
    Raw.Plane.t ->
    Raw.Plane.t ->
    Raw.Plane.t ->
    Raw.Plane.t ->
    Raw.Plane.t ->
    Raw.Frustum.t
  (** Initializes the given #graphene_frustum_t using the provided clipping
      planes. *)

  method init_from_frustum : Raw.Frustum.t -> Raw.Frustum.t
  (** Initializes the given #graphene_frustum_t using the clipping planes of
      another #graphene_frustum_t. *)

  method init_from_matrix : Raw.Matrix.t -> Raw.Frustum.t
  (** Initializes a #graphene_frustum_t using the given [matrix]. *)

  method intersects_box : Raw.Box.t -> bool
  (** Checks whether the given [box] intersects a plane of a
      #graphene_frustum_t. *)

  method intersects_sphere : Raw.Sphere.t -> bool
  (** Checks whether the given [sphere] intersects a plane of a
      #graphene_frustum_t. *)

  method as_frustum : Raw.Frustum.t
end

class frustum : Raw.Frustum.t -> frustum_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Frustum.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_frustum_t], give one already wrapped. *)

val alloc : unit -> frustum_t
