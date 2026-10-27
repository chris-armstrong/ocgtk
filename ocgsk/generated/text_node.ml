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

(* High-level class for TextNode *)
class text_node (obj : Raw.Text_node.t) : text_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_color : unit -> Ocgdk.Rgb_a.rgb_a_t =
      fun () -> new Ocgdk.Rgb_a.rgb_a (Raw.Text_node.get_color obj)

    method get_font : unit -> Ocpango.Font.font_t =
      fun () -> new Ocpango.Font.font (Raw.Text_node.get_font obj)

    method get_num_glyphs : unit -> int =
      fun () -> Raw.Text_node.get_num_glyphs obj

    method get_offset : unit -> Ocgraphene.Point.point_t =
      fun () -> new Ocgraphene.Point.point (Raw.Text_node.get_offset obj)

    method has_color_glyphs : unit -> bool =
      fun () -> Raw.Text_node.has_color_glyphs obj

    method as_text_node = obj
  end

let new_ (font : Ocpango.Font.font_t)
    (glyphs : Ocpango.Glyph_string.glyph_string_t) (color : Ocgdk.Rgb_a.rgb_a_t)
    (offset : Ocgraphene.Point.point_t) : text_node_t =
  let font = font#as_font in
  let glyphs = glyphs#as_glyph_string in
  let color = color#as_rgb_a in
  let offset = offset#as_point in
  let obj_ = Raw.Text_node.new_ font glyphs color offset in
  new text_node obj_
