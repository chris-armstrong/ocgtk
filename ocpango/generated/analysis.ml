class type analysis_t = object
  (** {2:conversions Conversions} *)

  method as_analysis : Raw.Analysis.t
end

(* High-level class for Analysis *)
class analysis (obj : Raw.Analysis.t) : analysis_t =
  object (self)
    method as_analysis = obj
  end
