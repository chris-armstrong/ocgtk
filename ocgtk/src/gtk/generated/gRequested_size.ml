class type requested_size_t = object
  method get_minimum_size : int
  method set_minimum_size : int -> unit
  method get_natural_size : int
  method set_natural_size : int -> unit
  method as_requested_size : Requested_size.t
end

(* High-level class for RequestedSize *)
class requested_size (obj : Requested_size.t) : requested_size_t =
  object (self)
    method get_minimum_size : int = Requested_size.get_minimum_size obj

    method set_minimum_size : int -> unit =
      fun v -> Requested_size.set_minimum_size obj v

    method get_natural_size : int = Requested_size.get_natural_size obj

    method set_natural_size : int -> unit =
      fun v -> Requested_size.set_natural_size obj v

    method as_requested_size = obj
  end

let make (minimum_size : int) (natural_size : int) : requested_size_t =
  new requested_size (Requested_size.make minimum_size natural_size)
