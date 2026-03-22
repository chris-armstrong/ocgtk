class type size_t = object
    method equal : Size.t -> bool
    method free : unit -> unit
    method init : float -> float -> Size.t
    method init_from_size : Size.t -> Size.t
    method as_size : Size.t
end

(* High-level class for Size *)
class size (obj : Size.t) : size_t = object (self)

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

let alloc () : size_t =
  new size (Size.alloc ())

