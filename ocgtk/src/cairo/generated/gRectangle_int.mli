class type rectangle_int_t = object
    method as_rectangle_int : Rectangle_int.t
end

class rectangle_int : Rectangle_int.t -> rectangle_int_t

