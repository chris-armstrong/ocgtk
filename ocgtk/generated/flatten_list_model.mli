class type flatten_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  method get_model : unit -> Ocgio.List_model.list_model_t option
  method get_model_for_item : int -> Ocgio.List_model.list_model_t option
  method set_model : Ocgio.List_model.list_model_t option -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_flatten_list_model : Raw.Flatten_list_model.t
end

class flatten_list_model : Raw.Flatten_list_model.t -> flatten_list_model_t

val new_ : Ocgio.List_model.list_model_t option -> flatten_list_model_t
