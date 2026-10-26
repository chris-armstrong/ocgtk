class type print_context_t = object
  method create_pango_context : unit -> Ocgtk_pango.Pango.Context.context_t
  method create_pango_layout : unit -> Ocgtk_pango.Pango.Layout.layout_t
  method get_cairo_context : unit -> Ocgtk_cairo.Cairo.Context.context_t
  method get_dpi_x : unit -> float
  method get_dpi_y : unit -> float
  method get_height : unit -> float
  method get_page_setup : unit -> GPage_setup.page_setup_t
  method get_pango_fontmap : unit -> Ocgtk_pango.Pango.Font_map.font_map_t
  method get_width : unit -> float

  method set_cairo_context :
    Ocgtk_cairo.Cairo.Context.context_t -> float -> float -> unit

  method as_print_context : Print_context.t
end

class print_context : Print_context.t -> print_context_t
