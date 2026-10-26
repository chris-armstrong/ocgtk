class type quad_t = object
  method contains : Raw.Point.t -> bool
  method get_point : int -> Raw.Point.t

  method init :
    Raw.Point.t -> Raw.Point.t -> Raw.Point.t -> Raw.Point.t -> Raw.Quad.t

  method init_from_points : Raw.Point.t array -> Raw.Quad.t
  method init_from_rect : Raw.Rect.t -> Raw.Quad.t
  method as_quad : Raw.Quad.t
end

class quad : Raw.Quad.t -> quad_t

val alloc : unit -> quad_t
