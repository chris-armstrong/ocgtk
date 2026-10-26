class type subsurface_node_t = object
  inherit GRender_node.render_node_t
  method get_child : unit -> GRender_node.render_node_t
  method as_subsurface_node : Subsurface_node.t
end

class subsurface_node : Subsurface_node.t -> subsurface_node_t
