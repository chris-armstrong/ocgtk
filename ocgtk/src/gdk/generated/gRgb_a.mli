class rgb_a : Rgb_a.t ->
  object
    method copy : unit -> Rgb_a.t
    method equal : Rgb_a.t -> bool
    method free : unit -> unit
    method hash : unit -> int
    method is_clear : unit -> bool
    method is_opaque : unit -> bool
    method parse : string -> bool
    method to_string : unit -> string
    method as_rgb_a : Rgb_a.t
  end

