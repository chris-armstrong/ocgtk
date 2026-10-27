class type coverage_t = object
  method copy : unit -> coverage_t
  method get : int -> Enums.coveragelevel
  method max : coverage_t -> unit
  method ref : unit -> coverage_t
  method set : int -> Enums.coveragelevel -> unit
  method unref : unit -> unit
  method as_coverage : Raw.Coverage.t
end

class coverage : Raw.Coverage.t -> coverage_t

val new_ : unit -> coverage_t
