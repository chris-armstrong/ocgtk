class type blend_node_t = object
  inherit Render_node.render_node_t
  method get_blend_mode : unit -> Enums.blendmode
  method get_bottom_child : unit -> Render_node.render_node_t
  method get_top_child : unit -> Render_node.render_node_t
  method as_blend_node : Raw.Blend_node.t
end

class blend_node : Raw.Blend_node.t -> blend_node_t

val new_ :
  Render_node.render_node_t ->
  Render_node.render_node_t ->
  Enums.blendmode ->
  blend_node_t
