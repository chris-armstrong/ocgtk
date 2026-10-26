(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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

class euler (obj : Raw.Euler.t) : euler_t =
  object (self)
    method equal : Raw.Euler.t -> bool = fun b -> Raw.Euler.equal obj b
    method get_alpha : unit -> float = fun () -> Raw.Euler.get_alpha obj
    method get_beta : unit -> float = fun () -> Raw.Euler.get_beta obj
    method get_gamma : unit -> float = fun () -> Raw.Euler.get_gamma obj

    method get_order : unit -> Enums.eulerorder =
      fun () -> Raw.Euler.get_order obj

    method get_x : unit -> float = fun () -> Raw.Euler.get_x obj
    method get_y : unit -> float = fun () -> Raw.Euler.get_y obj
    method get_z : unit -> float = fun () -> Raw.Euler.get_z obj

    method init : float -> float -> float -> Raw.Euler.t =
      fun x y z -> Raw.Euler.init obj x y z

    method init_from_euler : Raw.Euler.t option -> Raw.Euler.t =
      fun src -> Raw.Euler.init_from_euler obj src

    method init_from_matrix :
        Raw.Matrix.t option -> Enums.eulerorder -> Raw.Euler.t =
      fun m order -> Raw.Euler.init_from_matrix obj m order

    method init_from_quaternion :
        Raw.Quaternion.t option -> Enums.eulerorder -> Raw.Euler.t =
      fun q order -> Raw.Euler.init_from_quaternion obj q order

    method init_from_radians :
        float -> float -> float -> Enums.eulerorder -> Raw.Euler.t =
      fun x y z order -> Raw.Euler.init_from_radians obj x y z order

    method init_from_vec3 : Raw.Vec3.t option -> Enums.eulerorder -> Raw.Euler.t
        =
      fun v order -> Raw.Euler.init_from_vec3 obj v order

    method init_with_order :
        float -> float -> float -> Enums.eulerorder -> Raw.Euler.t =
      fun x y z order -> Raw.Euler.init_with_order obj x y z order

    method as_euler = obj
  end

and matrix (obj : Raw.Matrix.t) : matrix_t =
  object (self)
    method determinant : unit -> float = fun () -> Raw.Matrix.determinant obj
    method equal : Raw.Matrix.t -> bool = fun b -> Raw.Matrix.equal obj b

    method equal_fast : Raw.Matrix.t -> bool =
      fun b -> Raw.Matrix.equal_fast obj b

    method get_value : int -> int -> float =
      fun row col -> Raw.Matrix.get_value obj row col

    method get_x_scale : unit -> float = fun () -> Raw.Matrix.get_x_scale obj

    method get_x_translation : unit -> float =
      fun () -> Raw.Matrix.get_x_translation obj

    method get_y_scale : unit -> float = fun () -> Raw.Matrix.get_y_scale obj

    method get_y_translation : unit -> float =
      fun () -> Raw.Matrix.get_y_translation obj

    method get_z_scale : unit -> float = fun () -> Raw.Matrix.get_z_scale obj

    method get_z_translation : unit -> float =
      fun () -> Raw.Matrix.get_z_translation obj

    method init_from_2d :
        float -> float -> float -> float -> float -> float -> Raw.Matrix.t =
      fun xx yx xy yy x_0 y_0 -> Raw.Matrix.init_from_2d obj xx yx xy yy x_0 y_0

    method init_from_float : float array -> Raw.Matrix.t =
      fun v -> Raw.Matrix.init_from_float obj v

    method init_from_matrix : Raw.Matrix.t -> Raw.Matrix.t =
      fun src -> Raw.Matrix.init_from_matrix obj src

    method init_from_vec4 :
        Raw.Vec4.t -> Raw.Vec4.t -> Raw.Vec4.t -> Raw.Vec4.t -> Raw.Matrix.t =
      fun v0 v1 v2 v3 -> Raw.Matrix.init_from_vec4 obj v0 v1 v2 v3

    method init_frustum :
        float -> float -> float -> float -> float -> float -> Raw.Matrix.t =
      fun left right bottom top z_near z_far ->
        Raw.Matrix.init_frustum obj left right bottom top z_near z_far

    method init_identity : unit -> Raw.Matrix.t =
      fun () -> Raw.Matrix.init_identity obj

    method init_look_at : Raw.Vec3.t -> Raw.Vec3.t -> Raw.Vec3.t -> Raw.Matrix.t
        =
      fun eye center up -> Raw.Matrix.init_look_at obj eye center up

    method init_ortho :
        float -> float -> float -> float -> float -> float -> Raw.Matrix.t =
      fun left right top bottom z_near z_far ->
        Raw.Matrix.init_ortho obj left right top bottom z_near z_far

    method init_perspective : float -> float -> float -> float -> Raw.Matrix.t =
      fun fovy aspect z_near z_far ->
        Raw.Matrix.init_perspective obj fovy aspect z_near z_far

    method init_rotate : float -> Raw.Vec3.t -> Raw.Matrix.t =
      fun angle axis -> Raw.Matrix.init_rotate obj angle axis

    method init_scale : float -> float -> float -> Raw.Matrix.t =
      fun x y z -> Raw.Matrix.init_scale obj x y z

    method init_skew : float -> float -> Raw.Matrix.t =
      fun x_skew y_skew -> Raw.Matrix.init_skew obj x_skew y_skew

    method init_translate : Raw.Point3_d.t -> Raw.Matrix.t =
      fun p -> Raw.Matrix.init_translate obj p

    method is_2d : unit -> bool = fun () -> Raw.Matrix.is_2d obj

    method is_backface_visible : unit -> bool =
      fun () -> Raw.Matrix.is_backface_visible obj

    method is_identity : unit -> bool = fun () -> Raw.Matrix.is_identity obj
    method is_singular : unit -> bool = fun () -> Raw.Matrix.is_singular obj

    method near : Raw.Matrix.t -> float -> bool =
      fun b epsilon -> Raw.Matrix.near obj b epsilon

    method print : unit -> unit = fun () -> Raw.Matrix.print obj

    method rotate : float -> Raw.Vec3.t -> unit =
      fun angle axis -> Raw.Matrix.rotate obj angle axis

    method rotate_euler : Raw.Euler.t -> unit =
      fun e -> Raw.Matrix.rotate_euler obj e

    method rotate_quaternion : Raw.Quaternion.t -> unit =
      fun q -> Raw.Matrix.rotate_quaternion obj q

    method rotate_x : float -> unit = fun angle -> Raw.Matrix.rotate_x obj angle
    method rotate_y : float -> unit = fun angle -> Raw.Matrix.rotate_y obj angle
    method rotate_z : float -> unit = fun angle -> Raw.Matrix.rotate_z obj angle

    method scale : float -> float -> float -> unit =
      fun factor_x factor_y factor_z ->
        Raw.Matrix.scale obj factor_x factor_y factor_z

    method skew_xy : float -> unit = fun factor -> Raw.Matrix.skew_xy obj factor
    method skew_xz : float -> unit = fun factor -> Raw.Matrix.skew_xz obj factor
    method skew_yz : float -> unit = fun factor -> Raw.Matrix.skew_yz obj factor

    method translate : Raw.Point3_d.t -> unit =
      fun pos -> Raw.Matrix.translate obj pos

    method as_matrix = obj
  end

and plane (obj : Raw.Plane.t) : plane_t =
  object (self)
    method distance : Raw.Point3_d.t -> float =
      fun point -> Raw.Plane.distance obj point

    method equal : Raw.Plane.t -> bool = fun b -> Raw.Plane.equal obj b
    method get_constant : unit -> float = fun () -> Raw.Plane.get_constant obj

    method init : Raw.Vec3.t option -> float -> Raw.Plane.t =
      fun normal constant -> Raw.Plane.init obj normal constant

    method init_from_plane : Raw.Plane.t -> Raw.Plane.t =
      fun src -> Raw.Plane.init_from_plane obj src

    method init_from_point : Raw.Vec3.t -> Raw.Point3_d.t -> Raw.Plane.t =
      fun normal point -> Raw.Plane.init_from_point obj normal point

    method init_from_points :
        Raw.Point3_d.t -> Raw.Point3_d.t -> Raw.Point3_d.t -> Raw.Plane.t =
      fun a b c -> Raw.Plane.init_from_points obj a b c

    method init_from_vec4 : Raw.Vec4.t -> Raw.Plane.t =
      fun src -> Raw.Plane.init_from_vec4 obj src

    method as_plane = obj
  end

and quaternion (obj : Raw.Quaternion.t) : quaternion_t =
  object (self)
    method dot : Raw.Quaternion.t -> float = fun b -> Raw.Quaternion.dot obj b

    method equal : Raw.Quaternion.t -> bool =
      fun b -> Raw.Quaternion.equal obj b

    method init : float -> float -> float -> float -> Raw.Quaternion.t =
      fun x y z w -> Raw.Quaternion.init obj x y z w

    method init_from_angle_vec3 : float -> Raw.Vec3.t -> Raw.Quaternion.t =
      fun angle axis -> Raw.Quaternion.init_from_angle_vec3 obj angle axis

    method init_from_angles : float -> float -> float -> Raw.Quaternion.t =
      fun deg_x deg_y deg_z ->
        Raw.Quaternion.init_from_angles obj deg_x deg_y deg_z

    method init_from_euler : Raw.Euler.t -> Raw.Quaternion.t =
      fun e -> Raw.Quaternion.init_from_euler obj e

    method init_from_matrix : Raw.Matrix.t -> Raw.Quaternion.t =
      fun m -> Raw.Quaternion.init_from_matrix obj m

    method init_from_quaternion : Raw.Quaternion.t -> Raw.Quaternion.t =
      fun src -> Raw.Quaternion.init_from_quaternion obj src

    method init_from_radians : float -> float -> float -> Raw.Quaternion.t =
      fun rad_x rad_y rad_z ->
        Raw.Quaternion.init_from_radians obj rad_x rad_y rad_z

    method init_from_vec4 : Raw.Vec4.t -> Raw.Quaternion.t =
      fun src -> Raw.Quaternion.init_from_vec4 obj src

    method init_identity : unit -> Raw.Quaternion.t =
      fun () -> Raw.Quaternion.init_identity obj

    method as_quaternion = obj
  end

and ray (obj : Raw.Ray.t) : ray_t =
  object (self)
    method equal : Raw.Ray.t -> bool = fun b -> Raw.Ray.equal obj b

    method get_distance_to_plane : Raw.Plane.t -> float =
      fun p -> Raw.Ray.get_distance_to_plane obj p

    method get_distance_to_point : Raw.Point3_d.t -> float =
      fun p -> Raw.Ray.get_distance_to_point obj p

    method init : Raw.Point3_d.t option -> Raw.Vec3.t option -> Raw.Ray.t =
      fun origin direction -> Raw.Ray.init obj origin direction

    method init_from_ray : Raw.Ray.t -> Raw.Ray.t =
      fun src -> Raw.Ray.init_from_ray obj src

    method init_from_vec3 : Raw.Vec3.t option -> Raw.Vec3.t option -> Raw.Ray.t
        =
      fun origin direction -> Raw.Ray.init_from_vec3 obj origin direction

    method intersects_box : Raw.Box.t -> bool =
      fun b -> Raw.Ray.intersects_box obj b

    method intersects_sphere : Raw.Sphere.t -> bool =
      fun s -> Raw.Ray.intersects_sphere obj s

    method intersects_triangle : Raw.Triangle.t -> bool =
      fun t -> Raw.Ray.intersects_triangle obj t

    method as_ray = obj
  end

and triangle (obj : Raw.Triangle.t) : triangle_t =
  object (self)
    method contains_point : Raw.Point3_d.t -> bool =
      fun p -> Raw.Triangle.contains_point obj p

    method equal : Raw.Triangle.t -> bool = fun b -> Raw.Triangle.equal obj b
    method get_area : unit -> float = fun () -> Raw.Triangle.get_area obj

    method init_from_float :
        float array -> float array -> float array -> Raw.Triangle.t =
      fun a b c -> Raw.Triangle.init_from_float obj a b c

    method init_from_point3d :
        Raw.Point3_d.t option ->
        Raw.Point3_d.t option ->
        Raw.Point3_d.t option ->
        Raw.Triangle.t =
      fun a b c -> Raw.Triangle.init_from_point3d obj a b c

    method init_from_vec3 :
        Raw.Vec3.t option ->
        Raw.Vec3.t option ->
        Raw.Vec3.t option ->
        Raw.Triangle.t =
      fun a b c -> Raw.Triangle.init_from_vec3 obj a b c

    method as_triangle = obj
  end

let alloc () : euler_t = new euler (Raw.Euler.alloc ())
let alloc () : matrix_t = new matrix (Raw.Matrix.alloc ())
let alloc () : quaternion_t = new quaternion (Raw.Quaternion.alloc ())
let alloc () : ray_t = new ray (Raw.Ray.alloc ())
let alloc () : plane_t = new plane (Raw.Plane.alloc ())
let alloc () : triangle_t = new triangle (Raw.Triangle.alloc ())
