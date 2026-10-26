(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type path_t = object
  method in_fill : Ocgraphene.Point.point_t -> Enums.fillrule -> bool
  method is_closed : unit -> bool
  method is_empty : unit -> bool
  method ref : unit -> Raw.Path.t
  method to_cairo : Occairo.Context.context_t -> unit
  method to_string : unit -> string
  method as_path : Raw.Path.t
end

and path_measure_t = object
  method get_length : unit -> float
  method get_path : unit -> Raw.Path.t
  method get_tolerance : unit -> float
  method ref : unit -> Raw.Path_measure.t
  method as_path_measure : Raw.Path_measure.t
end

and path_point_t = object
  method compare : Raw.Path_point.t -> int
  method equal : Raw.Path_point.t -> bool
  method get_distance : Raw.Path_measure.t -> float
  method get_rotation : Raw.Path.t -> Enums.pathdirection -> float
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
