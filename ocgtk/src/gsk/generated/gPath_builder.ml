class type path_builder_t = object
  method add_cairo_path : Ocgtk_cairo.Cairo.Path.path_t -> unit
  method add_circle : Ocgtk_graphene.Graphene.Point.point_t -> float -> unit
  method add_layout : Ocgtk_pango.Pango.Layout.layout_t -> unit
  method add_path : Path_and__path_measure_and__path_point.Path.t -> unit
  method add_rect : Ocgtk_graphene.Graphene.Rect.rect_t -> unit

  method add_reverse_path :
    Path_and__path_measure_and__path_point.Path.t -> unit

  method add_rounded_rect : Rounded_rect.t -> unit

  method add_segment :
    Path_and__path_measure_and__path_point.Path.t ->
    Path_and__path_measure_and__path_point.Path_point.t ->
    Path_and__path_measure_and__path_point.Path_point.t ->
    unit

  method arc_to : float -> float -> float -> float -> unit
  method close : unit -> unit
  method conic_to : float -> float -> float -> float -> float -> unit
  method cubic_to : float -> float -> float -> float -> float -> float -> unit
  method get_current_point : unit -> Ocgtk_graphene.Graphene.Point.point_t
  method html_arc_to : float -> float -> float -> float -> float -> unit
  method line_to : float -> float -> unit
  method move_to : float -> float -> unit
  method quad_to : float -> float -> float -> float -> unit
  method ref : unit -> Path_builder.t
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

  method to_path : unit -> Path_and__path_measure_and__path_point.Path.t
  method as_path_builder : Path_builder.t
end

(* High-level class for PathBuilder *)
class path_builder (obj : Path_builder.t) : path_builder_t =
  object (self)
    method add_cairo_path : Ocgtk_cairo.Cairo.Path.path_t -> unit =
      fun path ->
        let path = path#as_path in
        Path_builder.add_cairo_path obj path

    method add_circle : Ocgtk_graphene.Graphene.Point.point_t -> float -> unit =
      fun center radius ->
        let center = center#as_point in
        Path_builder.add_circle obj center radius

    method add_layout : Ocgtk_pango.Pango.Layout.layout_t -> unit =
      fun layout ->
        let layout = layout#as_layout in
        Path_builder.add_layout obj layout

    method add_path : Path_and__path_measure_and__path_point.Path.t -> unit =
      fun path -> Path_builder.add_path obj path

    method add_rect : Ocgtk_graphene.Graphene.Rect.rect_t -> unit =
      fun rect ->
        let rect = rect#as_rect in
        Path_builder.add_rect obj rect

    method add_reverse_path :
        Path_and__path_measure_and__path_point.Path.t -> unit =
      fun path -> Path_builder.add_reverse_path obj path

    method add_rounded_rect : Rounded_rect.t -> unit =
      fun rect -> Path_builder.add_rounded_rect obj rect

    method add_segment :
        Path_and__path_measure_and__path_point.Path.t ->
        Path_and__path_measure_and__path_point.Path_point.t ->
        Path_and__path_measure_and__path_point.Path_point.t ->
        unit =
      fun path start end_ -> Path_builder.add_segment obj path start end_

    method arc_to : float -> float -> float -> float -> unit =
      fun x1 y1 x2 y2 -> Path_builder.arc_to obj x1 y1 x2 y2

    method close : unit -> unit = fun () -> Path_builder.close obj

    method conic_to : float -> float -> float -> float -> float -> unit =
      fun x1 y1 x2 y2 weight -> Path_builder.conic_to obj x1 y1 x2 y2 weight

    method cubic_to : float -> float -> float -> float -> float -> float -> unit
        =
      fun x1 y1 x2 y2 x3 y3 -> Path_builder.cubic_to obj x1 y1 x2 y2 x3 y3

    method get_current_point : unit -> Ocgtk_graphene.Graphene.Point.point_t =
      fun () ->
        new Ocgtk_graphene.Graphene.Point.point
          (Path_builder.get_current_point obj)

    method html_arc_to : float -> float -> float -> float -> float -> unit =
      fun x1 y1 x2 y2 radius -> Path_builder.html_arc_to obj x1 y1 x2 y2 radius

    method line_to : float -> float -> unit =
      fun x y -> Path_builder.line_to obj x y

    method move_to : float -> float -> unit =
      fun x y -> Path_builder.move_to obj x y

    method quad_to : float -> float -> float -> float -> unit =
      fun x1 y1 x2 y2 -> Path_builder.quad_to obj x1 y1 x2 y2

    method ref : unit -> Path_builder.t = fun () -> Path_builder.ref obj

    method rel_arc_to : float -> float -> float -> float -> unit =
      fun x1 y1 x2 y2 -> Path_builder.rel_arc_to obj x1 y1 x2 y2

    method rel_conic_to : float -> float -> float -> float -> float -> unit =
      fun x1 y1 x2 y2 weight -> Path_builder.rel_conic_to obj x1 y1 x2 y2 weight

    method rel_cubic_to :
        float -> float -> float -> float -> float -> float -> unit =
      fun x1 y1 x2 y2 x3 y3 -> Path_builder.rel_cubic_to obj x1 y1 x2 y2 x3 y3

    method rel_html_arc_to : float -> float -> float -> float -> float -> unit =
      fun x1 y1 x2 y2 radius ->
        Path_builder.rel_html_arc_to obj x1 y1 x2 y2 radius

    method rel_line_to : float -> float -> unit =
      fun x y -> Path_builder.rel_line_to obj x y

    method rel_move_to : float -> float -> unit =
      fun x y -> Path_builder.rel_move_to obj x y

    method rel_quad_to : float -> float -> float -> float -> unit =
      fun x1 y1 x2 y2 -> Path_builder.rel_quad_to obj x1 y1 x2 y2

    method rel_svg_arc_to :
        float -> float -> float -> bool -> bool -> float -> float -> unit =
      fun rx ry x_axis_rotation large_arc positive_sweep x y ->
        Path_builder.rel_svg_arc_to obj rx ry x_axis_rotation large_arc
          positive_sweep x y

    method svg_arc_to :
        float -> float -> float -> bool -> bool -> float -> float -> unit =
      fun rx ry x_axis_rotation large_arc positive_sweep x y ->
        Path_builder.svg_arc_to obj rx ry x_axis_rotation large_arc
          positive_sweep x y

    method to_path : unit -> Path_and__path_measure_and__path_point.Path.t =
      fun () -> Path_builder.to_path obj

    method as_path_builder = obj
  end

let new_ () : path_builder_t = new path_builder (Path_builder.new_ ())
