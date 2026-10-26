class type accessible_text_t = object
  method update_caret_position : unit -> unit

  method update_contents :
    Enums.accessibletextcontentchange -> int -> int -> unit

  method update_selection_bound : unit -> unit
  method as_accessible_text : Raw.Accessible_text.t
end

class accessible_text : Raw.Accessible_text.t -> accessible_text_t
