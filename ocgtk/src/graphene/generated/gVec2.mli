class vec2 : Vec2.t ->
  object
    method dot : Vec2.t -> float
    method equal : Vec2.t -> bool
    method free : unit -> unit
    method get_x : unit -> float
    method get_y : unit -> float
    method init : float -> float -> Vec2.t
    method init_from_float : float array -> Vec2.t
    method init_from_vec2 : Vec2.t -> Vec2.t
    method length : unit -> float
    method near : Vec2.t -> float -> bool
    method as_vec2 : Vec2.t
  end

