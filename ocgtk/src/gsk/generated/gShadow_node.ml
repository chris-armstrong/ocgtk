class type shadow_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method as_shadow_node : Shadow_node.t
end

(* High-level class for ShadowNode *)
class shadow_node (obj : Shadow_node.t) : shadow_node_t = object (self)
  inherit GRender_node.render_node (Obj.magic obj : Render_node.t)

  method get_child : unit -> GRender_node.render_node_t =
    fun () ->
      new  GRender_node.render_node(Shadow_node.get_child obj)

    method as_shadow_node = obj
end

