(* High-level class for ClipNode *)
class clip_node (obj : Clip_node.t) = object (self)

  method get_child : unit -> GRender_node.render_node =
    fun () ->
      new  GRender_node.render_node(Clip_node.get_child obj)

  method get_clip : unit -> Ocgtk_graphene.Graphene.rect =
    fun () ->
      new  Ocgtk_graphene.Graphene.rect(Clip_node.get_clip obj)

    method as_clip_node = obj
end

