class type color_chooser_t = object
  method add_palette :
    Enums.orientation -> int -> int -> Ocgdk.Raw.Rgb_a.t array option -> unit

  method get_use_alpha : unit -> bool
  method set_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  method set_use_alpha : bool -> unit
  method as_color_chooser : Raw.Color_chooser.t
end

class color_chooser : Raw.Color_chooser.t -> color_chooser_t
