(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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
      [cairo_new_path ()] if you want this. *)

  method to_string : unit -> string
  (** Converts the path into a human-readable string.

      You can use this function in a debugger to get a quick overview of the
      path.

      This is a wrapper around [Gsk.Path.print], see that function for details.
  *)

  (** {2:conversions Conversions} *)

  method as_path : Raw.Path.t
end

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
      in [gtk_snapshot_rotate ()]. *)

  (** {2:conversions Conversions} *)

  method as_path_point : Raw.Path_point.t
end

class path (obj : Raw.Path.t) : path_t =
  object (self)
    method in_fill : Ocgraphene.Point.point_t -> Enums.fillrule -> bool =
      fun point fill_rule ->
        let point = point#as_point in
        Raw.Path.in_fill obj point fill_rule

    method is_closed : unit -> bool = fun () -> Raw.Path.is_closed obj
    method is_empty : unit -> bool = fun () -> Raw.Path.is_empty obj
    method ref : unit -> Raw.Path.t = fun () -> Raw.Path.ref obj

    method to_cairo : Occairo.Context.context_t -> unit =
      fun cr ->
        let cr = cr#as_context in
        Raw.Path.to_cairo obj cr

    method to_string : unit -> string = fun () -> Raw.Path.to_string obj
    method as_path = obj
  end

and path_measure (obj : Raw.Path_measure.t) : path_measure_t =
  object (self)
    method get_length : unit -> float =
      fun () -> Raw.Path_measure.get_length obj

    method get_path : unit -> Raw.Path.t =
      fun () -> Raw.Path_measure.get_path obj

    method get_tolerance : unit -> float =
      fun () -> Raw.Path_measure.get_tolerance obj

    method ref : unit -> Raw.Path_measure.t = fun () -> Raw.Path_measure.ref obj
    method as_path_measure = obj
  end

and path_point (obj : Raw.Path_point.t) : path_point_t =
  object (self)
    method compare : Raw.Path_point.t -> int =
      fun point2 -> Raw.Path_point.compare obj point2

    method equal : Raw.Path_point.t -> bool =
      fun point2 -> Raw.Path_point.equal obj point2

    method get_distance : Raw.Path_measure.t -> float =
      fun measure -> Raw.Path_point.get_distance obj measure

    method get_rotation : Raw.Path.t -> Enums.pathdirection -> float =
      fun path direction -> Raw.Path_point.get_rotation obj path direction

    method as_path_point = obj
  end

let new_ (path : Raw.Path.t) : path_measure_t =
  let obj_ = Raw.Path_measure.new_ path in
  new path_measure obj_

let new_with_tolerance (path : Raw.Path.t) (tolerance : float) : path_measure_t
    =
  let obj_ = Raw.Path_measure.new_with_tolerance path tolerance in
  new path_measure obj_
