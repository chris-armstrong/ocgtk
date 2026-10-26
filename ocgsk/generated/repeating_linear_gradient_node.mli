class type repeating_linear_gradient_node_t = object
  inherit Render_node.render_node_t

  method as_repeating_linear_gradient_node :
    Raw.Repeating_linear_gradient_node.t
end

class repeating_linear_gradient_node :
  Raw.Repeating_linear_gradient_node.t ->
  repeating_linear_gradient_node_t

val new_ :
  Ocgraphene.Rect.rect_t ->
  Ocgraphene.Point.point_t ->
  Ocgraphene.Point.point_t ->
  Raw.Color_stop.t array ->
  Gsize.t ->
  repeating_linear_gradient_node_t
