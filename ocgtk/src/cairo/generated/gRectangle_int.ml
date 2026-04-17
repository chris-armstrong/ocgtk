class type rectangle_int_t = object
    method as_rectangle_int : Rectangle_int.t
end

(* High-level class for RectangleInt *)
class rectangle_int (obj : Rectangle_int.t) : rectangle_int_t = object (self)

    method as_rectangle_int = obj
end

