class coverage : Coverage.t ->
  object
    method copy : unit -> coverage
    method get : int -> Pango_enums.coveragelevel
    method max : <as_coverage: Coverage.t; ..> -> unit
    method ref : unit -> coverage
    method set : int -> Pango_enums.coveragelevel -> unit
    method unref : unit -> unit
    method as_coverage : Coverage.t
  end

