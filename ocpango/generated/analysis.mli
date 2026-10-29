(** The [PangoAnalysis] structure stores information about the properties of a
    segment of text.

    Its methods, signals and properties are on {!class-type-analysis_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocpango.Raw.Analysis}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Analysis].}

    The [PangoAnalysis] structure stores information about the properties of a
    segment of text. *)
class type analysis_t = object
  (** {2:conversions Conversions} *)

  method as_analysis : Raw.Analysis.t
end

class analysis : Raw.Analysis.t -> analysis_t
(** Wraps a raw handle of {!Ocpango.Raw.Analysis.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
