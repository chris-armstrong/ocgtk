class text_node : Text_node.t ->
  object
    method get_color : unit -> Ocgtk_gdk.Gdk.rgb_a
    method get_font : unit -> Ocgtk_pango.Pango.font
    method get_num_glyphs : unit -> int
    method get_offset : unit -> Ocgtk_graphene.Graphene.point
    method has_color_glyphs : unit -> bool
    method as_text_node : Text_node.t
  end

