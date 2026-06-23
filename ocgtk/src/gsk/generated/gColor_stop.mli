class type color_stop_t = object
  method get_offset : float
  method set_offset : float -> unit
  method get_color : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
  method set_color : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit
  method as_color_stop : Color_stop.t
end

class color_stop : Color_stop.t -> color_stop_t

val make : float -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> color_stop_t
