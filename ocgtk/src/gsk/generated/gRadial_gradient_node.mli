class type radial_gradient_node_t = object
    inherit GRender_node.render_node_t
    method get_center : unit -> Ocgtk_graphene.Graphene.Point.point_t
    method get_end : unit -> float
    method get_hradius : unit -> float
    method get_n_color_stops : unit -> int
    method get_start : unit -> float
    method get_vradius : unit -> float
    method as_radial_gradient_node : Radial_gradient_node.t
end

class radial_gradient_node : Radial_gradient_node.t -> radial_gradient_node_t

val new_ : Ocgtk_graphene.Graphene.Rect.rect_t -> Ocgtk_graphene.Graphene.Point.point_t -> float -> float -> float -> float -> Color_stop.t array -> int -> radial_gradient_node_t
