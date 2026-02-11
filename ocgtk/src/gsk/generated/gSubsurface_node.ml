(* High-level class for SubsurfaceNode *)
class subsurface_node (obj : Subsurface_node.t) = object (self)

  method get_child : unit -> GRender_node.render_node =
    fun () ->
      new  GRender_node.render_node(Subsurface_node.get_child obj)

    method as_subsurface_node = obj
end

