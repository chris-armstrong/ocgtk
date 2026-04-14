class type linear_gradient_node_t = object
    inherit GRender_node.render_node_t
    method get_end : unit -> Ocgtk_graphene.Graphene.Point.point_t
    method get_n_color_stops : unit -> Gsize.t
    method get_start : unit -> Ocgtk_graphene.Graphene.Point.point_t
    method as_linear_gradient_node : Linear_gradient_node.t
end

(* High-level class for LinearGradientNode *)
class linear_gradient_node (obj : Linear_gradient_node.t) : linear_gradient_node_t = object (self)
  inherit GRender_node.render_node (obj :> Render_node.t)

  method get_end : unit -> Ocgtk_graphene.Graphene.Point.point_t =
    fun () ->
      new  Ocgtk_graphene.Graphene.Point.point(Linear_gradient_node.get_end obj)

  method get_n_color_stops : unit -> Gsize.t =
    fun () ->
      (Linear_gradient_node.get_n_color_stops obj)

  method get_start : unit -> Ocgtk_graphene.Graphene.Point.point_t =
    fun () ->
      new  Ocgtk_graphene.Graphene.Point.point(Linear_gradient_node.get_start obj)

    method as_linear_gradient_node = obj
end

let new_ (bounds : Ocgtk_graphene.Graphene.Rect.rect_t) (start : Ocgtk_graphene.Graphene.Point.point_t) (end_ : Ocgtk_graphene.Graphene.Point.point_t) (color_stops : Color_stop.t array) (n_color_stops : Gsize.t) : linear_gradient_node_t =
  let bounds = bounds#as_rect in
  let start = start#as_point in
  let end_ = end_#as_point in
  let obj_ = Linear_gradient_node.new_ bounds start end_ color_stops n_color_stops in
  new linear_gradient_node obj_

