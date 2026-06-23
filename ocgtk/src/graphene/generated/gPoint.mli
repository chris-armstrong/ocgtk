class type point_t = object
  method equal : Point.t -> bool
  method init : float -> float -> Point.t
  method init_from_point : Point.t -> Point.t
  method init_from_vec2 : Vec2.t -> Point.t
  method near : Point.t -> float -> bool
  method get_x : float
  method set_x : float -> unit
  method get_y : float
  method set_y : float -> unit
  method as_point : Point.t
end

class point : Point.t -> point_t

val alloc : unit -> point_t
val make : float -> float -> point_t
