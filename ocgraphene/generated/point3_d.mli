class type point3_d_t = object
  method dot : Raw.Point3_d.t -> float
  method equal : Raw.Point3_d.t -> bool
  method init : float -> float -> float -> Raw.Point3_d.t
  method init_from_point : Raw.Point3_d.t -> Raw.Point3_d.t
  method init_from_vec3 : Raw.Vec3.t -> Raw.Point3_d.t
  method length : unit -> float
  method near : Raw.Point3_d.t -> float -> bool
  method as_point3_d : Raw.Point3_d.t
end

class point3_d : Raw.Point3_d.t -> point3_d_t

val alloc : unit -> point3_d_t
