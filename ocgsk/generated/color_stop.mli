class type color_stop_t = object
  method as_color_stop : Raw.Color_stop.t
end

class color_stop : Raw.Color_stop.t -> color_stop_t
