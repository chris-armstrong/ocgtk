class type selection_filter_model_t = object
    method get_model : unit -> GSelection_model.selection_model_t option
    method n_items : int
    method as_selection_filter_model : Selection_filter_model.t
end

class selection_filter_model : Selection_filter_model.t -> selection_filter_model_t

