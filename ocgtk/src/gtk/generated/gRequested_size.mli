class type requested_size_t = object
  method get_minimum_size : int
  method set_minimum_size : int -> unit
  method get_natural_size : int
  method set_natural_size : int -> unit
  method as_requested_size : Requested_size.t
end

class requested_size : Requested_size.t -> requested_size_t

val make : int -> int -> requested_size_t
