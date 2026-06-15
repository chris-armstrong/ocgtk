class type rectangle_t = object
  method get_x : float
  method set_x : float -> unit
  method get_y : float
  method set_y : float -> unit
  method get_width : float
  method set_width : float -> unit
  method get_height : float
  method set_height : float -> unit
  method as_rectangle : Rectangle.t
end

class rectangle : Rectangle.t -> rectangle_t

val make : float -> float -> float -> float -> rectangle_t
