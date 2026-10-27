class type point_t = object
  method equal : Raw.Point.t -> bool
  method init : float -> float -> Raw.Point.t
  method init_from_point : Raw.Point.t -> Raw.Point.t
  method init_from_vec2 : Raw.Vec2.t -> Raw.Point.t
  method near : Raw.Point.t -> float -> bool
  method as_point : Raw.Point.t
end

class point : Raw.Point.t -> point_t

val alloc : unit -> point_t
