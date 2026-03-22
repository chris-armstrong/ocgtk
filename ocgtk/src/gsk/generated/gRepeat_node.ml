class type repeat_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method get_child_bounds : unit -> Ocgtk_graphene.Graphene.rect_t
    method as_repeat_node : Repeat_node.t
end

(* High-level class for RepeatNode *)
class repeat_node (obj : Repeat_node.t) : repeat_node_t = object (self)
  inherit GRender_node.render_node (Obj.magic obj : Render_node.t)

  method get_child : unit -> GRender_node.render_node_t =
    fun () ->
      new  GRender_node.render_node(Repeat_node.get_child obj)

  method get_child_bounds : unit -> Ocgtk_graphene.Graphene.rect_t =
    fun () ->
      new  Ocgtk_graphene.Graphene.rect(Repeat_node.get_child_bounds obj)

    method as_repeat_node = obj
end

