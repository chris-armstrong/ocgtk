(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)
class path (obj : Path_and__path_measure_and__path_point.Path.t) = object (self)

  method in_fill : 'p1. (#Ocgtk_graphene.Graphene.point as 'p1) -> Gsk_enums.fillrule -> bool =
    fun point fill_rule ->
      let point = point#as_point in
      (Path_and__path_measure_and__path_point.Path.in_fill obj point fill_rule)

  method is_closed : unit -> bool =
    fun () ->
      (Path_and__path_measure_and__path_point.Path.is_closed obj)

  method is_empty : unit -> bool =
    fun () ->
      (Path_and__path_measure_and__path_point.Path.is_empty obj)

  method ref : unit -> Path_and__path_measure_and__path_point.Path.t =
    fun () ->
      (Path_and__path_measure_and__path_point.Path.ref obj)

  method to_cairo : 'p1. (#Ocgtk_cairo.Cairo.context as 'p1) -> unit =
    fun cr ->
      let cr = cr#as_context in
      (Path_and__path_measure_and__path_point.Path.to_cairo obj cr)

  method to_string : unit -> string =
    fun () ->
      (Path_and__path_measure_and__path_point.Path.to_string obj)

  method unref : unit -> unit =
    fun () ->
      (Path_and__path_measure_and__path_point.Path.unref obj)

    method as_path = obj
end

and path_measure (obj : Path_and__path_measure_and__path_point.Path_measure.t) = object (self)

  method get_length : unit -> float =
    fun () ->
      (Path_and__path_measure_and__path_point.Path_measure.get_length obj)

  method get_path : unit -> Path_and__path_measure_and__path_point.Path.t =
    fun () ->
      (Path_and__path_measure_and__path_point.Path_measure.get_path obj)

  method get_tolerance : unit -> float =
    fun () ->
      (Path_and__path_measure_and__path_point.Path_measure.get_tolerance obj)

  method ref : unit -> Path_and__path_measure_and__path_point.Path_measure.t =
    fun () ->
      (Path_and__path_measure_and__path_point.Path_measure.ref obj)

  method unref : unit -> unit =
    fun () ->
      (Path_and__path_measure_and__path_point.Path_measure.unref obj)

    method as_path_measure = obj
end

and path_point (obj : Path_and__path_measure_and__path_point.Path_point.t) = object (self)

  method compare : Path_and__path_measure_and__path_point.Path_point.t -> int =
    fun point2 ->
      (Path_and__path_measure_and__path_point.Path_point.compare obj point2)

  method copy : unit -> Path_and__path_measure_and__path_point.Path_point.t =
    fun () ->
      (Path_and__path_measure_and__path_point.Path_point.copy obj)

  method equal : Path_and__path_measure_and__path_point.Path_point.t -> bool =
    fun point2 ->
      (Path_and__path_measure_and__path_point.Path_point.equal obj point2)

  method free : unit -> unit =
    fun () ->
      (Path_and__path_measure_and__path_point.Path_point.free obj)

  method get_distance : Path_and__path_measure_and__path_point.Path_measure.t -> float =
    fun measure ->
      (Path_and__path_measure_and__path_point.Path_point.get_distance obj measure)

  method get_rotation : Path_and__path_measure_and__path_point.Path.t -> Gsk_enums.pathdirection -> float =
    fun path direction ->
      (Path_and__path_measure_and__path_point.Path_point.get_rotation obj path direction)

    method as_path_point = obj
end
