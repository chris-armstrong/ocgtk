
class path : Path_and__path_measure_and__path_point.Path.t ->
  object
    method is_closed : unit -> bool
    method is_empty : unit -> bool
    method ref : unit -> Path_and__path_measure_and__path_point.Path.t
    method to_string : unit -> string
    method unref : unit -> unit
    method as_path : Path_and__path_measure_and__path_point.Path.t
  end

and path_measure : Path_and__path_measure_and__path_point.Path_measure.t ->
  object
    method get_length : unit -> float
    method get_path : unit -> Path_and__path_measure_and__path_point.Path.t
    method get_tolerance : unit -> float
    method ref : unit -> Path_and__path_measure_and__path_point.Path_measure.t
    method unref : unit -> unit
    method as_path_measure : Path_and__path_measure_and__path_point.Path_measure.t
  end

and path_point : Path_and__path_measure_and__path_point.Path_point.t ->
  object
    method compare : Path_and__path_measure_and__path_point.Path_point.t -> int
    method copy : unit -> Path_and__path_measure_and__path_point.Path_point.t
    method equal : Path_and__path_measure_and__path_point.Path_point.t -> bool
    method free : unit -> unit
    method get_distance : Path_and__path_measure_and__path_point.Path_measure.t -> float
    method get_rotation : Path_and__path_measure_and__path_point.Path.t -> Gsk_enums.pathdirection -> float
    method as_path_point : Path_and__path_measure_and__path_point.Path_point.t
  end
