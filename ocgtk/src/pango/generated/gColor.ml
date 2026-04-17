class type color_t = object
    method copy : unit -> Color.t option
    method free : unit -> unit
    method parse : string -> bool
    method to_string : unit -> string
    method as_color : Color.t
end

(* High-level class for Color *)
class color (obj : Color.t) : color_t = object (self)

  method copy : unit -> Color.t option =
    fun () ->
      (Color.copy obj)

  method free : unit -> unit =
    fun () ->
      (Color.free obj)

  method parse : string -> bool =
    fun spec ->
      (Color.parse obj spec)

  method to_string : unit -> string =
    fun () ->
      (Color.to_string obj)

    method as_color = obj
end

