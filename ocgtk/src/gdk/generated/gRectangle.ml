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

(* High-level class for Rectangle *)
class rectangle (obj : Rectangle.t) : rectangle_t =
  object (self)
    method contains_point : int -> int -> bool =
      fun x y -> Rectangle.contains_point obj x y

    method equal : Rectangle.t -> bool = fun rect2 -> Rectangle.equal obj rect2
    method get_x : int = Rectangle.get_x obj
    method set_x : int -> unit = fun v -> Rectangle.set_x obj v
    method get_y : int = Rectangle.get_y obj
    method set_y : int -> unit = fun v -> Rectangle.set_y obj v
    method get_width : int = Rectangle.get_width obj
    method set_width : int -> unit = fun v -> Rectangle.set_width obj v
    method get_height : int = Rectangle.get_height obj
    method set_height : int -> unit = fun v -> Rectangle.set_height obj v
    method as_rectangle = obj
  end

let make (x : int) (y : int) (width : int) (height : int) : rectangle_t =
  new rectangle (Rectangle.make x y width height)
