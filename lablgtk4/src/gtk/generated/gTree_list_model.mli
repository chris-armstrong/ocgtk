class tree_list_model : Tree_list_model.t ->
  object
    method autoexpand : bool
    method set_autoexpand : bool -> unit
    method n_items : int
    method passthrough : bool
    method get_child_row : int -> GTree_list_row.tree_list_row option
    method get_row : int -> GTree_list_row.tree_list_row option
    method as_tree_list_model : Tree_list_model.t
  end

