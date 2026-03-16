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

  (** Increases the reference count of a `GskPath` by one. *)
  external ref : t -> t = "ml_gsk_path_ref"

  (** Checks if the path is empty, i.e. contains no lines or curves. *)
  external is_empty : t -> bool = "ml_gsk_path_is_empty"

  (** Returns if the path represents a single closed
  contour. *)
  external is_closed : t -> bool = "ml_gsk_path_is_closed"

  (** Gets the start point of the path.

  An empty path has no points, so `FALSE`
  is returned in this case. *)
  external get_start_point : t -> bool * Path_point.t = "ml_gsk_path_get_start_point"

  (** Gets the end point of the path.

  An empty path has no points, so `FALSE`
  is returned in this case. *)
  external get_end_point : t -> bool * Path_point.t = "ml_gsk_path_get_end_point"


end = struct
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

  (** Increases the reference count of a `GskPath` by one. *)
  external ref : t -> t = "ml_gsk_path_ref"

  (** Checks if the path is empty, i.e. contains no lines or curves. *)
  external is_empty : t -> bool = "ml_gsk_path_is_empty"

  (** Returns if the path represents a single closed
  contour. *)
  external is_closed : t -> bool = "ml_gsk_path_is_closed"

  (** Gets the start point of the path.

  An empty path has no points, so `FALSE`
  is returned in this case. *)
  external get_start_point : t -> bool * Path_point.t = "ml_gsk_path_get_start_point"

  (** Gets the end point of the path.

  An empty path has no points, so `FALSE`
  is returned in this case. *)
  external get_end_point : t -> bool * Path_point.t = "ml_gsk_path_get_end_point"


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


end = struct
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
  (** Gets the direction of the tangent at a given point.

  This is a convenience variant of [method@Gsk.PathPoint.get_tangent]
  that returns the angle between the tangent and the X axis. The angle
  can e.g. be used in
  [gtk_snapshot_rotate()](../gtk4/method.Snapshot.rotate.html). *)
  external get_rotation : t -> Path.t -> Gsk_enums.pathdirection -> float = "ml_gsk_path_point_get_rotation"

  (** Returns the distance from the beginning of the path
  to @point. *)
  external get_distance : t -> Path_measure.t -> float = "ml_gsk_path_point_get_distance"

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


end = struct
  type t = [`path_point] Gobject.obj

  (* Methods *)
  (** Gets the direction of the tangent at a given point.

  This is a convenience variant of [method@Gsk.PathPoint.get_tangent]
  that returns the angle between the tangent and the X axis. The angle
  can e.g. be used in
  [gtk_snapshot_rotate()](../gtk4/method.Snapshot.rotate.html). *)
  external get_rotation : t -> Path.t -> Gsk_enums.pathdirection -> float = "ml_gsk_path_point_get_rotation"

  (** Returns the distance from the beginning of the path
  to @point. *)
  external get_distance : t -> Path_measure.t -> float = "ml_gsk_path_point_get_distance"

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
