class type repeating_linear_gradient_node_t = object
  inherit GRender_node.render_node_t
  method as_repeating_linear_gradient_node : Repeating_linear_gradient_node.t
end

class repeating_linear_gradient_node :
  Repeating_linear_gradient_node.t ->
  repeating_linear_gradient_node_t

val new_ :
  Ocgtk_graphene.Graphene.Rect.rect_t ->
  Ocgtk_graphene.Graphene.Point.point_t ->
  Ocgtk_graphene.Graphene.Point.point_t ->
  Color_stop.t array ->
  Gsize.t ->
  repeating_linear_gradient_node_t
