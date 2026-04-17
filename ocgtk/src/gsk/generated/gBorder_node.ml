class type border_node_t = object
    inherit GRender_node.render_node_t
    method get_colors : unit -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
    method get_outline : unit -> Rounded_rect.t
    method get_widths : unit -> float array
    method as_border_node : Border_node.t
end

(* High-level class for BorderNode *)
class border_node (obj : Border_node.t) : border_node_t = object (self)
  inherit GRender_node.render_node (obj :> Render_node.t)

  method get_colors : unit -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t =
    fun () ->
      new  Ocgtk_gdk.Gdk.Rgb_a.rgb_a(Border_node.get_colors obj)

  method get_outline : unit -> Rounded_rect.t =
    fun () ->
      (Border_node.get_outline obj)

  method get_widths : unit -> float array =
    fun () ->
      (Border_node.get_widths obj)

    method as_border_node = obj
end

let new_ (outline : Rounded_rect.t) (border_width : float array) (border_color : Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t array) : border_node_t =
  let obj_ = Border_node.new_ outline border_width border_color in
  new border_node obj_

