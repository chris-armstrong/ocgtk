class section_model : Section_model.t ->
  object
    inherit Gsection_model_signals.section_model_signals
    method sections_changed : int -> int -> unit
    method as_section_model : Section_model.t
  end

