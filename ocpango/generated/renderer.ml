class type renderer_t = object
  method activate : unit -> unit
  (** Does initial setup before rendering operations on [renderer].

      [Pango.Renderer.deactivate] should be called when done drawing. Calls such
      as [Pango.Renderer.draw_layout] automatically activate the layout before
      drawing on it.

      Calls to [Pango.Renderer.activate] and [Pango.Renderer.deactivate] can be
      nested and the renderer will only be initialized and deinitialized once.
  *)

  method deactivate : unit -> unit
  (** Cleans up after rendering operations on [renderer].

      See docs for [Pango.Renderer.activate]. *)

  method draw_error_underline : int -> int -> int -> int -> unit
  (** Draw a squiggly line that approximately covers the given rectangle in the
      style of an underline used to indicate a spelling error.

      The width of the underline is rounded to an integer number of up/down
      segments and the resulting rectangle is centered in the original
      rectangle.

      This should be called while [renderer] is already active. Use
      [Pango.Renderer.activate] to activate a renderer. *)

  method draw_glyph :
    Context_and__font_and__font_map_and__fontset.font_t ->
    int ->
    float ->
    float ->
    unit
  (** Draws a single glyph with coordinates in device space. *)

  method draw_glyph_item :
    string option -> Raw.Glyph_item.t -> int -> int -> unit
  (** Draws the glyphs in [glyph_item] with the specified [PangoRenderer],
      embedding the text associated with the glyphs in the output if the output
      format supports it.

      This is useful for rendering text in PDF.

      Note that this method does not handle attributes in [glyph_item]. If you
      want colors, shapes and lines handled automatically according to those
      attributes, you need to use pango_renderer_draw_layout_line() or
      pango_renderer_draw_layout().

      Note that [text] is the start of the text for layout, which is then
      indexed by [glyph_item->item->offset].

      If [text] is [NULL], this simply calls [Pango.Renderer.draw_glyphs].

      The default implementation of this method simply falls back to
      [Pango.Renderer.draw_glyphs]. *)

  method draw_glyphs :
    Context_and__font_and__font_map_and__fontset.font_t ->
    Raw.Glyph_string.t ->
    int ->
    int ->
    unit
  (** Draws the glyphs in [glyphs] with the specified [PangoRenderer]. *)

  method draw_layout : Layout_and__layout_iter.layout_t -> int -> int -> unit
  (** Draws [layout] with the specified [PangoRenderer].

      This is equivalent to drawing the lines of the layout, at their respective
      positions relative to [x], [y]. *)

  method draw_layout_line : Raw.Layout_line.t -> int -> int -> unit
  (** Draws [line] with the specified [PangoRenderer].

      This draws the glyph items that make up the line, as well as shapes,
      backgrounds and lines that are specified by the attributes of those items.
  *)

  method draw_rectangle : Enums.renderpart -> int -> int -> int -> int -> unit
  (** Draws an axis-aligned rectangle in user space coordinates with the
      specified [PangoRenderer].

      This should be called while [renderer] is already active. Use
      [Pango.Renderer.activate] to activate a renderer. *)

  method draw_trapezoid :
    Enums.renderpart ->
    float ->
    float ->
    float ->
    float ->
    float ->
    float ->
    unit
  (** Draws a trapezoid with the parallel sides aligned with the X axis using
      the given [PangoRenderer]; coordinates are in device space. *)

  method get_alpha : Enums.renderpart -> UInt16.t
  (** Gets the current alpha for the specified part. *)

  method get_color : Enums.renderpart -> Raw.Color.t option
  (** Gets the current rendering color for the specified part. *)

  method get_layout : unit -> Layout_and__layout_iter.layout_t option
  (** Gets the layout currently being rendered using [renderer].

      Calling this function only makes sense from inside a subclass's methods,
      like in its draw_shape vfunc, for example.

      The returned layout should not be modified while still being rendered. *)

  method get_layout_line : unit -> Raw.Layout_line.t option
  (** Gets the layout line currently being rendered using [renderer].

      Calling this function only makes sense from inside a subclass's methods,
      like in its draw_shape vfunc, for example.

      The returned layout line should not be modified while still being
      rendered. *)

  method get_matrix : unit -> Raw.Matrix.t option
  (** Gets the transformation matrix that will be applied when rendering.

      See [Pango.Renderer.set_matrix]. *)

  method part_changed : Enums.renderpart -> unit
  (** Informs Pango that the way that the rendering is done for [part] has
      changed.

      This should be called if the rendering changes in a way that would prevent
      multiple pieces being joined together into one drawing call. For instance,
      if a subclass of [PangoRenderer] was to add a stipple option for drawing
      underlines, it needs to call

      {[
      pango_renderer_part_changed (render, PANGO_RENDER_PART_UNDERLINE)
      ]}

      When the stipple changes or underlines with different stipples might be
      joined together. Pango automatically calls this for changes to colors.
      (See [Pango.Renderer.set_color]) *)

  method set_alpha : Enums.renderpart -> UInt16.t -> unit
  (** Sets the alpha for part of the rendering.

      Note that the alpha may only be used if a color is specified for [part] as
      well. *)

  method set_color : Enums.renderpart -> Raw.Color.t option -> unit
  (** Sets the color for part of the rendering.

      Also see [Pango.Renderer.set_alpha]. *)

  method set_matrix : Raw.Matrix.t option -> unit
  (** Sets the transformation matrix that will be applied when rendering. *)

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
