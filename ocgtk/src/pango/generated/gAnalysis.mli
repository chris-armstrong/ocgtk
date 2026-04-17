class type analysis_t = object
  method as_analysis : Analysis.t
end

class analysis : Analysis.t -> analysis_t
