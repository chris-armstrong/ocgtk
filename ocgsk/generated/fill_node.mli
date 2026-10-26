class type fill_node_t = object
  inherit Render_node.render_node_t
  method get_child : unit -> Render_node.render_node_t
  method get_fill_rule : unit -> Enums.fillrule
  method get_path : unit -> Raw.Path.t
  method as_fill_node : Raw.Fill_node.t
end

class fill_node : Raw.Fill_node.t -> fill_node_t

val new_ :
  Render_node.render_node_t -> Raw.Path.t -> Enums.fillrule -> fill_node_t
