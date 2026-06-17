class type rectangle_t = object
    method contains_point : int -> int -> bool
    method equal : Rectangle.t -> bool
    method as_rectangle : Rectangle.t
end

class rectangle : Rectangle.t -> rectangle_t

