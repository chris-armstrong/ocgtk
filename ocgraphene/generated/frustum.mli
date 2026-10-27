(** A 3D volume delimited by 2D clip planes.

    The contents of the [graphene_frustum_t] are private, and should not be
    modified directly.

    Its methods, signals and properties are on {!class-type-frustum_t}. The
    functions it is built on are in {!Ocgraphene.Raw.Frustum}. *)

(** The methods, signals and properties of a [graphene_frustum_t]. *)
class type frustum_t = object
  method contains_point : Raw.Point3_d.t -> bool
  method equal : Raw.Frustum.t -> bool

  method init :
    Raw.Plane.t ->
    Raw.Plane.t ->
    Raw.Plane.t ->
    Raw.Plane.t ->
    Raw.Plane.t ->
    Raw.Plane.t ->
    Raw.Frustum.t

  method init_from_frustum : Raw.Frustum.t -> Raw.Frustum.t
  method init_from_matrix : Raw.Matrix.t -> Raw.Frustum.t
  method intersects_box : Raw.Box.t -> bool
  method intersects_sphere : Raw.Sphere.t -> bool
  method as_frustum : Raw.Frustum.t
end

class frustum : Raw.Frustum.t -> frustum_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Frustum.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_frustum_t], give one already wrapped. *)

val alloc : unit -> frustum_t
