(* High-level class for LinearGradientNode *)
class linear_gradient_node (obj : Linear_gradient_node.t) = object (self)

  method get_end : unit -> Ocgtk_graphene.Graphene.point =
    fun () ->
      new  Ocgtk_graphene.Graphene.point(Linear_gradient_node.get_end obj)

  method get_start : unit -> Ocgtk_graphene.Graphene.point =
    fun () ->
      new  Ocgtk_graphene.Graphene.point(Linear_gradient_node.get_start obj)

    method as_linear_gradient_node = obj
end

