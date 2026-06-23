class type point3_d_t = object
  method dot : Point3_d.t -> float
  method equal : Point3_d.t -> bool
  method init : float -> float -> float -> Point3_d.t
  method init_from_point : Point3_d.t -> Point3_d.t
  method init_from_vec3 : Vec3_and__vec4.Vec3.t -> Point3_d.t
  method length : unit -> float
  method near : Point3_d.t -> float -> bool
  method get_x : float
  method set_x : float -> unit
  method get_y : float
  method set_y : float -> unit
  method get_z : float
  method set_z : float -> unit
  method as_point3_d : Point3_d.t
end

class point3_d : Point3_d.t -> point3_d_t

val alloc : unit -> point3_d_t
val make : float -> float -> float -> point3_d_t
