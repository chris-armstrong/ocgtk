class selection_filter_model : Selection_filter_model.t ->
  object
    method get_model : unit -> GSelection_model.selection_model option
    method set_model : GSelection_model.selection_model option -> unit
    method as_selection_filter_model : Selection_filter_model.t
  end

