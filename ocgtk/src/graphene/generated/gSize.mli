class type size_t = object
  method equal : Size.t -> bool
  method init : float -> float -> Size.t
  method init_from_size : Size.t -> Size.t
  method get_width : float
  method set_width : float -> unit
  method get_height : float
  method set_height : float -> unit
  method as_size : Size.t
end

class size : Size.t -> size_t

val alloc : unit -> size_t
val make : float -> float -> size_t
