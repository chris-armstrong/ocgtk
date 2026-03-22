class type point_t = object
    method equal : Point.t -> bool
    method free : unit -> unit
    method init : float -> float -> Point.t
    method init_from_point : Point.t -> Point.t
    method init_from_vec2 : Vec2.t -> Point.t
    method near : Point.t -> float -> bool
    method as_point : Point.t
end

(* High-level class for Point *)
class point (obj : Point.t) : point_t = object (self)

  method equal : Point.t -> bool =
    fun b ->
      (Point.equal obj b)

  method free : unit -> unit =
    fun () ->
      (Point.free obj)

  method init : float -> float -> Point.t =
    fun x y ->
      (Point.init obj x y)

  method init_from_point : Point.t -> Point.t =
    fun src ->
      (Point.init_from_point obj src)

  method init_from_vec2 : Vec2.t -> Point.t =
    fun src ->
      (Point.init_from_vec2 obj src)

  method near : Point.t -> float -> bool =
    fun b epsilon ->
      (Point.near obj b epsilon)

    method as_point = obj
end

let alloc () : point_t =
  new point (Point.alloc ())

