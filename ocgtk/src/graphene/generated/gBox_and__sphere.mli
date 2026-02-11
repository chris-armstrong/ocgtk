
class box : Box_and__sphere.Box.t ->
  object
    method contains_box : Box_and__sphere.Box.t -> bool
    method contains_point : Point3_d.t -> bool
    method equal : Box_and__sphere.Box.t -> bool
    method free : unit -> unit
    method get_depth : unit -> float
    method get_height : unit -> float
    method get_width : unit -> float
    method init : Point3_d.t option -> Point3_d.t option -> Box_and__sphere.Box.t
    method init_from_box : Box_and__sphere.Box.t -> Box_and__sphere.Box.t
    method init_from_points : int -> Point3_d.t array -> Box_and__sphere.Box.t
    method init_from_vec3 : Vec3_and__vec4.Vec3.t option -> Vec3_and__vec4.Vec3.t option -> Box_and__sphere.Box.t
    method init_from_vectors : int -> Vec3_and__vec4.Vec3.t array -> Box_and__sphere.Box.t
    method as_box : Box_and__sphere.Box.t
  end

and sphere : Box_and__sphere.Sphere.t ->
  object
    method contains_point : Point3_d.t -> bool
    method distance : Point3_d.t -> float
    method equal : Box_and__sphere.Sphere.t -> bool
    method free : unit -> unit
    method get_radius : unit -> float
    method init : Point3_d.t option -> float -> Box_and__sphere.Sphere.t
    method init_from_points : int -> Point3_d.t array -> Point3_d.t option -> Box_and__sphere.Sphere.t
    method init_from_vectors : int -> Vec3_and__vec4.Vec3.t array -> Point3_d.t option -> Box_and__sphere.Sphere.t
    method is_empty : unit -> bool
    method as_sphere : Box_and__sphere.Sphere.t
  end
