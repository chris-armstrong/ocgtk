(* High-level class for Point *)
class point (obj : Point.t) = object (self)

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

