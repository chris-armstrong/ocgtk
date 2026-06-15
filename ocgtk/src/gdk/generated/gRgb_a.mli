class type rgb_a_t = object
  method equal : Rgb_a.t -> bool
  method hash : unit -> int
  method is_clear : unit -> bool
  method is_opaque : unit -> bool
  method parse : string -> bool
  method to_string : unit -> string
  method get_red : float
  method set_red : float -> unit
  method get_green : float
  method set_green : float -> unit
  method get_blue : float
  method set_blue : float -> unit
  method get_alpha : float
  method set_alpha : float -> unit
  method as_rgb_a : Rgb_a.t
end

class rgb_a : Rgb_a.t -> rgb_a_t

val make : float -> float -> float -> float -> rgb_a_t
