(* High-level class for RepeatNode *)
class repeat_node (obj : Repeat_node.t) = object (self)

  method get_child : unit -> GRender_node.render_node =
    fun () ->
      new  GRender_node.render_node(Repeat_node.get_child obj)

  method get_child_bounds : unit -> Ocgtk_graphene.Graphene.rect =
    fun () ->
      new  Ocgtk_graphene.Graphene.rect(Repeat_node.get_child_bounds obj)

    method as_repeat_node = obj
end

