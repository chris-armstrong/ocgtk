(* High-level class for Size *)
class size (obj : Size.t) = object (self)

  method equal : Size.t -> bool =
    fun b ->
      (Size.equal obj b)

  method free : unit -> unit =
    fun () ->
      (Size.free obj)

  method init : float -> float -> Size.t =
    fun width height ->
      (Size.init obj width height)

  method init_from_size : Size.t -> Size.t =
    fun src ->
      (Size.init_from_size obj src)

    method as_size = obj
end

