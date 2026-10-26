class type map_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  method get_model : unit -> Ocgio.List_model.list_model_t option
  method has_map : unit -> bool
  method set_model : Ocgio.List_model.list_model_t option -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_map_list_model : Raw.Map_list_model.t
end

class map_list_model : Raw.Map_list_model.t -> map_list_model_t
