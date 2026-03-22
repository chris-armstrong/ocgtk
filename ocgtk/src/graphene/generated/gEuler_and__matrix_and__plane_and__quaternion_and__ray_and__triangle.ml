(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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


class euler (obj : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t) : euler_t = object (self)

  method equal : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t -> bool =
    fun b ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.equal obj b)

  method free : unit -> unit =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.free obj)

  method get_alpha : unit -> float =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.get_alpha obj)

  method get_beta : unit -> float =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.get_beta obj)

  method get_gamma : unit -> float =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.get_gamma obj)

  method get_order : unit -> Graphene_enums.eulerorder =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.get_order obj)

  method get_x : unit -> float =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.get_x obj)

  method get_y : unit -> float =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.get_y obj)

  method get_z : unit -> float =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.get_z obj)

  method init : float -> float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t =
    fun x y z ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.init obj x y z)

  method init_from_euler : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t option -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t =
    fun src ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.init_from_euler obj src)

  method init_from_matrix : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t option -> Graphene_enums.eulerorder -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t =
    fun m order ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.init_from_matrix obj m order)

  method init_from_quaternion : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t option -> Graphene_enums.eulerorder -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t =
    fun q order ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.init_from_quaternion obj q order)

  method init_from_radians : float -> float -> float -> Graphene_enums.eulerorder -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t =
    fun x y z order ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.init_from_radians obj x y z order)

  method init_from_vec3 : Vec3_and__vec4.Vec3.t option -> Graphene_enums.eulerorder -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t =
    fun v order ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.init_from_vec3 obj v order)

  method init_with_order : float -> float -> float -> Graphene_enums.eulerorder -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t =
    fun x y z order ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.init_with_order obj x y z order)

    method as_euler = obj
end

and matrix (obj : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t) : matrix_t = object (self)

  method determinant : unit -> float =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.determinant obj)

  method equal : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t -> bool =
    fun b ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.equal obj b)

  method equal_fast : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t -> bool =
    fun b ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.equal_fast obj b)

  method free : unit -> unit =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.free obj)

  method get_value : int -> int -> float =
    fun row col ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.get_value obj row col)

  method get_x_scale : unit -> float =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.get_x_scale obj)

  method get_x_translation : unit -> float =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.get_x_translation obj)

  method get_y_scale : unit -> float =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.get_y_scale obj)

  method get_y_translation : unit -> float =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.get_y_translation obj)

  method get_z_scale : unit -> float =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.get_z_scale obj)

  method get_z_translation : unit -> float =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.get_z_translation obj)

  method init_from_2d : float -> float -> float -> float -> float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t =
    fun xx yx xy yy x_0 y_0 ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.init_from_2d obj xx yx xy yy x_0 y_0)

  method init_from_float : float array -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t =
    fun v ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.init_from_float obj v)

  method init_from_matrix : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t =
    fun src ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.init_from_matrix obj src)

  method init_from_vec4 : Vec3_and__vec4.Vec4.t -> Vec3_and__vec4.Vec4.t -> Vec3_and__vec4.Vec4.t -> Vec3_and__vec4.Vec4.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t =
    fun v0 v1 v2 v3 ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.init_from_vec4 obj v0 v1 v2 v3)

  method init_frustum : float -> float -> float -> float -> float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t =
    fun left right bottom top z_near z_far ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.init_frustum obj left right bottom top z_near z_far)

  method init_identity : unit -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.init_identity obj)

  method init_look_at : Vec3_and__vec4.Vec3.t -> Vec3_and__vec4.Vec3.t -> Vec3_and__vec4.Vec3.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t =
    fun eye center up ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.init_look_at obj eye center up)

  method init_ortho : float -> float -> float -> float -> float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t =
    fun left right top bottom z_near z_far ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.init_ortho obj left right top bottom z_near z_far)

  method init_perspective : float -> float -> float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t =
    fun fovy aspect z_near z_far ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.init_perspective obj fovy aspect z_near z_far)

  method init_rotate : float -> Vec3_and__vec4.Vec3.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t =
    fun angle axis ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.init_rotate obj angle axis)

  method init_scale : float -> float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t =
    fun x y z ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.init_scale obj x y z)

  method init_skew : float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t =
    fun x_skew y_skew ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.init_skew obj x_skew y_skew)

  method init_translate : Point3_d.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t =
    fun p ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.init_translate obj p)

  method is_2d : unit -> bool =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.is_2d obj)

  method is_backface_visible : unit -> bool =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.is_backface_visible obj)

  method is_identity : unit -> bool =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.is_identity obj)

  method is_singular : unit -> bool =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.is_singular obj)

  method near : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t -> float -> bool =
    fun b epsilon ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.near obj b epsilon)

  method print : unit -> unit =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.print obj)

  method rotate : float -> Vec3_and__vec4.Vec3.t -> unit =
    fun angle axis ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.rotate obj angle axis)

  method rotate_euler : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t -> unit =
    fun e ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.rotate_euler obj e)

  method rotate_quaternion : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t -> unit =
    fun q ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.rotate_quaternion obj q)

  method rotate_x : float -> unit =
    fun angle ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.rotate_x obj angle)

  method rotate_y : float -> unit =
    fun angle ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.rotate_y obj angle)

  method rotate_z : float -> unit =
    fun angle ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.rotate_z obj angle)

  method scale : float -> float -> float -> unit =
    fun factor_x factor_y factor_z ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.scale obj factor_x factor_y factor_z)

  method skew_xy : float -> unit =
    fun factor ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.skew_xy obj factor)

  method skew_xz : float -> unit =
    fun factor ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.skew_xz obj factor)

  method skew_yz : float -> unit =
    fun factor ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.skew_yz obj factor)

  method translate : Point3_d.t -> unit =
    fun pos ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.translate obj pos)

    method as_matrix = obj
