class text_node : Text_node.t ->
  object
    method get_num_glyphs : unit -> int
    method has_color_glyphs : unit -> bool
    method as_text_node : Text_node.t
  end

