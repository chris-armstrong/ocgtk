class type renderer_t = object
  method activate : unit -> unit
  method deactivate : unit -> unit
  method draw_error_underline : int -> int -> int -> int -> unit

  method draw_glyph :
    Context_and__font_and__font_map_and__fontset.font_t ->
    int ->
    float ->
    float ->
    unit

  method draw_glyph_item :
    string option -> Raw.Glyph_item.t -> int -> int -> unit

  method draw_glyphs :
    Context_and__font_and__font_map_and__fontset.font_t ->
    Raw.Glyph_string.t ->
    int ->
    int ->
    unit

  method draw_layout : Layout_and__layout_iter.layout_t -> int -> int -> unit
  method draw_layout_line : Raw.Layout_line.t -> int -> int -> unit
  method draw_rectangle : Enums.renderpart -> int -> int -> int -> int -> unit

  method draw_trapezoid :
    Enums.renderpart ->
    float ->
    float ->
    float ->
    float ->
    float ->
    float ->
    unit

  method get_alpha : Enums.renderpart -> UInt16.t
  method get_color : Enums.renderpart -> Raw.Color.t option
  method get_layout : unit -> Layout_and__layout_iter.layout_t option
  method get_layout_line : unit -> Raw.Layout_line.t option
  method get_matrix : unit -> Raw.Matrix.t option
  method part_changed : Enums.renderpart -> unit
  method set_alpha : Enums.renderpart -> UInt16.t -> unit
  method set_color : Enums.renderpart -> Raw.Color.t option -> unit
  method set_matrix : Raw.Matrix.t option -> unit
  method as_renderer : Raw.Renderer.t
end

(* High-level class for Renderer *)
class renderer (obj : Raw.Renderer.t) : renderer_t =
  object (self)
    method activate : unit -> unit = fun () -> Raw.Renderer.activate obj
    method deactivate : unit -> unit = fun () -> Raw.Renderer.deactivate obj

    method draw_error_underline : int -> int -> int -> int -> unit =
      fun x y width height ->
        Raw.Renderer.draw_error_underline obj x y width height

    method draw_glyph :
        Context_and__font_and__font_map_and__fontset.font_t ->
        int ->
        float ->
        float ->
        unit =
      fun font glyph x y ->
        let font = font#as_font in
        Raw.Renderer.draw_glyph obj font glyph x y

    method draw_glyph_item :
        string option -> Raw.Glyph_item.t -> int -> int -> unit =
      fun text glyph_item x y ->
        Raw.Renderer.draw_glyph_item obj text glyph_item x y

    method draw_glyphs :
        Context_and__font_and__font_map_and__fontset.font_t ->
        Raw.Glyph_string.t ->
        int ->
        int ->
        unit =
      fun font glyphs x y ->
        let font = font#as_font in
        Raw.Renderer.draw_glyphs obj font glyphs x y

    method draw_layout : Layout_and__layout_iter.layout_t -> int -> int -> unit
        =
      fun layout x y ->
        let layout = layout#as_layout in
        Raw.Renderer.draw_layout obj layout x y

    method draw_layout_line : Raw.Layout_line.t -> int -> int -> unit =
      fun line x y -> Raw.Renderer.draw_layout_line obj line x y

    method draw_rectangle : Enums.renderpart -> int -> int -> int -> int -> unit
        =
      fun part x y width height ->
        Raw.Renderer.draw_rectangle obj part x y width height

    method draw_trapezoid :
        Enums.renderpart ->
        float ->
        float ->
        float ->
        float ->
        float ->
        float ->
        unit =
      fun part y1_ x11 x21 y2 x12 x22 ->
        Raw.Renderer.draw_trapezoid obj part y1_ x11 x21 y2 x12 x22

    method get_alpha : Enums.renderpart -> UInt16.t =
      fun part -> Raw.Renderer.get_alpha obj part

    method get_color : Enums.renderpart -> Raw.Color.t option =
      fun part -> Raw.Renderer.get_color obj part

    method get_layout : unit -> Layout_and__layout_iter.layout_t option =
      fun () ->
        Option.map
          (fun ret -> new Layout_and__layout_iter.layout ret)
          (Raw.Renderer.get_layout obj)

    method get_layout_line : unit -> Raw.Layout_line.t option =
      fun () -> Raw.Renderer.get_layout_line obj

    method get_matrix : unit -> Raw.Matrix.t option =
      fun () -> Raw.Renderer.get_matrix obj

    method part_changed : Enums.renderpart -> unit =
      fun part -> Raw.Renderer.part_changed obj part

    method set_alpha : Enums.renderpart -> UInt16.t -> unit =
      fun part alpha -> Raw.Renderer.set_alpha obj part alpha

    method set_color : Enums.renderpart -> Raw.Color.t option -> unit =
      fun part color -> Raw.Renderer.set_color obj part color

    method set_matrix : Raw.Matrix.t option -> unit =
      fun matrix -> Raw.Renderer.set_matrix obj matrix

    method as_renderer = obj
  end
