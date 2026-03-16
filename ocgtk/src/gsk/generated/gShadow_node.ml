(* High-level class for ShadowNode *)
class shadow_node (obj : Shadow_node.t) = object (self)

  method get_child : unit -> GRender_node.render_node =
    fun () ->
      new  GRender_node.render_node(Shadow_node.get_child obj)

    method as_shadow_node = obj
end

