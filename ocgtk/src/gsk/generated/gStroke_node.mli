class type stroke_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method get_path : unit -> Path_and__path_measure_and__path_point.Path.t
    method get_stroke : unit -> Stroke.t
    method as_stroke_node : Stroke_node.t
end

class stroke_node : Stroke_node.t -> stroke_node_t

val new_ : GRender_node.render_node_t -> Path_and__path_measure_and__path_point.Path.t -> Stroke.t -> stroke_node_t
