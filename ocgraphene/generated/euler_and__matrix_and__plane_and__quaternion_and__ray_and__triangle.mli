class type euler_t = object
  method equal : Raw.Euler.t -> bool
  method get_alpha : unit -> float
  method get_beta : unit -> float
  method get_gamma : unit -> float
  method get_order : unit -> Enums.eulerorder
  method get_x : unit -> float
  method get_y : unit -> float
  method get_z : unit -> float
  method init : float -> float -> float -> Raw.Euler.t
  method init_from_euler : Raw.Euler.t option -> Raw.Euler.t

  method init_from_matrix :
    Raw.Matrix.t option -> Enums.eulerorder -> Raw.Euler.t

  method init_from_quaternion :
    Raw.Quaternion.t option -> Enums.eulerorder -> Raw.Euler.t

  method init_from_radians :
    float -> float -> float -> Enums.eulerorder -> Raw.Euler.t

  method init_from_vec3 : Raw.Vec3.t option -> Enums.eulerorder -> Raw.Euler.t

  method init_with_order :
    float -> float -> float -> Enums.eulerorder -> Raw.Euler.t

  method as_euler : Raw.Euler.t
end

and matrix_t = object
  method determinant : unit -> float
  method equal : Raw.Matrix.t -> bool
  method equal_fast : Raw.Matrix.t -> bool
  method get_value : int -> int -> float
  method get_x_scale : unit -> float
  method get_x_translation : unit -> float
  method get_y_scale : unit -> float
  method get_y_translation : unit -> float
  method get_z_scale : unit -> float
  method get_z_translation : unit -> float

  method init_from_2d :
    float -> float -> float -> float -> float -> float -> Raw.Matrix.t

  method init_from_float : float array -> Raw.Matrix.t
  method init_from_matrix : Raw.Matrix.t -> Raw.Matrix.t

  method init_from_vec4 :
    Raw.Vec4.t -> Raw.Vec4.t -> Raw.Vec4.t -> Raw.Vec4.t -> Raw.Matrix.t

  method init_frustum :
    float -> float -> float -> float -> float -> float -> Raw.Matrix.t

  method init_identity : unit -> Raw.Matrix.t
  method init_look_at : Raw.Vec3.t -> Raw.Vec3.t -> Raw.Vec3.t -> Raw.Matrix.t

  method init_ortho :
    float -> float -> float -> float -> float -> float -> Raw.Matrix.t

  method init_perspective : float -> float -> float -> float -> Raw.Matrix.t
  method init_rotate : float -> Raw.Vec3.t -> Raw.Matrix.t
  method init_scale : float -> float -> float -> Raw.Matrix.t
  method init_skew : float -> float -> Raw.Matrix.t
  method init_translate : Raw.Point3_d.t -> Raw.Matrix.t
  method is_2d : unit -> bool
  method is_backface_visible : unit -> bool
  method is_identity : unit -> bool
  method is_singular : unit -> bool
  method near : Raw.Matrix.t -> float -> bool
  method print : unit -> unit
  method rotate : float -> Raw.Vec3.t -> unit
  method rotate_euler : Raw.Euler.t -> unit
  method rotate_quaternion : Raw.Quaternion.t -> unit
  method rotate_x : float -> unit
  method rotate_y : float -> unit
  method rotate_z : float -> unit
  method scale : float -> float -> float -> unit
  method skew_xy : float -> unit
  method skew_xz : float -> unit
  method skew_yz : float -> unit
  method translate : Raw.Point3_d.t -> unit
  method as_matrix : Raw.Matrix.t
end

and plane_t = object
  method distance : Raw.Point3_d.t -> float
  method equal : Raw.Plane.t -> bool
  method get_constant : unit -> float
  method init : Raw.Vec3.t option -> float -> Raw.Plane.t
  method init_from_plane : Raw.Plane.t -> Raw.Plane.t
  method init_from_point : Raw.Vec3.t -> Raw.Point3_d.t -> Raw.Plane.t

  method init_from_points :
    Raw.Point3_d.t -> Raw.Point3_d.t -> Raw.Point3_d.t -> Raw.Plane.t

  method init_from_vec4 : Raw.Vec4.t -> Raw.Plane.t
  method as_plane : Raw.Plane.t
end

and quaternion_t = object
  method dot : Raw.Quaternion.t -> float
  method equal : Raw.Quaternion.t -> bool
  method init : float -> float -> float -> float -> Raw.Quaternion.t
  method init_from_angle_vec3 : float -> Raw.Vec3.t -> Raw.Quaternion.t
  method init_from_angles : float -> float -> float -> Raw.Quaternion.t
  method init_from_euler : Raw.Euler.t -> Raw.Quaternion.t
  method init_from_matrix : Raw.Matrix.t -> Raw.Quaternion.t
  method init_from_quaternion : Raw.Quaternion.t -> Raw.Quaternion.t
  method init_from_radians : float -> float -> float -> Raw.Quaternion.t
  method init_from_vec4 : Raw.Vec4.t -> Raw.Quaternion.t
  method init_identity : unit -> Raw.Quaternion.t
  method as_quaternion : Raw.Quaternion.t
end

and ray_t = object
  method equal : Raw.Ray.t -> bool
  method get_distance_to_plane : Raw.Plane.t -> float
  method get_distance_to_point : Raw.Point3_d.t -> float
  method init : Raw.Point3_d.t option -> Raw.Vec3.t option -> Raw.Ray.t
  method init_from_ray : Raw.Ray.t -> Raw.Ray.t
  method init_from_vec3 : Raw.Vec3.t option -> Raw.Vec3.t option -> Raw.Ray.t
  method intersects_box : Raw.Box.t -> bool
  method intersects_sphere : Raw.Sphere.t -> bool
  method intersects_triangle : Raw.Triangle.t -> bool
  method as_ray : Raw.Ray.t
end

and triangle_t = object
  method contains_point : Raw.Point3_d.t -> bool
  method equal : Raw.Triangle.t -> bool
  method get_area : unit -> float

  method init_from_float :
    float array -> float array -> float array -> Raw.Triangle.t

  method init_from_point3d :
    Raw.Point3_d.t option ->
    Raw.Point3_d.t option ->
    Raw.Point3_d.t option ->
    Raw.Triangle.t

  method init_from_vec3 :
    Raw.Vec3.t option ->
    Raw.Vec3.t option ->
    Raw.Vec3.t option ->
    Raw.Triangle.t

  method as_triangle : Raw.Triangle.t
end

class euler : Raw.Euler.t -> euler_t

and matrix : Raw.Matrix.t -> matrix_t

and plane : Raw.Plane.t -> plane_t

and quaternion : Raw.Quaternion.t -> quaternion_t

and ray : Raw.Ray.t -> ray_t

and triangle : Raw.Triangle.t -> triangle_t

val alloc : unit -> euler_t
val alloc : unit -> matrix_t
val alloc : unit -> quaternion_t
val alloc : unit -> ray_t
val alloc : unit -> plane_t
val alloc : unit -> triangle_t
