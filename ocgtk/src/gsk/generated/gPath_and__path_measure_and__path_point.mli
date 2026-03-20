
class type path_t = object
    method in_fill : Ocgtk_graphene.Graphene.point_t -> Gsk_enums.fillrule -> bool
    method is_closed : unit -> bool
    method is_empty : unit -> bool
    method ref : unit -> Path_and__path_measure_and__path_point.Path.t
    method to_cairo : Ocgtk_cairo.Cairo.context_t -> unit
    method to_string : unit -> string
    method unref : unit -> unit
    method as_path : Path_and__path_measure_and__path_point.Path.t
end

and path_measure_t = object
    method get_length : unit -> float
    method get_path : unit -> Path_and__path_measure_and__path_point.Path.t
    method get_tolerance : unit -> float
    method ref : unit -> Path_and__path_measure_and__path_point.Path_measure.t
    method unref : unit -> unit
    method as_path_measure : Path_and__path_measure_and__path_point.Path_measure.t
end

and path_point_t = object
    method compare : Path_and__path_measure_and__path_point.Path_point.t -> int
    method copy : unit -> Path_and__path_measure_and__path_point.Path_point.t
    method equal : Path_and__path_measure_and__path_point.Path_point.t -> bool
    method free : unit -> unit
    method get_distance : Path_and__path_measure_and__path_point.Path_measure.t -> float
    method get_rotation : Path_and__path_measure_and__path_point.Path.t -> Gsk_enums.pathdirection -> float
    method as_path_point : Path_and__path_measure_and__path_point.Path_point.t
end


class path : Path_and__path_measure_and__path_point.Path.t -> path_t

and path_measure : Path_and__path_measure_and__path_point.Path_measure.t -> path_measure_t

and path_point : Path_and__path_measure_and__path_point.Path_point.t -> path_point_t
