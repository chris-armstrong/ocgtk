class type renderer_t = object
    method activate : unit -> unit
    method deactivate : unit -> unit
    method draw_error_underline : int -> int -> int -> int -> unit
    method draw_glyph_item : string option -> Glyph_item.t -> int -> int -> unit
    method draw_glyphs : GContext_and__font_and__font_map_and__fontset.font_t -> Glyph_string.t -> int -> int -> unit
    method draw_layout : GLayout_and__layout_iter.layout_t -> int -> int -> unit
    method draw_layout_line : Layout_line.t -> int -> int -> unit
    method draw_rectangle : Pango_enums.renderpart -> int -> int -> int -> int -> unit
    method draw_trapezoid : Pango_enums.renderpart -> float -> float -> float -> float -> float -> float -> unit
    method get_alpha : Pango_enums.renderpart -> UInt16.t
    method get_color : Pango_enums.renderpart -> Color.t option
    method get_layout : unit -> GLayout_and__layout_iter.layout_t option
    method get_layout_line : unit -> Layout_line.t option
    method get_matrix : unit -> Matrix.t option
    method part_changed : Pango_enums.renderpart -> unit
    method set_alpha : Pango_enums.renderpart -> UInt16.t -> unit
    method set_color : Pango_enums.renderpart -> Color.t option -> unit
    method set_matrix : Matrix.t option -> unit
    method as_renderer : Renderer.t
end

(* High-level class for Renderer *)
class renderer (obj : Renderer.t) : renderer_t = object (self)

  method activate : unit -> unit =
    fun () ->
      (Renderer.activate obj)

  method deactivate : unit -> unit =
    fun () ->
      (Renderer.deactivate obj)

  method draw_error_underline : int -> int -> int -> int -> unit =
    fun x y width height ->
      (Renderer.draw_error_underline obj x y width height)

  method draw_glyph_item : string option -> Glyph_item.t -> int -> int -> unit =
    fun text glyph_item x y ->
      (Renderer.draw_glyph_item obj text glyph_item x y)

  method draw_glyphs : GContext_and__font_and__font_map_and__fontset.font_t -> Glyph_string.t -> int -> int -> unit =
    fun font glyphs x y ->
      let font = font#as_font in
      (Renderer.draw_glyphs obj font glyphs x y)

  method draw_layout : GLayout_and__layout_iter.layout_t -> int -> int -> unit =
    fun layout x y ->
      let layout = layout#as_layout in
      (Renderer.draw_layout obj layout x y)

  method draw_layout_line : Layout_line.t -> int -> int -> unit =
    fun line x y ->
      (Renderer.draw_layout_line obj line x y)

  method draw_rectangle : Pango_enums.renderpart -> int -> int -> int -> int -> unit =
    fun part x y width height ->
      (Renderer.draw_rectangle obj part x y width height)

  method draw_trapezoid : Pango_enums.renderpart -> float -> float -> float -> float -> float -> float -> unit =
    fun part y1_ x11 x21 y2 x12 x22 ->
      (Renderer.draw_trapezoid obj part y1_ x11 x21 y2 x12 x22)

  method get_alpha : Pango_enums.renderpart -> UInt16.t =
    fun part ->
      (Renderer.get_alpha obj part)

  method get_color : Pango_enums.renderpart -> Color.t option =
    fun part ->
      (Renderer.get_color obj part)

  method get_layout : unit -> GLayout_and__layout_iter.layout_t option =
    fun () ->
      Option.map (fun ret -> new GLayout_and__layout_iter.layout ret) (Renderer.get_layout obj)

  method get_layout_line : unit -> Layout_line.t option =
    fun () ->
      (Renderer.get_layout_line obj)

  method get_matrix : unit -> Matrix.t option =
    fun () ->
      (Renderer.get_matrix obj)

  method part_changed : Pango_enums.renderpart -> unit =
    fun part ->
      (Renderer.part_changed obj part)

  method set_alpha : Pango_enums.renderpart -> UInt16.t -> unit =
    fun part alpha ->
      (Renderer.set_alpha obj part alpha)

  method set_color : Pango_enums.renderpart -> Color.t option -> unit =
    fun part color ->
      (Renderer.set_color obj part color)

  method set_matrix : Matrix.t option -> unit =
    fun matrix ->
      (Renderer.set_matrix obj matrix)

    method as_renderer = obj
end

