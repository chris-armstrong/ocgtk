class type section_model_t = object
  method on_sections_changed :
    callback:(position:int -> n_items:int -> unit) -> Gobject.Signal.handler_id

  method sections_changed : int -> int -> unit
  method as_section_model : Section_model.t
end

(* High-level class for SectionModel *)
class section_model (obj : Section_model.t) : section_model_t =
  object (self)
    method on_sections_changed ~callback =
      Section_model.on_sections_changed self#as_section_model ~callback

    method sections_changed : int -> int -> unit =
      fun position n_items ->
        Section_model.sections_changed obj position n_items

    method as_section_model = obj
  end
