class type quad_t = object
  method contains : Raw.Point.t -> bool
  method get_point : int -> Raw.Point.t

  method init :
    Raw.Point.t -> Raw.Point.t -> Raw.Point.t -> Raw.Point.t -> Raw.Quad.t

  method init_from_points : Raw.Point.t array -> Raw.Quad.t
  method init_from_rect : Raw.Rect.t -> Raw.Quad.t
  method as_quad : Raw.Quad.t
end

(* High-level class for Quad *)
class quad (obj : Raw.Quad.t) : quad_t =
  object (self)
    method contains : Raw.Point.t -> bool = fun p -> Raw.Quad.contains obj p

    method get_point : int -> Raw.Point.t =
      fun index_ -> Raw.Quad.get_point obj index_

    method init :
        Raw.Point.t -> Raw.Point.t -> Raw.Point.t -> Raw.Point.t -> Raw.Quad.t =
      fun p1 p2 p3 p4 -> Raw.Quad.init obj p1 p2 p3 p4

    method init_from_points : Raw.Point.t array -> Raw.Quad.t =
      fun points -> Raw.Quad.init_from_points obj points

    method init_from_rect : Raw.Rect.t -> Raw.Quad.t =
      fun r -> Raw.Quad.init_from_rect obj r

    method as_quad = obj
  end

let alloc () : quad_t = new quad (Raw.Quad.alloc ())
