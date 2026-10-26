class type frustum_t = object
  method contains_point : Point3_d.t -> bool
  method equal : Frustum.t -> bool

  method init :
    Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t ->
    Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t ->
    Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t ->
    Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t ->
    Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t ->
    Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t ->
    Frustum.t

  method init_from_frustum : Frustum.t -> Frustum.t

  method init_from_matrix :
    Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t ->
    Frustum.t

  method intersects_box : Box_and__sphere.Box.t -> bool
  method intersects_sphere : Box_and__sphere.Sphere.t -> bool
  method as_frustum : Frustum.t
end

(* High-level class for Frustum *)
class frustum (obj : Frustum.t) : frustum_t =
  object (self)
    method contains_point : Point3_d.t -> bool =
      fun point -> Frustum.contains_point obj point

    method equal : Frustum.t -> bool = fun b -> Frustum.equal obj b

    method init :
        Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle
        .Plane
        .t ->
        Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle
        .Plane
        .t ->
        Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle
        .Plane
        .t ->
        Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle
        .Plane
        .t ->
        Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle
        .Plane
        .t ->
        Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle
        .Plane
        .t ->
        Frustum.t =
      fun p0 p1 p2 p3 p4 p5 -> Frustum.init obj p0 p1 p2 p3 p4 p5

    method init_from_frustum : Frustum.t -> Frustum.t =
      fun src -> Frustum.init_from_frustum obj src

    method init_from_matrix :
        Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle
        .Matrix
        .t ->
        Frustum.t =
      fun matrix -> Frustum.init_from_matrix obj matrix

    method intersects_box : Box_and__sphere.Box.t -> bool =
      fun box -> Frustum.intersects_box obj box

    method intersects_sphere : Box_and__sphere.Sphere.t -> bool =
      fun sphere -> Frustum.intersects_sphere obj sphere

    method as_frustum = obj
  end

let alloc () : frustum_t = new frustum (Frustum.alloc ())
