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

(* High-level class for PrintContext *)
class print_context (obj : Raw.Print_context.t) : print_context_t =
  object (self)
    method create_pango_context : unit -> Ocpango.Context.context_t =
      fun () ->
        new Ocpango.Context.context (Raw.Print_context.create_pango_context obj)

    method create_pango_layout : unit -> Ocpango.Layout.layout_t =
      fun () ->
        new Ocpango.Layout.layout (Raw.Print_context.create_pango_layout obj)

    method get_cairo_context : unit -> Occairo.Context.context_t =
      fun () ->
        new Occairo.Context.context (Raw.Print_context.get_cairo_context obj)

    method get_dpi_x : unit -> float = fun () -> Raw.Print_context.get_dpi_x obj
    method get_dpi_y : unit -> float = fun () -> Raw.Print_context.get_dpi_y obj

    method get_height : unit -> float =
      fun () -> Raw.Print_context.get_height obj

    method get_page_setup : unit -> Page_setup.page_setup_t =
      fun () -> new Page_setup.page_setup (Raw.Print_context.get_page_setup obj)

    method get_pango_fontmap : unit -> Ocpango.Font_map.font_map_t =
      fun () ->
        new Ocpango.Font_map.font_map (Raw.Print_context.get_pango_fontmap obj)

    method get_width : unit -> float = fun () -> Raw.Print_context.get_width obj

    method set_cairo_context :
        Occairo.Context.context_t -> float -> float -> unit =
      fun cr dpi_x dpi_y ->
        let cr = cr#as_context in
        Raw.Print_context.set_cairo_context obj cr dpi_x dpi_y

    method as_print_context = obj
  end
