class type linear_gradient_node_t = object
    inherit GRender_node.render_node_t
    method get_end : unit -> Ocgtk_graphene.Graphene.point_t
    method get_start : unit -> Ocgtk_graphene.Graphene.point_t
    method as_linear_gradient_node : Linear_gradient_node.t
end

(* High-level class for LinearGradientNode *)
class linear_gradient_node (obj : Linear_gradient_node.t) : linear_gradient_node_t = object (self)
  inherit GRender_node.render_node (Obj.magic obj : Render_node.t)

  method get_end : unit -> Ocgtk_graphene.Graphene.point_t =
    fun () ->
      new  Ocgtk_graphene.Graphene.point(Linear_gradient_node.get_end obj)

  method get_start : unit -> Ocgtk_graphene.Graphene.point_t =
    fun () ->
      new  Ocgtk_graphene.Graphene.point(Linear_gradient_node.get_start obj)

    method as_linear_gradient_node = obj
end

