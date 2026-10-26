class type shadow_node_t = object
  inherit Render_node.render_node_t
  method get_child : unit -> Render_node.render_node_t
  method get_n_shadows : unit -> Gsize.t
  method get_shadow : Gsize.t -> Raw.Shadow.t
  method as_shadow_node : Raw.Shadow_node.t
end

class shadow_node : Raw.Shadow_node.t -> shadow_node_t

val new_ :
  Render_node.render_node_t -> Raw.Shadow.t array -> Gsize.t -> shadow_node_t
