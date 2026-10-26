(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for PathMeasure from cyclic group Path_and__path_measure_and__path_point *)

class type path_measure_t =
  Path_and__path_measure_and__path_point.path_measure_t

class path_measure = Path_and__path_measure_and__path_point.path_measure

let new_ (path : Raw.Path.t) : path_measure_t =
  let obj_ = Raw.Path_measure.new_ path in
  new path_measure obj_

let new_with_tolerance (path : Raw.Path.t) (tolerance : float) : path_measure_t
    =
  let obj_ = Raw.Path_measure.new_with_tolerance path tolerance in
  new path_measure obj_