end

and plane (obj : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t) : plane_t = object (self)

  method distance : Point3_d.t -> float =
    fun point ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.distance obj point)

  method equal : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t -> bool =
    fun b ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.equal obj b)

  method free : unit -> unit =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.free obj)

  method get_constant : unit -> float =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.get_constant obj)

  method init : Vec3_and__vec4.Vec3.t option -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t =
    fun normal constant ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.init obj normal constant)

  method init_from_plane : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t =
    fun src ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.init_from_plane obj src)

  method init_from_point : Vec3_and__vec4.Vec3.t -> Point3_d.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t =
    fun normal point ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.init_from_point obj normal point)

  method init_from_points : Point3_d.t -> Point3_d.t -> Point3_d.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t =
    fun a b c ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.init_from_points obj a b c)

  method init_from_vec4 : Vec3_and__vec4.Vec4.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t =
    fun src ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.init_from_vec4 obj src)

    method as_plane = obj
end

and quaternion (obj : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t) : quaternion_t = object (self)

  method dot : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t -> float =
    fun b ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.dot obj b)

  method equal : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t -> bool =
    fun b ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.equal obj b)

  method free : unit -> unit =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.free obj)

  method init : float -> float -> float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t =
    fun x y z w ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.init obj x y z w)

  method init_from_angle_vec3 : float -> Vec3_and__vec4.Vec3.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t =
    fun angle axis ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.init_from_angle_vec3 obj angle axis)

  method init_from_angles : float -> float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t =
    fun deg_x deg_y deg_z ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.init_from_angles obj deg_x deg_y deg_z)

  method init_from_euler : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t =
    fun e ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.init_from_euler obj e)

  method init_from_matrix : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t =
    fun m ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.init_from_matrix obj m)

  method init_from_quaternion : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t =
    fun src ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.init_from_quaternion obj src)

  method init_from_radians : float -> float -> float -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t =
    fun rad_x rad_y rad_z ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.init_from_radians obj rad_x rad_y rad_z)

  method init_from_vec4 : Vec3_and__vec4.Vec4.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t =
    fun src ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.init_from_vec4 obj src)

  method init_identity : unit -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.init_identity obj)

    method as_quaternion = obj
end

and ray (obj : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.t) : ray_t = object (self)

  method equal : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.t -> bool =
    fun b ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.equal obj b)

  method free : unit -> unit =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.free obj)

  method get_distance_to_plane : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t -> float =
    fun p ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.get_distance_to_plane obj p)

  method get_distance_to_point : Point3_d.t -> float =
    fun p ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.get_distance_to_point obj p)

  method init : Point3_d.t option -> Vec3_and__vec4.Vec3.t option -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.t =
    fun origin direction ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.init obj origin direction)

  method init_from_ray : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.t -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.t =
    fun src ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.init_from_ray obj src)

  method init_from_vec3 : Vec3_and__vec4.Vec3.t option -> Vec3_and__vec4.Vec3.t option -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.t =
    fun origin direction ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.init_from_vec3 obj origin direction)

  method intersects_box : Box_and__sphere.Box.t -> bool =
    fun b ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.intersects_box obj b)

  method intersects_sphere : Box_and__sphere.Sphere.t -> bool =
    fun s ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.intersects_sphere obj s)

  method intersects_triangle : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.t -> bool =
    fun t ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.intersects_triangle obj t)

    method as_ray = obj
end

and triangle (obj : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.t) : triangle_t = object (self)

  method contains_point : Point3_d.t -> bool =
    fun p ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.contains_point obj p)

  method equal : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.t -> bool =
    fun b ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.equal obj b)

  method free : unit -> unit =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.free obj)

  method get_area : unit -> float =
    fun () ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.get_area obj)

  method init_from_float : float array -> float array -> float array -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.t =
    fun a b c ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.init_from_float obj a b c)

  method init_from_point3d : Point3_d.t option -> Point3_d.t option -> Point3_d.t option -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.t =
    fun a b c ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.init_from_point3d obj a b c)

  method init_from_vec3 : Vec3_and__vec4.Vec3.t option -> Vec3_and__vec4.Vec3.t option -> Vec3_and__vec4.Vec3.t option -> Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.t =
    fun a b c ->
      (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.init_from_vec3 obj a b c)

    method as_triangle = obj
end
let alloc () : euler_t =
  new euler (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.alloc ())

let alloc () : matrix_t =
  new matrix (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.alloc ())

let alloc () : quaternion_t =
  new quaternion (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.alloc ())

let alloc () : ray_t =
  new ray (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.alloc ())

let alloc () : plane_t =
  new plane (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.alloc ())

let alloc () : triangle_t =
  new triangle (Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.alloc ())

