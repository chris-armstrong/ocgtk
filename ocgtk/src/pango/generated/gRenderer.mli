class renderer : Renderer.t ->
  object
    method activate : unit -> unit
    method deactivate : unit -> unit
    method draw_error_underline : int -> int -> int -> int -> unit
    method draw_glyph_item : string option -> Glyph_item.t -> int -> int -> unit
    method draw_glyphs : #GContext_and__font_and__font_map_and__fontset.font -> Glyph_string.t -> int -> int -> unit
    method draw_layout : #GLayout_and__layout_iter.layout -> int -> int -> unit
    method draw_layout_line : Layout_line.t -> int -> int -> unit
    method draw_rectangle : Pango_enums.renderpart -> int -> int -> int -> int -> unit
    method draw_trapezoid : Pango_enums.renderpart -> float -> float -> float -> float -> float -> float -> unit
    method get_color : Pango_enums.renderpart -> Color.t option
    method get_layout : unit -> GLayout_and__layout_iter.layout option
    method get_layout_line : unit -> Layout_line.t option
    method get_matrix : unit -> Matrix.t option
    method part_changed : Pango_enums.renderpart -> unit
    method set_color : Pango_enums.renderpart -> Color.t option -> unit
    method set_matrix : Matrix.t option -> unit
    method as_renderer : Renderer.t
  end

