class type linear_gradient_node_t = object
  inherit Render_node.render_node_t
  method get_end : unit -> Ocgraphene.Point.point_t
  method get_n_color_stops : unit -> Gsize.t
  method get_start : unit -> Ocgraphene.Point.point_t
  method as_linear_gradient_node : Raw.Linear_gradient_node.t
end

class linear_gradient_node :
  Raw.Linear_gradient_node.t ->
  linear_gradient_node_t

val new_ :
  Ocgraphene.Rect.rect_t ->
  Ocgraphene.Point.point_t ->
  Ocgraphene.Point.point_t ->
  Raw.Color_stop.t array ->
  Gsize.t ->
  linear_gradient_node_t
