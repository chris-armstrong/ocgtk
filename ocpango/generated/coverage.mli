(** A [PangoCoverage] structure is a map from Unicode characters to
    [Pango.CoverageLevel] values.

    Its methods, signals and properties are on {!class-type-coverage_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocpango.Raw.Coverage}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Coverage].}

    Inherits from: [GObject.Object]

    A [PangoCoverage] structure is a map from Unicode characters to
    [Pango.CoverageLevel] values.

    It is often necessary in Pango to determine if a particular font can
    represent a particular character, and also how well it can represent that
    character. The [PangoCoverage] is a data structure that is used to represent
    that information. It is an opaque structure with no public fields. *)
class type coverage_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_coverage : Raw.Coverage.t
end

class coverage : Raw.Coverage.t -> coverage_t
(** Wraps a raw handle of {!Ocpango.Raw.Coverage.t}. *)

(** {1:description Description}

    A [PangoCoverage] structure is a map from Unicode characters to
    [Pango.CoverageLevel] values.

    It is often necessary in Pango to determine if a particular font can
    represent a particular character, and also how well it can represent that
    character. The [PangoCoverage] is a data structure that is used to represent
    that information. It is an opaque structure with no public fields. *)

(** {1:constructors Constructors} *)

val new_ : unit -> coverage_t
(** Create a new [PangoCoverage] *)
