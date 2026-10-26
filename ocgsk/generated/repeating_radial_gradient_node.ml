class type repeating_radial_gradient_node_t = object
  inherit Render_node.render_node_t

  method as_repeating_radial_gradient_node :
    Raw.Repeating_radial_gradient_node.t
end

(* High-level class for RepeatingRadialGradientNode *)
class repeating_radial_gradient_node
  (obj : Raw.Repeating_radial_gradient_node.t) :
  repeating_radial_gradient_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)
    method as_repeating_radial_gradient_node = obj
  end

let new_ (bounds : Ocgraphene.Rect.rect_t) (center : Ocgraphene.Point.point_t)
    (hradius : float) (vradius : float) (start : float) (end_ : float)
    (color_stops : Raw.Color_stop.t array) (n_color_stops : Gsize.t) :
    repeating_radial_gradient_node_t =
  let bounds = bounds#as_rect in
  let center = center#as_point in
  let obj_ =
    Raw.Repeating_radial_gradient_node.new_ bounds center hradius vradius start
      end_ color_stops n_color_stops
  in
  new repeating_radial_gradient_node obj_
