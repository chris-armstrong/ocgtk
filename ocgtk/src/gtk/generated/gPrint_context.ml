(* High-level class for PrintContext *)
class print_context (obj : Print_context.t) = object (self)

  method create_pango_context : unit -> Ocgtk_pango.Pango.context =
    fun () ->
      new  Ocgtk_pango.Pango.context(Print_context.create_pango_context obj)

  method create_pango_layout : unit -> Ocgtk_pango.Pango.layout =
    fun () ->
      new  Ocgtk_pango.Pango.layout(Print_context.create_pango_layout obj)

  method get_cairo_context : unit -> Ocgtk_cairo.Cairo.context =
    fun () ->
      new  Ocgtk_cairo.Cairo.context(Print_context.get_cairo_context obj)

  method get_dpi_x : unit -> float =
    fun () ->
      (Print_context.get_dpi_x obj)

  method get_dpi_y : unit -> float =
    fun () ->
      (Print_context.get_dpi_y obj)

  method get_height : unit -> float =
    fun () ->
      (Print_context.get_height obj)

  method get_pango_fontmap : unit -> Ocgtk_pango.Pango.font_map =
    fun () ->
      new  Ocgtk_pango.Pango.font_map(Print_context.get_pango_fontmap obj)

  method get_width : unit -> float =
    fun () ->
      (Print_context.get_width obj)

  method set_cairo_context : 'p1. (#Ocgtk_cairo.Cairo.context as 'p1) -> float -> float -> unit =
    fun cr dpi_x dpi_y ->
      let cr = cr#as_context in
      (Print_context.set_cairo_context obj cr dpi_x dpi_y)

    method as_print_context = obj
end

