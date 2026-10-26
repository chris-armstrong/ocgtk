class type print_context_t = object
  method create_pango_context : unit -> Ocpango.Context.context_t
  method create_pango_layout : unit -> Ocpango.Layout.layout_t
  method get_cairo_context : unit -> Occairo.Context.context_t
  method get_dpi_x : unit -> float
  method get_dpi_y : unit -> float
  method get_height : unit -> float
  method get_page_setup : unit -> Page_setup.page_setup_t
  method get_pango_fontmap : unit -> Ocpango.Font_map.font_map_t
  method get_width : unit -> float
  method set_cairo_context : Occairo.Context.context_t -> float -> float -> unit
  method as_print_context : Raw.Print_context.t
end

class print_context : Raw.Print_context.t -> print_context_t
