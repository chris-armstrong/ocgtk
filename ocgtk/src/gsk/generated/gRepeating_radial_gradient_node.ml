class type repeating_radial_gradient_node_t = object
    inherit GRender_node.render_node_t
    method as_repeating_radial_gradient_node : Repeating_radial_gradient_node.t
end

(* High-level class for RepeatingRadialGradientNode *)
class repeating_radial_gradient_node (obj : Repeating_radial_gradient_node.t) : repeating_radial_gradient_node_t = object (self)
  inherit GRender_node.render_node (obj :> Render_node.t)

    method as_repeating_radial_gradient_node = obj
end

let new_ (bounds : Ocgtk_graphene.Graphene.Rect.rect_t) (center : Ocgtk_graphene.Graphene.Point.point_t) (hradius : float) (vradius : float) (start : float) (end_ : float) (color_stops : Color_stop.t array) (n_color_stops : Gsize.t) : repeating_radial_gradient_node_t =
  let bounds = bounds#as_rect in
  let center = center#as_point in
  let obj_ = Repeating_radial_gradient_node.new_ bounds center hradius vradius start end_ color_stops n_color_stops in
  new repeating_radial_gradient_node obj_

