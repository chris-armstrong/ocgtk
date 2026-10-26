class type color_stop_t = object
  method as_color_stop : Color_stop.t
end

(* High-level class for ColorStop *)
class color_stop (obj : Color_stop.t) : color_stop_t =
  object (self)
    method as_color_stop = obj
  end
