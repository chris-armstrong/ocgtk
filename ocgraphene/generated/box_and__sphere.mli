class type box_t = object
  method contains_box : Raw.Box.t -> bool
  method contains_point : Raw.Point3_d.t -> bool
  method equal : Raw.Box.t -> bool
  method get_depth : unit -> float
  method get_height : unit -> float
  method get_width : unit -> float
  method init : Raw.Point3_d.t option -> Raw.Point3_d.t option -> Raw.Box.t
  method init_from_box : Raw.Box.t -> Raw.Box.t
  method init_from_points : int -> Raw.Point3_d.t array -> Raw.Box.t
  method init_from_vec3 : Raw.Vec3.t option -> Raw.Vec3.t option -> Raw.Box.t
  method init_from_vectors : int -> Raw.Vec3.t array -> Raw.Box.t
  method as_box : Raw.Box.t
end

and sphere_t = object
  method contains_point : Raw.Point3_d.t -> bool
  method distance : Raw.Point3_d.t -> float
  method equal : Raw.Sphere.t -> bool
  method get_radius : unit -> float
  method init : Raw.Point3_d.t option -> float -> Raw.Sphere.t

  method init_from_points :
    int -> Raw.Point3_d.t array -> Raw.Point3_d.t option -> Raw.Sphere.t

  method init_from_vectors :
    int -> Raw.Vec3.t array -> Raw.Point3_d.t option -> Raw.Sphere.t

  method is_empty : unit -> bool
  method as_sphere : Raw.Sphere.t
end

class box : Raw.Box.t -> box_t

and sphere : Raw.Sphere.t -> sphere_t

val alloc : unit -> box_t
val alloc : unit -> sphere_t
