class type color_t = object
  method parse : string -> bool
  method to_string : unit -> string
  method as_color : Raw.Color.t
end

(* High-level class for Color *)
class color (obj : Raw.Color.t) : color_t =
  object (self)
    method parse : string -> bool = fun spec -> Raw.Color.parse obj spec
    method to_string : unit -> string = fun () -> Raw.Color.to_string obj
    method as_color = obj
  end
