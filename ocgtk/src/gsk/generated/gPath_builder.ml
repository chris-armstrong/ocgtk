(* High-level class for PathBuilder *)
class path_builder (obj : Path_builder.t) = object (self)

  method add_cairo_path : 'p1. (#Ocgtk_cairo.Cairo.path as 'p1) -> unit =
    fun path ->
      let path = path#as_path in
      (Path_builder.add_cairo_path obj path)

  method add_circle : 'p1. (#Ocgtk_graphene.Graphene.point as 'p1) -> float -> unit =
    fun center radius ->
      let center = center#as_point in
      (Path_builder.add_circle obj center radius)

  method add_layout : 'p1. (#Ocgtk_pango.Pango.layout as 'p1) -> unit =
    fun layout ->
      let layout = layout#as_layout in
      (Path_builder.add_layout obj layout)

  method add_path : Path_and__path_measure_and__path_point.Path.t -> unit =
    fun path ->
      (Path_builder.add_path obj path)

  method add_rect : 'p1. (#Ocgtk_graphene.Graphene.rect as 'p1) -> unit =
    fun rect ->
      let rect = rect#as_rect in
      (Path_builder.add_rect obj rect)

  method add_reverse_path : Path_and__path_measure_and__path_point.Path.t -> unit =
    fun path ->
      (Path_builder.add_reverse_path obj path)

  method add_rounded_rect : Rounded_rect.t -> unit =
    fun rect ->
      (Path_builder.add_rounded_rect obj rect)

  method add_segment : Path_and__path_measure_and__path_point.Path.t -> Path_and__path_measure_and__path_point.Path_point.t -> Path_and__path_measure_and__path_point.Path_point.t -> unit =
    fun path start end_ ->
      (Path_builder.add_segment obj path start end_)

  method arc_to : float -> float -> float -> float -> unit =
    fun x1 y1 x2 y2 ->
      (Path_builder.arc_to obj x1 y1 x2 y2)

  method close : unit -> unit =
    fun () ->
      (Path_builder.close obj)

  method conic_to : float -> float -> float -> float -> float -> unit =
    fun x1 y1 x2 y2 weight ->
      (Path_builder.conic_to obj x1 y1 x2 y2 weight)

  method cubic_to : float -> float -> float -> float -> float -> float -> unit =
    fun x1 y1 x2 y2 x3 y3 ->
      (Path_builder.cubic_to obj x1 y1 x2 y2 x3 y3)

  method get_current_point : unit -> Ocgtk_graphene.Graphene.point =
    fun () ->
      new  Ocgtk_graphene.Graphene.point(Path_builder.get_current_point obj)

  method html_arc_to : float -> float -> float -> float -> float -> unit =
    fun x1 y1 x2 y2 radius ->
      (Path_builder.html_arc_to obj x1 y1 x2 y2 radius)

  method line_to : float -> float -> unit =
    fun x y ->
      (Path_builder.line_to obj x y)

  method move_to : float -> float -> unit =
    fun x y ->
      (Path_builder.move_to obj x y)

  method quad_to : float -> float -> float -> float -> unit =
    fun x1 y1 x2 y2 ->
      (Path_builder.quad_to obj x1 y1 x2 y2)

  method ref : unit -> Path_builder.t =
    fun () ->
      (Path_builder.ref obj)

  method rel_arc_to : float -> float -> float -> float -> unit =
    fun x1 y1 x2 y2 ->
      (Path_builder.rel_arc_to obj x1 y1 x2 y2)

  method rel_conic_to : float -> float -> float -> float -> float -> unit =
    fun x1 y1 x2 y2 weight ->
      (Path_builder.rel_conic_to obj x1 y1 x2 y2 weight)

  method rel_cubic_to : float -> float -> float -> float -> float -> float -> unit =
    fun x1 y1 x2 y2 x3 y3 ->
      (Path_builder.rel_cubic_to obj x1 y1 x2 y2 x3 y3)

  method rel_html_arc_to : float -> float -> float -> float -> float -> unit =
    fun x1 y1 x2 y2 radius ->
      (Path_builder.rel_html_arc_to obj x1 y1 x2 y2 radius)

  method rel_line_to : float -> float -> unit =
    fun x y ->
      (Path_builder.rel_line_to obj x y)

  method rel_move_to : float -> float -> unit =
    fun x y ->
      (Path_builder.rel_move_to obj x y)

  method rel_quad_to : float -> float -> float -> float -> unit =
    fun x1 y1 x2 y2 ->
      (Path_builder.rel_quad_to obj x1 y1 x2 y2)

  method rel_svg_arc_to : float -> float -> float -> bool -> bool -> float -> float -> unit =
    fun rx ry x_axis_rotation large_arc positive_sweep x y ->
      (Path_builder.rel_svg_arc_to obj rx ry x_axis_rotation large_arc positive_sweep x y)

  method svg_arc_to : float -> float -> float -> bool -> bool -> float -> float -> unit =
    fun rx ry x_axis_rotation large_arc positive_sweep x y ->
      (Path_builder.svg_arc_to obj rx ry x_axis_rotation large_arc positive_sweep x y)

  method to_path : unit -> Path_and__path_measure_and__path_point.Path.t =
    fun () ->
      (Path_builder.to_path obj)

  method unref : unit -> unit =
    fun () ->
      (Path_builder.unref obj)

    method as_path_builder = obj
end

