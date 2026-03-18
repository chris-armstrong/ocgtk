(* High-level class for ColorNode *)
class color_node (obj : Color_node.t) = object (self)

  method get_color : unit -> Ocgtk_gdk.Gdk.rgb_a =
    fun () ->
      new  Ocgtk_gdk.Gdk.rgb_a(Color_node.get_color obj)

    method as_color_node = obj
end

