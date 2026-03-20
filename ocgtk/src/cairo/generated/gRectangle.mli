class type rectangle_t = object
    method as_rectangle : Rectangle.t
end

class rectangle : Rectangle.t -> rectangle_t

