class type repeating_linear_gradient_node_t = object
  inherit GRender_node.render_node_t
  method as_repeating_linear_gradient_node : Repeating_linear_gradient_node.t
end

(* High-level class for RepeatingLinearGradientNode *)
class repeating_linear_gradient_node (obj : Repeating_linear_gradient_node.t) :
  repeating_linear_gradient_node_t =
  object (self)
    inherit GRender_node.render_node (obj :> Render_node.t)
    method as_repeating_linear_gradient_node = obj
  end

let new_ (bounds : Ocgtk_graphene.Graphene.Rect.rect_t)
    (start : Ocgtk_graphene.Graphene.Point.point_t)
    (end_ : Ocgtk_graphene.Graphene.Point.point_t)
    (color_stops : Color_stop.t array) (n_color_stops : Gsize.t) :
    repeating_linear_gradient_node_t =
  let bounds = bounds#as_rect in
  let start = start#as_point in
  let end_ = end_#as_point in
  let obj_ =
    Repeating_linear_gradient_node.new_ bounds start end_ color_stops
      n_color_stops
  in
  new repeating_linear_gradient_node obj_
