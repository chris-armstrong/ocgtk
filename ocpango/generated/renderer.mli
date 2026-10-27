(** [PangoRenderer] is a base class for objects that can render text provided as
    [PangoGlyphString] or [PangoLayout].

    By subclassing [PangoRenderer] and overriding operations such as
    [draw_glyphs] and [draw_rectangle], renderers for particular font backends
    and destinations can be created.

    Its methods, signals and properties are on {!class-type-renderer_t}. The
    functions it is built on are in {!Ocpango.Raw.Renderer}. *)

(** The methods, signals and properties of a [PangoRenderer]. *)
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

class renderer : Raw.Renderer.t -> renderer_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Renderer.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoRenderer], give one already wrapped. *)
