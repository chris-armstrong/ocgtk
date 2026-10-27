(** The [PangoAnalysis] structure stores information about the properties of a
    segment of text.

    Its methods, signals and properties are on {!class-type-analysis_t}. The
    functions it is built on are in {!Ocpango.Raw.Analysis}. *)

(** The methods, signals and properties of a [PangoAnalysis]. *)
class type analysis_t = object
  method as_analysis : Raw.Analysis.t
end

class analysis : Raw.Analysis.t -> analysis_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Analysis.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoAnalysis], give one already wrapped. *)
