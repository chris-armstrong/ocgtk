class type conic_gradient_node_t = object
  inherit Render_node.render_node_t
  method get_angle : unit -> float
  method get_center : unit -> Ocgraphene.Point.point_t
  method get_n_color_stops : unit -> Gsize.t
  method get_rotation : unit -> float
  method as_conic_gradient_node : Raw.Conic_gradient_node.t
end

class conic_gradient_node : Raw.Conic_gradient_node.t -> conic_gradient_node_t

val new_ :
  Ocgraphene.Rect.rect_t ->
  Ocgraphene.Point.point_t ->
  float ->
  Raw.Color_stop.t array ->
  Gsize.t ->
  conic_gradient_node_t
