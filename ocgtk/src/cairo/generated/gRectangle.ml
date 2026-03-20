class type rectangle_t = object
    method as_rectangle : Rectangle.t
end

(* High-level class for Rectangle *)
class rectangle (obj : Rectangle.t) : rectangle_t = object (self)

    method as_rectangle = obj
end

