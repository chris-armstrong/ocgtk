class type rgb_a_t = object
  method equal : Rgb_a.t -> bool
  method hash : unit -> int
  method is_clear : unit -> bool
  method is_opaque : unit -> bool
  method parse : string -> bool
  method to_string : unit -> string
  method as_rgb_a : Rgb_a.t
end

class rgb_a : Rgb_a.t -> rgb_a_t
