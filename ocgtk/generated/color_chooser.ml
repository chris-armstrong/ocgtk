class type color_chooser_t = object
  method add_palette :
    Enums.orientation -> int -> int -> Ocgdk.Raw.Rgb_a.t array option -> unit

  method get_use_alpha : unit -> bool
  method set_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  method set_use_alpha : bool -> unit
  method as_color_chooser : Raw.Color_chooser.t
end

(* High-level class for ColorChooser *)
class color_chooser (obj : Raw.Color_chooser.t) : color_chooser_t =
  object (self)
    method add_palette :
        Enums.orientation ->
        int ->
        int ->
        Ocgdk.Raw.Rgb_a.t array option ->
        unit =
      fun orientation colors_per_line n_colors colors ->
        Raw.Color_chooser.add_palette obj orientation colors_per_line n_colors
          colors

    method get_use_alpha : unit -> bool =
      fun () -> Raw.Color_chooser.get_use_alpha obj

    method set_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit =
      fun color ->
        let color = color#as_rgb_a in
        Raw.Color_chooser.set_rgba obj color

    method set_use_alpha : bool -> unit =
      fun use_alpha -> Raw.Color_chooser.set_use_alpha obj use_alpha

    method as_color_chooser = obj
  end
