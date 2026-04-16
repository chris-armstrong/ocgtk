class type coverage_t = object
  method copy : unit -> coverage_t
  method get : int -> Pango_enums.coveragelevel
  method max : coverage_t -> unit
  method ref : unit -> coverage_t
  method set : int -> Pango_enums.coveragelevel -> unit
  method unref : unit -> unit
  method as_coverage : Coverage.t
end

(* High-level class for Coverage *)
class coverage (obj : Coverage.t) : coverage_t =
  object (self)
    method copy : unit -> coverage_t =
      fun () -> new coverage (Coverage.copy obj)

    method get : int -> Pango_enums.coveragelevel =
      fun index_ -> Coverage.get obj index_

    method max : coverage_t -> unit =
      fun other ->
        let other = other#as_coverage in
        Coverage.max obj other

    method ref : unit -> coverage_t = fun () -> new coverage (Coverage.ref obj)

    method set : int -> Pango_enums.coveragelevel -> unit =
      fun index_ level -> Coverage.set obj index_ level

    method unref : unit -> unit = fun () -> Coverage.unref obj
    method as_coverage = obj
  end

let new_ () : coverage_t = new coverage (Coverage.new_ ())
