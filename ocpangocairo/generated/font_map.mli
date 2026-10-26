class type font_map_t = object
  method get_font_type : unit -> Ocgtk_cairo.Cairo.fonttype
  method get_resolution : unit -> float
  method set_default : unit -> unit
  method set_resolution : float -> unit
  method as_font_map : Font_map.t
end

class font_map : Font_map.t -> font_map_t
