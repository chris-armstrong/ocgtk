class type conic_gradient_node_t = object
    inherit GRender_node.render_node_t
    method get_angle : unit -> float
    method get_center : unit -> Ocgtk_graphene.Graphene.point_t
    method get_rotation : unit -> float
    method as_conic_gradient_node : Conic_gradient_node.t
end

(* High-level class for ConicGradientNode *)
class conic_gradient_node (obj : Conic_gradient_node.t) : conic_gradient_node_t = object (self)
  inherit GRender_node.render_node (Obj.magic obj : Render_node.t)

  method get_angle : unit -> float =
    fun () ->
      (Conic_gradient_node.get_angle obj)

  method get_center : unit -> Ocgtk_graphene.Graphene.point_t =
    fun () ->
      new  Ocgtk_graphene.Graphene.point(Conic_gradient_node.get_center obj)

  method get_rotation : unit -> float =
    fun () ->
      (Conic_gradient_node.get_rotation obj)

    method as_conic_gradient_node = obj
end

