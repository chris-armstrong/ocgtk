class type path_builder_t = object
  method add_cairo_path : Occairo.Path.path_t -> unit
  method add_circle : Ocgraphene.Point.point_t -> float -> unit
  method add_layout : Ocpango.Layout.layout_t -> unit
  method add_path : Raw.Path.t -> unit
  method add_rect : Ocgraphene.Rect.rect_t -> unit
  method add_reverse_path : Raw.Path.t -> unit
  method add_rounded_rect : Raw.Rounded_rect.t -> unit

  method add_segment :
    Raw.Path.t -> Raw.Path_point.t -> Raw.Path_point.t -> unit

  method arc_to : float -> float -> float -> float -> unit
  method close : unit -> unit
  method conic_to : float -> float -> float -> float -> float -> unit
  method cubic_to : float -> float -> float -> float -> float -> float -> unit
  method get_current_point : unit -> Ocgraphene.Point.point_t
  method html_arc_to : float -> float -> float -> float -> float -> unit
  method line_to : float -> float -> unit
  method move_to : float -> float -> unit
  method quad_to : float -> float -> float -> float -> unit
  method ref : unit -> Raw.Path_builder.t
  method rel_arc_to : float -> float -> float -> float -> unit
  method rel_conic_to : float -> float -> float -> float -> float -> unit

  method rel_cubic_to :
    float -> float -> float -> float -> float -> float -> unit

  method rel_html_arc_to : float -> float -> float -> float -> float -> unit
  method rel_line_to : float -> float -> unit
  method rel_move_to : float -> float -> unit
  method rel_quad_to : float -> float -> float -> float -> unit

  method rel_svg_arc_to :
    float -> float -> float -> bool -> bool -> float -> float -> unit

  method svg_arc_to :
    float -> float -> float -> bool -> bool -> float -> float -> unit

  method to_path : unit -> Raw.Path.t
  method as_path_builder : Raw.Path_builder.t
end

class path_builder : Raw.Path_builder.t -> path_builder_t

val new_ : unit -> path_builder_t
