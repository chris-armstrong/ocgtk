class type rectangle_int_t = object
  method as_rectangle_int : Raw.Rectangle_int.t
end

class rectangle_int : Raw.Rectangle_int.t -> rectangle_int_t
