class type subsurface_node_t = object
  inherit Render_node.render_node_t
  method get_child : unit -> Render_node.render_node_t
  method as_subsurface_node : Raw.Subsurface_node.t
end

class subsurface_node : Raw.Subsurface_node.t -> subsurface_node_t
