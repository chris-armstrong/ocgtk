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
