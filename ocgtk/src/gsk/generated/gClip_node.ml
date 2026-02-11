(* High-level class for ClipNode *)
class clip_node (obj : Clip_node.t) = object (self)

  method get_child : unit -> GRender_node.render_node =
    fun () ->
      new  GRender_node.render_node(Clip_node.get_child obj)

    method as_clip_node = obj
end

