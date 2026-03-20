class type text_node_t = object
    method get_color : unit -> Ocgtk_gdk.Gdk.rgb_a_t
    method get_font : unit -> Ocgtk_pango.Pango.font_t
    method get_num_glyphs : unit -> int
    method get_offset : unit -> Ocgtk_graphene.Graphene.point_t
    method has_color_glyphs : unit -> bool
    method as_text_node : Text_node.t
end

(* High-level class for TextNode *)
class text_node (obj : Text_node.t) : text_node_t = object (self)

  method get_color : unit -> Ocgtk_gdk.Gdk.rgb_a_t =
    fun () ->
      new  Ocgtk_gdk.Gdk.rgb_a(Text_node.get_color obj)

  method get_font : unit -> Ocgtk_pango.Pango.font_t =
    fun () ->
      new  Ocgtk_pango.Pango.font(Text_node.get_font obj)

  method get_num_glyphs : unit -> int =
    fun () ->
      (Text_node.get_num_glyphs obj)

  method get_offset : unit -> Ocgtk_graphene.Graphene.point_t =
    fun () ->
      new  Ocgtk_graphene.Graphene.point(Text_node.get_offset obj)

  method has_color_glyphs : unit -> bool =
    fun () ->
      (Text_node.has_color_glyphs obj)

    method as_text_node = obj
end

