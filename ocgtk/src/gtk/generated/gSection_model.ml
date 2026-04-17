(* Signal class defined in gsection_model_signals.ml *)

class type section_model_t = object
    inherit Gsection_model_signals.section_model_signals
    method sections_changed : int -> int -> unit
    method as_section_model : Section_model.t
end

(* High-level class for SectionModel *)
class section_model (obj : Section_model.t) : section_model_t = object (self)
  inherit Gsection_model_signals.section_model_signals obj

  method sections_changed : int -> int -> unit =
    fun position n_items ->
      (Section_model.sections_changed obj position n_items)

    method as_section_model = obj
end

