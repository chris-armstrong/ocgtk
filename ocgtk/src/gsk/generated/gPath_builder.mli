class type path_builder_t = object
    method add_cairo_path : Ocgtk_cairo.Cairo.path_t -> unit
    method add_circle : Ocgtk_graphene.Graphene.point_t -> float -> unit
    method add_layout : Ocgtk_pango.Pango.layout_t -> unit
    method add_path : Path_and__path_measure_and__path_point.Path.t -> unit
    method add_rect : Ocgtk_graphene.Graphene.rect_t -> unit
    method add_reverse_path : Path_and__path_measure_and__path_point.Path.t -> unit
    method add_rounded_rect : Rounded_rect.t -> unit
    method add_segment : Path_and__path_measure_and__path_point.Path.t -> Path_and__path_measure_and__path_point.Path_point.t -> Path_and__path_measure_and__path_point.Path_point.t -> unit
    method arc_to : float -> float -> float -> float -> unit
    method close : unit -> unit
    method conic_to : float -> float -> float -> float -> float -> unit
    method cubic_to : float -> float -> float -> float -> float -> float -> unit
    method get_current_point : unit -> Ocgtk_graphene.Graphene.point_t
    method html_arc_to : float -> float -> float -> float -> float -> unit
    method line_to : float -> float -> unit
    method move_to : float -> float -> unit
    method quad_to : float -> float -> float -> float -> unit
    method ref : unit -> Path_builder.t
    method rel_arc_to : float -> float -> float -> float -> unit
    method rel_conic_to : float -> float -> float -> float -> float -> unit
    method rel_cubic_to : float -> float -> float -> float -> float -> float -> unit
    method rel_html_arc_to : float -> float -> float -> float -> float -> unit
    method rel_line_to : float -> float -> unit
    method rel_move_to : float -> float -> unit
    method rel_quad_to : float -> float -> float -> float -> unit
    method rel_svg_arc_to : float -> float -> float -> bool -> bool -> float -> float -> unit
    method svg_arc_to : float -> float -> float -> bool -> bool -> float -> float -> unit
    method to_path : unit -> Path_and__path_measure_and__path_point.Path.t
    method unref : unit -> unit
    method as_path_builder : Path_builder.t
end

class path_builder : Path_builder.t -> path_builder_t

