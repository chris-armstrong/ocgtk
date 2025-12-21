class map_list_model : Map_list_model.t ->
  object
    method has_map : unit -> bool
    method n_items : int
    method as_map_list_model : Map_list_model.t
  end

