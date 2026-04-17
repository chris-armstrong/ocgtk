class type quad_t = object
    method contains : Point.t -> bool
    method free : unit -> unit
    method get_point : int -> Point.t
    method init : Point.t -> Point.t -> Point.t -> Point.t -> Quad.t
    method init_from_points : Point.t array -> Quad.t
    method init_from_rect : Rect.t -> Quad.t
    method as_quad : Quad.t
end

class quad : Quad.t -> quad_t

val alloc : unit -> quad_t
