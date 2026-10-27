class type size_t = object
  method equal : Raw.Size.t -> bool
  method init : float -> float -> Raw.Size.t
  method init_from_size : Raw.Size.t -> Raw.Size.t
  method as_size : Raw.Size.t
end

(* High-level class for Size *)
class size (obj : Raw.Size.t) : size_t =
  object (self)
    method equal : Raw.Size.t -> bool = fun b -> Raw.Size.equal obj b

    method init : float -> float -> Raw.Size.t =
      fun width height -> Raw.Size.init obj width height

    method init_from_size : Raw.Size.t -> Raw.Size.t =
      fun src -> Raw.Size.init_from_size obj src

    method as_size = obj
  end

let alloc () : size_t = new size (Raw.Size.alloc ())
