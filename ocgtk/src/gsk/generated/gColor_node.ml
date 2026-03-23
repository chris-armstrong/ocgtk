class type color_node_t = object
    inherit GRender_node.render_node_t
    method get_color : unit -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
    method as_color_node : Color_node.t
end

(* High-level class for ColorNode *)
class color_node (obj : Color_node.t) : color_node_t = object (self)
  inherit GRender_node.render_node (Obj.magic obj : Render_node.t)

  method get_color : unit -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t =
    fun () ->
      new  Ocgtk_gdk.Gdk.Rgb_a.rgb_a(Color_node.get_color obj)

    method as_color_node = obj
end

let new_ (rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t) (bounds : Ocgtk_graphene.Graphene.Rect.rect_t) : color_node_t =
  let rgba = rgba#as_rgb_a in
  let bounds = bounds#as_rect in
  new color_node (Color_node.new_ rgba bounds)

