(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

module rec Path : sig
  type t = [`path] Gobject.obj

  (* Methods *)
  (** Decreases the reference count of a `GskPath` by one.

  If the resulting reference count is zero, frees the path. *)
  external unref : t -> unit = "ml_gsk_path_unref"

  (** Converts the path into a string that is suitable for printing.

  You can use this function in a debugger to get a quick overview
  of the path.

  This is a wrapper around [method@Gsk.Path.print], see that function
  for details. *)
  external to_string : t -> string = "ml_gsk_path_to_string"

  (** Appends the given @path to the given cairo context for drawing
  with Cairo.

  This may cause some suboptimal conversions to be performed as
  Cairo does not support all features of `GskPath`.

  This function does not clear the existing Cairo path. Call
  cairo_new_path() if you want this. *)
  external to_cairo : t -> Ocgtk_cairo.Cairo.Wrappers.Context.t -> unit = "ml_gsk_path_to_cairo"

  (** Increases the reference count of a `GskPath` by one. *)
  external ref : t -> t = "ml_gsk_path_ref"

  (** Checks if the path is empty, i.e. contains no lines or curves. *)
  external is_empty : t -> bool = "ml_gsk_path_is_empty"

  (** Returns if the path represents a single closed
  contour. *)
  external is_closed : t -> bool = "ml_gsk_path_is_closed"

  (** Returns whether the given point is inside the area
  that would be affected if the path was filled according
  to @fill_rule.

  Note that this function assumes that filling a contour
  implicitly closes it. *)
  external in_fill : t -> Ocgtk_graphene.Graphene.Wrappers.Point.t -> Gsk_enums.fillrule -> bool = "ml_gsk_path_in_fill"

  (** Computes the bounds for stroking the given path with the
  parameters in @stroke.

  The returned bounds may be larger than necessary, because this
  function aims to be fast, not accurate. The bounds are guaranteed
  to contain the area affected by the stroke, including protrusions
  like miters. *)
  external get_stroke_bounds : t -> Stroke.t -> bool * Ocgtk_graphene.Graphene.Wrappers.Rect.t = "ml_gsk_path_get_stroke_bounds"

  (** Gets the start point of the path.

  An empty path has no points, so `FALSE`
  is returned in this case. *)
  external get_start_point : t -> bool * Path_point.t = "ml_gsk_path_get_start_point"

  (** Gets the end point of the path.

  An empty path has no points, so `FALSE`
  is returned in this case. *)
  external get_end_point : t -> bool * Path_point.t = "ml_gsk_path_get_end_point"

  (** Computes the closest point on the path to the given point
  and sets the @result to it.

  If there is no point closer than the given threshold,
  `FALSE` is returned. *)
  external get_closest_point : t -> Ocgtk_graphene.Graphene.Wrappers.Point.t -> float -> bool * Path_point.t * float = "ml_gsk_path_get_closest_point"

  (** Computes the bounds of the given path.

  The returned bounds may be larger than necessary, because this
  function aims to be fast, not accurate. The bounds are guaranteed
  to contain the path.

  It is possible that the returned rectangle has 0 width and/or height.
  This can happen when the path only describes a point or an
  axis-aligned line.

  If the path is empty, `FALSE` is returned and @bounds are set to
  graphene_rect_zero(). This is different from the case where the path
  is a single point at the origin, where the @bounds will also be set to
  the zero rectangle but `TRUE` will be returned. *)
  external get_bounds : t -> bool * Ocgtk_graphene.Graphene.Wrappers.Rect.t = "ml_gsk_path_get_bounds"


end

and Path_measure
 : sig
  type t = [`path_measure] Gobject.obj

  (** Create a new PathMeasure *)
  external new_ : Path.t -> t = "ml_gsk_path_measure_new"

  (** Create a new PathMeasure *)
  external new_with_tolerance : Path.t -> float -> t = "ml_gsk_path_measure_new_with_tolerance"

  (* Methods *)
  (** Decreases the reference count of a `GskPathMeasure` by one.

  If the resulting reference count is zero, frees the object. *)
  external unref : t -> unit = "ml_gsk_path_measure_unref"

  (** Increases the reference count of a `GskPathMeasure` by one. *)
  external ref : t -> t = "ml_gsk_path_measure_ref"

  (** Returns the tolerance that the measure was created with. *)
  external get_tolerance : t -> float = "ml_gsk_path_measure_get_tolerance"

  (** Sets @result to the point at the given distance into the path.

  An empty path has no points, so `FALSE` is returned in that case. *)
  external get_point : t -> float -> bool * Path_point.t = "ml_gsk_path_measure_get_point"

  (** Returns the path that the measure was created for. *)
  external get_path : t -> Path.t = "ml_gsk_path_measure_get_path"

  (** Gets the length of the path being measured.

  The length is cached, so this function does not do any work. *)
  external get_length : t -> float = "ml_gsk_path_measure_get_length"


end

and Path_point
 : sig
  type t = [`path_point] Gobject.obj

  (* Methods *)
  (** Gets the tangent of the path at the point.

  Note that certain points on a path may not have a single
  tangent, such as sharp turns. At such points, there are
  two tangents -- the direction of the path going into the
  point, and the direction coming out of it. The @direction
  argument lets you choose which one to get.

  If the path is just a single point (e.g. a circle with
  radius zero), then @tangent is set to `0, 0`.

  If you want to orient something in the direction of the
  path, [method@Gsk.PathPoint.get_rotation] may be more
  convenient to use. *)
  external get_tangent : t -> Path.t -> Gsk_enums.pathdirection -> Ocgtk_graphene.Graphene.Wrappers.Vec2.t = "ml_gsk_path_point_get_tangent"

  (** Gets the direction of the tangent at a given point.

  This is a convenience variant of [method@Gsk.PathPoint.get_tangent]
  that returns the angle between the tangent and the X axis. The angle
  can e.g. be used in
  [gtk_snapshot_rotate()](../gtk4/method.Snapshot.rotate.html). *)
  external get_rotation : t -> Path.t -> Gsk_enums.pathdirection -> float = "ml_gsk_path_point_get_rotation"

  (** Gets the position of the point. *)
  external get_position : t -> Path.t -> Ocgtk_graphene.Graphene.Wrappers.Point.t = "ml_gsk_path_point_get_position"

  (** Returns the distance from the beginning of the path
  to @point. *)
  external get_distance : t -> Path_measure.t -> float = "ml_gsk_path_point_get_distance"

  (** Calculates the curvature of the path at the point.

  Optionally, returns the center of the osculating circle as well.
  The curvature is the inverse of the radius of the osculating circle.

  Lines have a curvature of zero (indicating an osculating circle of
  infinite radius. In this case, the @center is not modified.

  Circles with a radius of zero have `INFINITY` as curvature

  Note that certain points on a path may not have a single curvature,
  such as sharp turns. At such points, there are two curvatures --
  the (limit of) the curvature of the path going into the point,
  and the (limit of) the curvature of the path coming out of it.
  The @direction argument lets you choose which one to get.

  <picture>
    <source srcset="curvature-dark.png" media="(prefers-color-scheme: dark)">
    <img alt="Osculating circle" src="curvature-light.png">
  </picture> *)
  external get_curvature : t -> Path.t -> Gsk_enums.pathdirection -> float * Ocgtk_graphene.Graphene.Wrappers.Point.t option = "ml_gsk_path_point_get_curvature"

  external free : t -> unit = "ml_gsk_path_point_free"

  (** Returns whether the two path points refer to the same
  location on all paths.

  Note that the start- and endpoint of a closed contour
  will compare nonequal according to this definition.
  Use [method@Gsk.Path.is_closed] to find out if the
  start- and endpoint of a concrete path refer to the
  same location. *)
  external equal : t -> t -> bool = "ml_gsk_path_point_equal"

  external copy : t -> t = "ml_gsk_path_point_copy"

  (** Returns whether @point1 is before or after @point2. *)
  external compare : t -> t -> int = "ml_gsk_path_point_compare"


end
