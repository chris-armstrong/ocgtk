(** The classes of {!Ocgsk.Path}, {!Ocgsk.Path_measure}, {!Ocgsk.Path_point},
    defined together because they refer to each other. Each has a module of its
    own that re-exports it; use that module rather than this one. *)

(** {b The methods, signals and properties of a [Path].}

    Describes lines and curves that are more complex than simple rectangles.

    Paths can used for rendering (filling or stroking) and for animations (e.g.
    as trajectories).

    [GskPath] is an immutable, opaque, reference-counted struct. After creation,
    you cannot change the types it represents. Instead, new [GskPath] objects
    have to be created. The
    {{!Ocgsk.Path_builder.class-type-path_builder_t}[Gsk.PathBuilder]} structure
    is meant to help in this endeavor.

    Conceptually, a path consists of zero or more contours (continuous,
    connected curves), each of which may or may not be closed. Contours are
    typically constructed from Bézier segments.

    A Path *)
class type path_t = object
  (** {2:methods Methods} *)

  method in_fill : Ocgraphene.Point.point_t -> Enums.fillrule -> bool
  (** Returns whether a point is inside the fill area of a path.

      Note that this function assumes that filling a contour implicitly closes
      it. *)

  method is_closed : unit -> bool
  (** Returns if the path represents a single closed contour. *)

  method is_empty : unit -> bool
  (** Checks if the path is empty, i.e. contains no lines or curves. *)

  method ref : unit -> Raw.Path.t
  (** Increases the reference count of a path by one. *)

  method to_cairo : Occairo.Context.context_t -> unit
  (** Appends the path to a cairo context for drawing with Cairo.

      This may cause some suboptimal conversions to be performed as Cairo does
      not support all features of [GskPath].

      This function does not clear the existing Cairo path. Call
      cairo_new_path() if you want this. *)

  method to_string : unit -> string
  (** Converts the path into a human-readable string.

      You can use this function in a debugger to get a quick overview of the
      path.

      This is a wrapper around [Gsk.Path.print], see that function for details.
  *)

  (** {2:conversions Conversions} *)

  method as_path : Raw.Path.t
end

(** {b The methods, signals and properties of a [PathMeasure].}

    Performs measurements on paths such as determining the length of the path.

    Many measuring operations require sampling the path length at intermediate
    points. Therefore, a [GskPathMeasure] has a tolerance that determines what
    precision is required for such approximations.

    A [GskPathMeasure] struct is a reference counted struct and should be
    treated as opaque. *)
and path_measure_t = object
  (** {2:methods Methods} *)

  method get_length : unit -> float
  (** Gets the length of the path being measured.

      The length is cached, so this function does not do any work. *)

  method get_path : unit -> Raw.Path.t
  (** Returns the path that the measure was created for. *)

  method get_tolerance : unit -> float
  (** Returns the tolerance that the measure was created with. *)

  method ref : unit -> Raw.Path_measure.t
  (** Increases the reference count of a [GskPathMeasure] by one. *)

  (** {2:conversions Conversions} *)

  method as_path_measure : Raw.Path_measure.t
end

(** {b The methods, signals and properties of a [PathPoint].}

    Represents a point on a path.

    It can be queried for properties of the path at that point, such as its
    tangent or its curvature.

    To obtain a [GskPathPoint], use [Gsk.Path.get_closest_point],
    [Gsk.Path.get_start_point], [Gsk.Path.get_end_point] or
    [Gsk.PathMeasure.get_point].

    Note that [GskPathPoint] structs are meant to be stack-allocated, and don't
    hold a reference to the path object they are obtained from. It is the
    callers responsibility to keep a reference to the path as long as the
    [GskPathPoint] is used. *)
and path_point_t = object
  (** {2:methods Methods} *)

  method compare : Raw.Path_point.t -> int
  (** Returns whether [point1] is before or after [point2]. *)

  method equal : Raw.Path_point.t -> bool
  (** Returns whether the two path points refer to the same location on all
      paths.

      Note that the start- and endpoint of a closed contour will compare
      nonequal according to this definition. Use [Gsk.Path.is_closed] to find
      out if the start- and endpoint of a concrete path refer to the same
      location. *)

  method get_distance : Raw.Path_measure.t -> float
  (** Returns the distance from the beginning of the path to the point. *)

  method get_rotation : Raw.Path.t -> Enums.pathdirection -> float
  (** Gets the direction of the tangent at a given point.

      This is a convenience variant of [Gsk.PathPoint.get_tangent] that returns
      the angle between the tangent and the X axis. The angle can e.g. be used
      in gtk_snapshot_rotate(). *)

  (** {2:conversions Conversions} *)

  method as_path_point : Raw.Path_point.t
end

(** Wraps a raw handle of {!Ocgsk.Raw.Path.t}. *)
class path : Raw.Path.t -> path_t
(** Wraps a raw handle of {!Ocgsk.Raw.Path_measure.t}. *)

and path_measure : Raw.Path_measure.t -> path_measure_t
(** Wraps a raw handle of {!Ocgsk.Raw.Path_point.t}. *)

and path_point : Raw.Path_point.t -> path_point_t

val new_ : Raw.Path.t -> path_measure_t
(** Creates a measure object for the given [path] with the default tolerance. *)

val new_with_tolerance : Raw.Path.t -> float -> path_measure_t
(** Creates a measure object for the given [path] and [tolerance]. *)
