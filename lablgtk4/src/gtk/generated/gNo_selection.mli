class no_selection : No_selection.t ->
  object
    method n_items : int
    method as_no_selection : No_selection.t
  end

