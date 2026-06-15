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

(* High-level class for Shadow *)
class shadow (obj : Shadow.t) : shadow_t =
  object (self)
    method get_color : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t =
      new Ocgtk_gdk.Gdk.Rgb_a.rgb_a (Shadow.get_color obj)

    method set_color : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Shadow.set_color obj v#as_rgb_a

    method get_dx : float = Shadow.get_dx obj
    method set_dx : float -> unit = fun v -> Shadow.set_dx obj v
    method get_dy : float = Shadow.get_dy obj
    method set_dy : float -> unit = fun v -> Shadow.set_dy obj v
    method get_radius : float = Shadow.get_radius obj
    method set_radius : float -> unit = fun v -> Shadow.set_radius obj v
    method as_shadow = obj
  end

let make (color : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t) (dx : float) (dy : float)
    (radius : float) : shadow_t =
  new shadow (Shadow.make color#as_rgb_a dx dy radius)
