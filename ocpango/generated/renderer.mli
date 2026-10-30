(** [PangoRenderer] is a base class for objects that can render text provided as
    [PangoGlyphString] or [PangoLayout].

    Its methods, signals and properties are on {!class-type-renderer_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocpango.Raw.Renderer}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Renderer].}

    [PangoRenderer] is a base class for objects that can render text provided as
    [PangoGlyphString] or [PangoLayout].

    By subclassing [PangoRenderer] and overriding operations such as
    [draw_glyphs] and [draw_rectangle], renderers for particular font backends
    and destinations can be created. *)
class type renderer_t = object
  (** {2:methods Methods} *)

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

  method draw_glyph : Font.font_t -> int -> float -> float -> unit
  (** Draws a single glyph with coordinates in device space. *)

  method draw_glyph_item :
    string option -> Raw.Glyph_item.t -> int -> int -> unit
  (** Draws the glyphs in [glyph_item] with the specified [PangoRenderer],
      embedding the text associated with the glyphs in the output if the output
      format supports it.

      This is useful for rendering text in PDF.

      Note that this method does not handle attributes in [glyph_item]. If you
      want colors, shapes and lines handled automatically according to those
      attributes, you need to use [pango_renderer_draw_layout_line ()] or
      [pango_renderer_draw_layout ()].

      Note that [text] is the start of the text for layout, which is then
      indexed by [glyph_item->item->offset].

      If [text] is [None], this simply calls [Pango.Renderer.draw_glyphs].

      The default implementation of this method simply falls back to
      [Pango.Renderer.draw_glyphs]. *)

  method draw_glyphs : Font.font_t -> Raw.Glyph_string.t -> int -> int -> unit
  (** Draws the glyphs in [glyphs] with the specified [PangoRenderer]. *)

  method draw_layout : Layout.layout_t -> int -> int -> unit
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

  method get_layout : unit -> Layout.layout_t option
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

  (** {2:conversions Conversions} *)

  method as_renderer : Raw.Renderer.t
end

class renderer : Raw.Renderer.t -> renderer_t
(** Wraps a raw handle of {!Ocpango.Raw.Renderer.t}. *)

(** {1:description Description}

    [PangoRenderer] is a base class for objects that can render text provided as
    [PangoGlyphString] or [PangoLayout].

    By subclassing [PangoRenderer] and overriding operations such as
    [draw_glyphs] and [draw_rectangle], renderers for particular font backends
    and destinations can be created. *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
