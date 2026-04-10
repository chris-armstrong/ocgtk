class type conic_gradient_node_t = object
    inherit GRender_node.render_node_t
    method get_angle : unit -> float
    method get_center : unit -> Ocgtk_graphene.Graphene.Point.point_t
    method get_n_color_stops : unit -> Gsize.t
    method get_rotation : unit -> float
    method as_conic_gradient_node : Conic_gradient_node.t
end

(* High-level class for ConicGradientNode *)
class conic_gradient_node (obj : Conic_gradient_node.t) : conic_gradient_node_t = object (self)
  inherit GRender_node.render_node (obj :> Render_node.t)

  method get_angle : unit -> float =
    fun () ->
      (Conic_gradient_node.get_angle obj)

  method get_center : unit -> Ocgtk_graphene.Graphene.Point.point_t =
    fun () ->
      new  Ocgtk_graphene.Graphene.Point.point(Conic_gradient_node.get_center obj)

  method get_n_color_stops : unit -> Gsize.t =
    fun () ->
      (Conic_gradient_node.get_n_color_stops obj)

  method get_rotation : unit -> float =
    fun () ->
      (Conic_gradient_node.get_rotation obj)

    method as_conic_gradient_node = obj
end

let new_ (bounds : Ocgtk_graphene.Graphene.Rect.rect_t) (center : Ocgtk_graphene.Graphene.Point.point_t) (rotation : float) (color_stops : Color_stop.t array) (n_color_stops : Gsize.t) : conic_gradient_node_t =
  let bounds = bounds#as_rect in
  let center = center#as_point in
  let obj_ = Conic_gradient_node.new_ bounds center rotation color_stops n_color_stops in
  new conic_gradient_node obj_

