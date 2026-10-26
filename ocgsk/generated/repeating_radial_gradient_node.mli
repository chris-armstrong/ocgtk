class type repeating_radial_gradient_node_t = object
  inherit Render_node.render_node_t

  method as_repeating_radial_gradient_node :
    Raw.Repeating_radial_gradient_node.t
end

class repeating_radial_gradient_node :
  Raw.Repeating_radial_gradient_node.t ->
  repeating_radial_gradient_node_t

val new_ :
  Ocgraphene.Rect.rect_t ->
  Ocgraphene.Point.point_t ->
  float ->
  float ->
  float ->
  float ->
  Raw.Color_stop.t array ->
  Gsize.t ->
  repeating_radial_gradient_node_t
