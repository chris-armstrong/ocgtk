
class type euler_t = object
    method equal : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t -> bool
    method free : unit -> unit
    method get_alpha : unit -> float
    method get_beta : unit -> float
    method get_gamma : unit -> float
    method get_order : unit -> Graphene_enums.eulerorder
    method get_x : unit -> float
    method get_y : unit -> float
    method get_z : unit -> float
    method init : float -> float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t
    method init_from_euler : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t option -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t
    method init_from_matrix : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t option -> Graphene_enums.eulerorder -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t
    method init_from_quaternion : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t option -> Graphene_enums.eulerorder -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t
    method init_from_radians : float -> float -> float -> Graphene_enums.eulerorder -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t
    method init_from_vec3 : Vec3_and__vec4.Vec3.t option -> Graphene_enums.eulerorder -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t
    method init_with_order : float -> float -> float -> Graphene_enums.eulerorder -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t
    method as_euler : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t
end

and matrix_t = object
    method determinant : unit -> float
    method equal : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t -> bool
    method equal_fast : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t -> bool
    method free : unit -> unit
    method get_value : int -> int -> float
    method get_x_scale : unit -> float
    method get_x_translation : unit -> float
    method get_y_scale : unit -> float
    method get_y_translation : unit -> float
    method get_z_scale : unit -> float
    method get_z_translation : unit -> float
    method init_from_2d : float -> float -> float -> float -> float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t
    method init_from_float : float array -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t
    method init_from_matrix : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t
    method init_from_vec4 : Vec3_and__vec4.Vec4.t -> Vec3_and__vec4.Vec4.t -> Vec3_and__vec4.Vec4.t -> Vec3_and__vec4.Vec4.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t
    method init_frustum : float -> float -> float -> float -> float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t
    method init_identity : unit -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t
    method init_look_at : Vec3_and__vec4.Vec3.t -> Vec3_and__vec4.Vec3.t -> Vec3_and__vec4.Vec3.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t
    method init_ortho : float -> float -> float -> float -> float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t
    method init_perspective : float -> float -> float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t
    method init_rotate : float -> Vec3_and__vec4.Vec3.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t
    method init_scale : float -> float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t
    method init_skew : float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t
    method init_translate : Point3_d.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t
    method is_2d : unit -> bool
    method is_backface_visible : unit -> bool
    method is_identity : unit -> bool
    method is_singular : unit -> bool
    method near : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t -> float -> bool
    method print : unit -> unit
    method rotate : float -> Vec3_and__vec4.Vec3.t -> unit
    method rotate_euler : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t -> unit
    method rotate_quaternion : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t -> unit
    method rotate_x : float -> unit
    method rotate_y : float -> unit
    method rotate_z : float -> unit
    method scale : float -> float -> float -> unit
    method skew_xy : float -> unit
    method skew_xz : float -> unit
    method skew_yz : float -> unit
    method translate : Point3_d.t -> unit
    method as_matrix : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t
end

and plane_t = object
    method distance : Point3_d.t -> float
    method equal : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t -> bool
    method free : unit -> unit
    method get_constant : unit -> float
    method init : Vec3_and__vec4.Vec3.t option -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t
    method init_from_plane : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t
    method init_from_point : Vec3_and__vec4.Vec3.t -> Point3_d.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t
    method init_from_points : Point3_d.t -> Point3_d.t -> Point3_d.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t
    method init_from_vec4 : Vec3_and__vec4.Vec4.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t
    method as_plane : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t
end

and quaternion_t = object
    method dot : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t -> float
    method equal : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t -> bool
    method free : unit -> unit
    method init : float -> float -> float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t
    method init_from_angle_vec3 : float -> Vec3_and__vec4.Vec3.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t
    method init_from_angles : float -> float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t
    method init_from_euler : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t
    method init_from_matrix : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t
    method init_from_quaternion : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t
    method init_from_radians : float -> float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t
    method init_from_vec4 : Vec3_and__vec4.Vec4.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t
    method init_identity : unit -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t
    method as_quaternion : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t
end

and ray_t = object
    method equal : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.t -> bool
    method free : unit -> unit
    method get_distance_to_plane : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t -> float
    method get_distance_to_point : Point3_d.t -> float
    method init : Point3_d.t option -> Vec3_and__vec4.Vec3.t option -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.t
    method init_from_ray : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.t
    method init_from_vec3 : Vec3_and__vec4.Vec3.t option -> Vec3_and__vec4.Vec3.t option -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.t
    method intersects_box : Box_and__sphere.Box.t -> bool
    method intersects_sphere : Box_and__sphere.Sphere.t -> bool
    method intersects_triangle : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.t -> bool
    method as_ray : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.t
end

and triangle_t = object
    method contains_point : Point3_d.t -> bool
    method equal : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.t -> bool
    method free : unit -> unit
    method get_area : unit -> float
    method init_from_float : float array -> float array -> float array -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.t
    method init_from_point3d : Point3_d.t option -> Point3_d.t option -> Point3_d.t option -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.t
    method init_from_vec3 : Vec3_and__vec4.Vec3.t option -> Vec3_and__vec4.Vec3.t option -> Vec3_and__vec4.Vec3.t option -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.t
    method as_triangle : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.t
end


class euler : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t -> euler_t

and matrix : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t -> matrix_t

and plane : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t -> plane_t

and quaternion : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t -> quaternion_t

and ray : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.t -> ray_t

and triangle : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.t -> triangle_t
