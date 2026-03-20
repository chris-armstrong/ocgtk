class type size_t = object
    method equal : Size.t -> bool
    method free : unit -> unit
    method init : float -> float -> Size.t
    method init_from_size : Size.t -> Size.t
    method as_size : Size.t
end

class size : Size.t -> size_t

