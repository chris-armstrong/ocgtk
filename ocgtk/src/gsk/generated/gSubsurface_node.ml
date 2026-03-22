class type subsurface_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method as_subsurface_node : Subsurface_node.t
end

(* High-level class for SubsurfaceNode *)
class subsurface_node (obj : Subsurface_node.t) : subsurface_node_t = object (self)
  inherit GRender_node.render_node (Obj.magic obj : Render_node.t)

  method get_child : unit -> GRender_node.render_node_t =
    fun () ->
      new  GRender_node.render_node(Subsurface_node.get_child obj)

    method as_subsurface_node = obj
end

