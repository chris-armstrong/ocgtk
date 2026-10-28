class type coverage_t = object
  method copy : unit -> coverage_t
  (** Copy an existing [PangoCoverage]. *)

  method get : int -> Enums.coveragelevel
  (** Determine whether a particular index is covered by [coverage]. *)

  method max : coverage_t -> unit
  (** Set the coverage for each index in [coverage] to be the max (better) value
      of the current coverage for the index and the coverage for the
      corresponding index in [other]. *)

  method ref : unit -> coverage_t
  (** Increase the reference count on the [PangoCoverage] by one. *)

  method set : int -> Enums.coveragelevel -> unit
  (** Modify a particular index within [coverage] *)

  method unref : unit -> unit
  (** Decrease the reference count on the [PangoCoverage] by one.

      If the result is zero, free the coverage and all associated memory. *)

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
