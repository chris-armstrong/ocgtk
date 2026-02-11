class frustum : Frustum.t ->
  object
    method contains_point : Point3_d.t -> bool
    method equal : Frustum.t -> bool
    method free : unit -> unit
    method init : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t -> Frustum.t
    method init_from_frustum : Frustum.t -> Frustum.t
    method init_from_matrix : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t -> Frustum.t
    method intersects_box : Box_and__sphere.Box.t -> bool
    method intersects_sphere : Box_and__sphere.Sphere.t -> bool
    method as_frustum : Frustum.t
  end

