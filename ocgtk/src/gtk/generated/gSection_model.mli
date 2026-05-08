class type section_model_t = object
  method on_sections_changed :
    callback:(position:int -> n_items:int -> unit) -> Gobject.Signal.handler_id

  method sections_changed : int -> int -> unit
  method as_section_model : Section_model.t
end

class section_model : Section_model.t -> section_model_t
