class type rectangle_t = object
  method contains_point : int -> int -> bool
  method equal : Rectangle.t -> bool
  method get_x : int
  method set_x : int -> unit
  method get_y : int
  method set_y : int -> unit
  method get_width : int
  method set_width : int -> unit
  method get_height : int
  method set_height : int -> unit
  method as_rectangle : Rectangle.t
end

class rectangle : Rectangle.t -> rectangle_t

val make : int -> int -> int -> int -> rectangle_t
