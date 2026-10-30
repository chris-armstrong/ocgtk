class type repeating_linear_gradient_node_t = object
  inherit Render_node.render_node_t

  (** {2:conversions Conversions} *)

  method as_repeating_linear_gradient_node :
    Raw.Repeating_linear_gradient_node.t
end

(* High-level class for RepeatingLinearGradientNode *)
class repeating_linear_gradient_node
  (obj : Raw.Repeating_linear_gradient_node.t) :
  repeating_linear_gradient_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)
    method as_repeating_linear_gradient_node = obj
  end

let new_ (bounds : Ocgraphene.Rect.rect_t) (start : Ocgraphene.Point.point_t)
    (end_ : Ocgraphene.Point.point_t) (color_stops : Raw.Color_stop.t array)
    (n_color_stops : Gsize.t) : repeating_linear_gradient_node_t =
  let bounds = bounds#as_rect in
  let start = start#as_point in
  let end_ = end_#as_point in
  let obj_ =
    Raw.Repeating_linear_gradient_node.new_ bounds start end_ color_stops
      n_color_stops
  in
  new repeating_linear_gradient_node obj_
