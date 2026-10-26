class type analysis_t = object
  method as_analysis : Analysis.t
end

(* High-level class for Analysis *)
class analysis (obj : Analysis.t) : analysis_t =
  object (self)
    method as_analysis = obj
  end
