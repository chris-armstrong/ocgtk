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

(* High-level class for Color *)
class color (obj : Color.t) : color_t =
  object (self)
    method parse : string -> bool = fun spec -> Color.parse obj spec
    method to_string : unit -> string = fun () -> Color.to_string obj
    method get_red : UInt16.t = Color.get_red obj
    method set_red : UInt16.t -> unit = fun v -> Color.set_red obj v
    method get_green : UInt16.t = Color.get_green obj
    method set_green : UInt16.t -> unit = fun v -> Color.set_green obj v
    method get_blue : UInt16.t = Color.get_blue obj
    method set_blue : UInt16.t -> unit = fun v -> Color.set_blue obj v
    method as_color = obj
  end

let make (red : UInt16.t) (green : UInt16.t) (blue : UInt16.t) : color_t =
  new color (Color.make red green blue)
