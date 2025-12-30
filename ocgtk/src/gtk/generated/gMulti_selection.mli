class multi_selection : Multi_selection.t ->
  object
    method n_items : int
    method as_multi_selection : Multi_selection.t
  end

