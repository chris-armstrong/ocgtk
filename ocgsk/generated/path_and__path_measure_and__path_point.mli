(** The classes of {!Ocgsk.Path}, {!Ocgsk.Path_measure}, {!Ocgsk.Path_point},
    defined together because they refer to each other. Each has a module of its
    own that re-exports it; use that module rather than this one. *)

(** The methods, signals and properties of a [Path]. *)
class type path_t = object
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

  method as_path : Raw.Path.t
end

(** The methods, signals and properties of a [PathMeasure]. *)
and path_measure_t = object
  method get_length : unit -> float
  (** Gets the length of the path being measured.

      The length is cached, so this function does not do any work. *)

  method get_path : unit -> Raw.Path.t
  (** Returns the path that the measure was created for. *)

  method get_tolerance : unit -> float
  (** Returns the tolerance that the measure was created with. *)

  method ref : unit -> Raw.Path_measure.t
  (** Increases the reference count of a [GskPathMeasure] by one. *)

  method as_path_measure : Raw.Path_measure.t
end

(** The methods, signals and properties of a [PathPoint]. *)
and path_point_t = object
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
