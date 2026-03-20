class type coverage_t = object
    method copy : unit -> coverage_t
    method get : int -> Pango_enums.coveragelevel
    method max : coverage_t -> unit
    method ref : unit -> coverage_t
    method set : int -> Pango_enums.coveragelevel -> unit
    method unref : unit -> unit
    method as_coverage : Coverage.t
end

class coverage : Coverage.t -> coverage_t

