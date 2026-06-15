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

(* High-level class for RectangleInt *)
class rectangle_int (obj : Rectangle_int.t) : rectangle_int_t =
  object (self)
    method get_x : int = Rectangle_int.get_x obj
    method set_x : int -> unit = fun v -> Rectangle_int.set_x obj v
    method get_y : int = Rectangle_int.get_y obj
    method set_y : int -> unit = fun v -> Rectangle_int.set_y obj v
    method get_width : int = Rectangle_int.get_width obj
    method set_width : int -> unit = fun v -> Rectangle_int.set_width obj v
    method get_height : int = Rectangle_int.get_height obj
    method set_height : int -> unit = fun v -> Rectangle_int.set_height obj v
    method as_rectangle_int = obj
  end

let make (x : int) (y : int) (width : int) (height : int) : rectangle_int_t =
  new rectangle_int (Rectangle_int.make x y width height)
