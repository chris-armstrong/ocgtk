(* Signal class defined in gsection_model_signals.ml *)

(* High-level class for SectionModel *)
class section_model (obj : Section_model.t) = object (self)
  inherit Gsection_model_signals.section_model_signals obj

  method sections_changed : int -> int -> unit = fun position n_items -> (Section_model.sections_changed obj position n_items)

    method as_section_model = obj
end

