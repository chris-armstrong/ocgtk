(* High-level class for TextNode *)
class text_node (obj : Text_node.t) = object (self)

  method get_num_glyphs : unit -> int =
    fun () ->
      (Text_node.get_num_glyphs obj)

  method has_color_glyphs : unit -> bool =
    fun () ->
      (Text_node.has_color_glyphs obj)

    method as_text_node = obj
end

