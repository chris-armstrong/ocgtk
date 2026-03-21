class type color_node_t = object
    method get_color : unit -> Ocgtk_gdk.Gdk.rgb_a_t
    method as_color_node : Color_node.t
end

(* High-level class for ColorNode *)
class color_node (obj : Color_node.t) : color_node_t = object (self)

  method get_color : unit -> Ocgtk_gdk.Gdk.rgb_a_t =
    fun () ->
      new  Ocgtk_gdk.Gdk.rgb_a(Color_node.get_color obj)

    method as_color_node = obj
end

