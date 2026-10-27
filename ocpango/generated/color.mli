class type color_t = object
  method parse : string -> bool
  method to_string : unit -> string
  method as_color : Raw.Color.t
end

class color : Raw.Color.t -> color_t
