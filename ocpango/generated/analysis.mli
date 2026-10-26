class type analysis_t = object
  method as_analysis : Raw.Analysis.t
end

class analysis : Raw.Analysis.t -> analysis_t
