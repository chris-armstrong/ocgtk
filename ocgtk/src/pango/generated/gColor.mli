class type color_t = object
  method parse : string -> bool
  method to_string : unit -> string
  method get_red : UInt16.t
  method set_red : UInt16.t -> unit
  method get_green : UInt16.t
  method set_green : UInt16.t -> unit
  method get_blue : UInt16.t
  method set_blue : UInt16.t -> unit
  method as_color : Color.t
end

class color : Color.t -> color_t

val make : UInt16.t -> UInt16.t -> UInt16.t -> color_t
