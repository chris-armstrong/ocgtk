class type selection_filter_model_t = object
  inherit Ocgio.List_model.list_model_t
  method get_model : unit -> Selection_model.selection_model_t option
  method set_model : Selection_model.selection_model_t option -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_selection_filter_model : Raw.Selection_filter_model.t
end

class selection_filter_model :
  Raw.Selection_filter_model.t ->
  selection_filter_model_t

val new_ : Selection_model.selection_model_t option -> selection_filter_model_t
