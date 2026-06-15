class type rectangle_int_t = object
  method get_x : int
  method set_x : int -> unit
  method get_y : int
  method set_y : int -> unit
  method get_width : int
  method set_width : int -> unit
  method get_height : int
  method set_height : int -> unit
  method as_rectangle_int : Rectangle_int.t
end

class rectangle_int : Rectangle_int.t -> rectangle_int_t

val make : int -> int -> int -> int -> rectangle_int_t
