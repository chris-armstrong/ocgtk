class type stroke_node_t = object
  inherit Render_node.render_node_t
  method get_child : unit -> Render_node.render_node_t
  method get_path : unit -> Raw.Path.t
  method get_stroke : unit -> Raw.Stroke.t
  method as_stroke_node : Raw.Stroke_node.t
end

class stroke_node : Raw.Stroke_node.t -> stroke_node_t

val new_ :
  Render_node.render_node_t -> Raw.Path.t -> Raw.Stroke.t -> stroke_node_t
