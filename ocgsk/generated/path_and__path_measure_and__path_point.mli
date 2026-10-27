(** The classes of {!Ocgsk.Path}, {!Ocgsk.Path_measure}, {!Ocgsk.Path_point},
    defined together because they refer to each other. Each has a module of its
    own that re-exports it; use that module rather than this one. *)

(** The methods, signals and properties of a [GskPath]. *)
class type path_t = object
  method in_fill : Ocgraphene.Point.point_t -> Enums.fillrule -> bool
  method is_closed : unit -> bool
  method is_empty : unit -> bool
  method ref : unit -> Raw.Path.t
  method to_cairo : Occairo.Context.context_t -> unit
  method to_string : unit -> string
  method as_path : Raw.Path.t
end

(** The methods, signals and properties of a [GskPathMeasure]. *)
and path_measure_t = object
  method get_length : unit -> float
  method get_path : unit -> Raw.Path.t
  method get_tolerance : unit -> float
  method ref : unit -> Raw.Path_measure.t
  method as_path_measure : Raw.Path_measure.t
end

(** The methods, signals and properties of a [GskPathPoint]. *)
and path_point_t = object
  method compare : Raw.Path_point.t -> int
  method equal : Raw.Path_point.t -> bool
  method get_distance : Raw.Path_measure.t -> float
  method get_rotation : Raw.Path.t -> Enums.pathdirection -> float
  method as_path_point : Raw.Path_point.t
end

(** Wraps a layer 1 handle, {!Ocgsk.Raw.Path.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GskPath], give one already wrapped. *)
class path : Raw.Path.t -> path_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Path_measure.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GskPathMeasure], give one already wrapped. *)

and path_measure : Raw.Path_measure.t -> path_measure_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Path_point.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GskPathPoint], give one already wrapped. *)

and path_point : Raw.Path_point.t -> path_point_t

val new_ : Raw.Path.t -> path_measure_t
val new_with_tolerance : Raw.Path.t -> float -> path_measure_t
