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

val alloc : unit -> frustum_t
