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

(* High-level class for Rectangle *)
class rectangle (obj : Rectangle.t) : rectangle_t =
  object (self)
    method get_x : float = Rectangle.get_x obj
    method set_x : float -> unit = fun v -> Rectangle.set_x obj v
    method get_y : float = Rectangle.get_y obj
    method set_y : float -> unit = fun v -> Rectangle.set_y obj v
    method get_width : float = Rectangle.get_width obj
    method set_width : float -> unit = fun v -> Rectangle.set_width obj v
    method get_height : float = Rectangle.get_height obj
    method set_height : float -> unit = fun v -> Rectangle.set_height obj v
    method as_rectangle = obj
  end

let make (x : float) (y : float) (width : float) (height : float) : rectangle_t
    =
  new rectangle (Rectangle.make x y width height)
