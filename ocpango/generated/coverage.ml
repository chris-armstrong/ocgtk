class type coverage_t = object
  method copy : unit -> coverage_t
  method get : int -> Enums.coveragelevel
  method max : coverage_t -> unit
  method ref : unit -> coverage_t
  method set : int -> Enums.coveragelevel -> unit
  method unref : unit -> unit
  method as_coverage : Raw.Coverage.t
end

(* High-level class for Coverage *)
class coverage (obj : Raw.Coverage.t) : coverage_t =
  object (self)
    method copy : unit -> coverage_t =
      fun () -> new coverage (Raw.Coverage.copy obj)

    method get : int -> Enums.coveragelevel =
      fun index_ -> Raw.Coverage.get obj index_

    method max : coverage_t -> unit =
      fun other ->
        let other = other#as_coverage in
        Raw.Coverage.max obj other

    method ref : unit -> coverage_t =
      fun () -> new coverage (Raw.Coverage.ref obj)

    method set : int -> Enums.coveragelevel -> unit =
      fun index_ level -> Raw.Coverage.set obj index_ level

    method unref : unit -> unit = fun () -> Raw.Coverage.unref obj
    method as_coverage = obj
  end

let new_ () : coverage_t = new coverage (Raw.Coverage.new_ ())
