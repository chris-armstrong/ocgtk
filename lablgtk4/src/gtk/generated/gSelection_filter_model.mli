class selection_filter_model : Selection_filter_model.t ->
  object
    method n_items : int
    method as_selection_filter_model : Selection_filter_model.t
  end

