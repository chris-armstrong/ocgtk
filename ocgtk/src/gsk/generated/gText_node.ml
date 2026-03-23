class type text_node_t = object
    inherit GRender_node.render_node_t
    method get_color : unit -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
    method get_font : unit -> Ocgtk_pango.Pango.Font.font_t
    method get_num_glyphs : unit -> int
    method get_offset : unit -> Ocgtk_graphene.Graphene.Point.point_t
    method has_color_glyphs : unit -> bool
    method as_text_node : Text_node.t
end

(* High-level class for TextNode *)
class text_node (obj : Text_node.t) : text_node_t = object (self)
  inherit GRender_node.render_node (Obj.magic obj : Render_node.t)

  method get_color : unit -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t =
    fun () ->
      new  Ocgtk_gdk.Gdk.Rgb_a.rgb_a(Text_node.get_color obj)

  method get_font : unit -> Ocgtk_pango.Pango.Font.font_t =
    fun () ->
      new  Ocgtk_pango.Pango.Font.font(Text_node.get_font obj)

  method get_num_glyphs : unit -> int =
    fun () ->
      (Text_node.get_num_glyphs obj)

  method get_offset : unit -> Ocgtk_graphene.Graphene.Point.point_t =
    fun () ->
      new  Ocgtk_graphene.Graphene.Point.point(Text_node.get_offset obj)

  method has_color_glyphs : unit -> bool =
    fun () ->
      (Text_node.has_color_glyphs obj)

    method as_text_node = obj
end

let new_ (font : Ocgtk_pango.Pango.Font.font_t) (glyphs : Ocgtk_pango.Pango.Glyph_string.glyph_string_t) (color : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t) (offset : Ocgtk_graphene.Graphene.Point.point_t) : text_node_t =
  let font = font#as_font in
  let glyphs = glyphs#as_glyph_string in
  let color = color#as_rgb_a in
  let offset = offset#as_point in
  new text_node (Text_node.new_ font glyphs color offset)

