(** The [PangoAnalysis] structure stores information about the properties of a
    segment of text.

    Its methods, signals and properties are on {!class-type-analysis_t}. The
    functions it is built on are in {!Ocpango.Raw.Analysis}. *)

(** {b The methods, signals and properties of a [Analysis].}

    The [PangoAnalysis] structure stores information about the properties of a
    segment of text. *)
class type analysis_t = object
  method as_analysis : Raw.Analysis.t
end

class analysis : Raw.Analysis.t -> analysis_t
(** Wraps a raw handle of {!Ocpango.Raw.Analysis.t}. *)
