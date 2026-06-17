class type rectangle_t = object
  method contains_point : int -> int -> bool
  method equal : Rectangle.t -> bool
  method as_rectangle : Rectangle.t
end

(* High-level class for Rectangle *)
class rectangle (obj : Rectangle.t) : rectangle_t =
  object (self)
    method contains_point : int -> int -> bool =
      fun x y -> Rectangle.contains_point obj x y

    method equal : Rectangle.t -> bool = fun rect2 -> Rectangle.equal obj rect2
    method as_rectangle = obj
  end
