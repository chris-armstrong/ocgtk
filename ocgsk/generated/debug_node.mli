class type debug_node_t = object
  inherit Render_node.render_node_t
  method get_child : unit -> Render_node.render_node_t
  method get_message : unit -> string
  method as_debug_node : Raw.Debug_node.t
end

class debug_node : Raw.Debug_node.t -> debug_node_t

val new_ : Render_node.render_node_t -> string -> debug_node_t
