class type section_model_t = object
  inherit Gsection_model_signals.section_model_signals
  method sections_changed : int -> int -> unit
  method as_section_model : Section_model.t
end

class section_model : Section_model.t -> section_model_t
