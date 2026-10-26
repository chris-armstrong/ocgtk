class type size_t = object
  method equal : Raw.Size.t -> bool
  method init : float -> float -> Raw.Size.t
  method init_from_size : Raw.Size.t -> Raw.Size.t
  method as_size : Raw.Size.t
end

class size : Raw.Size.t -> size_t

val alloc : unit -> size_t
