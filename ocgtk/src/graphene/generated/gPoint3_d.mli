class type point3_d_t = object
  method dot : Point3_d.t -> float
  method equal : Point3_d.t -> bool
  method init : float -> float -> float -> Point3_d.t
  method init_from_point : Point3_d.t -> Point3_d.t
  method init_from_vec3 : Vec3_and__vec4.Vec3.t -> Point3_d.t
  method length : unit -> float
  method near : Point3_d.t -> float -> bool
  method as_point3_d : Point3_d.t
end

class point3_d : Point3_d.t -> point3_d_t

val alloc : unit -> point3_d_t
