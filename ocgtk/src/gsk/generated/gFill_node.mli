class type fill_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method get_fill_rule : unit -> Gsk_enums.fillrule
    method get_path : unit -> Path_and__path_measure_and__path_point.Path.t
    method as_fill_node : Fill_node.t
end

class fill_node : Fill_node.t -> fill_node_t

val new_ : GRender_node.render_node_t -> Path_and__path_measure_and__path_point.Path.t -> Gsk_enums.fillrule -> fill_node_t
