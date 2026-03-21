class type quad_t = object
    method contains : Point.t -> bool
    method free : unit -> unit
    method get_point : int -> Point.t
    method init : Point.t -> Point.t -> Point.t -> Point.t -> Quad.t
    method init_from_points : Point.t array -> Quad.t
    method init_from_rect : Rect.t -> Quad.t
    method as_quad : Quad.t
end

(* High-level class for Quad *)
class quad (obj : Quad.t) : quad_t = object (self)

  method contains : Point.t -> bool =
    fun p ->
      (Quad.contains obj p)

  method free : unit -> unit =
    fun () ->
      (Quad.free obj)

  method get_point : int -> Point.t =
    fun index_ ->
      (Quad.get_point obj index_)

  method init : Point.t -> Point.t -> Point.t -> Point.t -> Quad.t =
    fun p1 p2 p3 p4 ->
      (Quad.init obj p1 p2 p3 p4)

  method init_from_points : Point.t array -> Quad.t =
    fun points ->
      (Quad.init_from_points obj points)

  method init_from_rect : Rect.t -> Quad.t =
    fun r ->
      (Quad.init_from_rect obj r)

    method as_quad = obj
end

