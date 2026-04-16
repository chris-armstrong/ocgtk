class type color_t = object
  method copy : unit -> Color.t option
  method free : unit -> unit
  method parse : string -> bool
  method to_string : unit -> string
  method as_color : Color.t
end

class color : Color.t -> color_t
