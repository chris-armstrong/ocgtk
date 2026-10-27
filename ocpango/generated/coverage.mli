(** A [PangoCoverage] structure is a map from Unicode characters to
    [Pango.CoverageLevel] values.

    It is often necessary in Pango to determine if a particular font can
    represent a particular character, and also how well it can represent that
    character. The [PangoCoverage] is a data structure that is used to represent
    that information. It is an opaque structure with no public fields.

    Its methods, signals and properties are on {!class-type-coverage_t}. The
    functions it is built on are in {!Ocpango.Raw.Coverage}. *)

(** The methods, signals and properties of a [PangoCoverage]. *)
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
(** Wraps a layer 1 handle, {!Ocpango.Raw.Coverage.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoCoverage], give one already wrapped. *)

val new_ : unit -> coverage_t
