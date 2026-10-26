class type point_t = object
  method equal : Point.t -> bool
  method init : float -> float -> Point.t
  method init_from_point : Point.t -> Point.t
  method init_from_vec2 : Vec2.t -> Point.t
  method near : Point.t -> float -> bool
  method as_point : Point.t
end

class point : Point.t -> point_t

val alloc : unit -> point_t
