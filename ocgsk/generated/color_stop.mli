class type color_stop_t = object
  method as_color_stop : Color_stop.t
end

class color_stop : Color_stop.t -> color_stop_t
