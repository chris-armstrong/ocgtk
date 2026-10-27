(** A render node drawing a set of glyphs.

    Its methods, signals and properties are on {!class-type-text_node_t}. The
    functions it is built on are in {!Ocgsk.Raw.Text_node}. *)

(** The methods, signals and properties of a [GskTextNode]. *)
class type text_node_t = object
  inherit Render_node.render_node_t

  method get_color : unit -> Ocgdk.Rgb_a.rgb_a_t
  (** Retrieves the color used by the text [node].

      The value returned by this function will not be correct if the render node
      was created for a non-sRGB color. *)

  method get_font : unit -> Ocpango.Font.font_t
  (** Returns the font used by the text [node]. *)

  method get_num_glyphs : unit -> int
  (** Retrieves the number of glyphs in the text node. *)

  method get_offset : unit -> Ocgraphene.Point.point_t
  (** Retrieves the offset applied to the text. *)

  method has_color_glyphs : unit -> bool
  (** Checks whether the text [node] has color glyphs. *)

  method as_text_node : Raw.Text_node.t
end

class text_node : Raw.Text_node.t -> text_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Text_node.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GskTextNode], give one already wrapped. *)

val new_ :
  Ocpango.Font.font_t ->
  Ocpango.Glyph_string.glyph_string_t ->
  Ocgdk.Rgb_a.rgb_a_t ->
  Ocgraphene.Point.point_t ->
  text_node_t
