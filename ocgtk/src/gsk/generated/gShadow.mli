class type shadow_t = object
  method get_color : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
  method set_color : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit
  method get_dx : float
  method set_dx : float -> unit
  method get_dy : float
  method set_dy : float -> unit
  method get_radius : float
  method set_radius : float -> unit
  method as_shadow : Shadow.t
end

class shadow : Shadow.t -> shadow_t

val make : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> float -> float -> float -> shadow_t
