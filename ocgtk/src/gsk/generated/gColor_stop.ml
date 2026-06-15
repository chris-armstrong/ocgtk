class type color_stop_t = object
  method get_offset : float
  method set_offset : float -> unit
  method get_color : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
  method set_color : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit
  method as_color_stop : Color_stop.t
end

(* High-level class for ColorStop *)
class color_stop (obj : Color_stop.t) : color_stop_t =
  object (self)
    method get_offset : float = Color_stop.get_offset obj
    method set_offset : float -> unit = fun v -> Color_stop.set_offset obj v

    method get_color : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t =
      new Ocgtk_gdk.Gdk.Rgb_a.rgb_a (Color_stop.get_color obj)

    method set_color : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Color_stop.set_color obj v#as_rgb_a

    method as_color_stop = obj
  end

let make (offset : float) (color : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t) : color_stop_t =
  new color_stop (Color_stop.make offset color#as_rgb_a)
