(* High-level class for Coverage *)
class coverage (obj : Coverage.t) = object (self)

  method copy : unit -> coverage =
    fun () ->
      new  coverage(Coverage.copy obj)

  method get : int -> Pango_enums.coveragelevel =
    fun index_ ->
      (Coverage.get obj index_)

  method max : 'p1. (<as_coverage: Coverage.t; ..> as 'p1) -> unit =
    fun other ->
      let other = other#as_coverage in
      (Coverage.max obj other)

  method ref : unit -> coverage =
    fun () ->
      new  coverage(Coverage.ref obj)

  method set : int -> Pango_enums.coveragelevel -> unit =
    fun index_ level ->
      (Coverage.set obj index_ level)

  method unref : unit -> unit =
    fun () ->
      (Coverage.unref obj)

    method as_coverage = obj
end

