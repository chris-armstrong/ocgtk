class type rectangle_t = object
  method contains_point : int -> int -> bool
  method equal : Raw.Rectangle.t -> bool
  method as_rectangle : Raw.Rectangle.t
end

class rectangle : Raw.Rectangle.t -> rectangle_t
