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

(* High-level class for Frustum *)
class frustum (obj : Raw.Frustum.t) : frustum_t =
  object (self)
    method contains_point : Raw.Point3_d.t -> bool =
      fun point -> Raw.Frustum.contains_point obj point

    method equal : Raw.Frustum.t -> bool = fun b -> Raw.Frustum.equal obj b

    method init :
        Raw.Plane.t ->
        Raw.Plane.t ->
        Raw.Plane.t ->
        Raw.Plane.t ->
        Raw.Plane.t ->
        Raw.Plane.t ->
        Raw.Frustum.t =
      fun p0 p1 p2 p3 p4 p5 -> Raw.Frustum.init obj p0 p1 p2 p3 p4 p5

    method init_from_frustum : Raw.Frustum.t -> Raw.Frustum.t =
      fun src -> Raw.Frustum.init_from_frustum obj src

    method init_from_matrix : Raw.Matrix.t -> Raw.Frustum.t =
      fun matrix -> Raw.Frustum.init_from_matrix obj matrix

    method intersects_box : Raw.Box.t -> bool =
      fun box -> Raw.Frustum.intersects_box obj box

    method intersects_sphere : Raw.Sphere.t -> bool =
      fun sphere -> Raw.Frustum.intersects_sphere obj sphere

    method as_frustum = obj
  end

let alloc () : frustum_t = new frustum (Raw.Frustum.alloc ())
