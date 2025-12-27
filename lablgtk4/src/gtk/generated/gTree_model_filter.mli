class tree_model_filter : Tree_model_filter.t ->
  object
    method clear_cache : unit -> unit
    method convert_child_path_to_path : Tree_path.t -> Tree_path.t option
    method convert_path_to_child_path : Tree_path.t -> Tree_path.t option
    method get_model : unit -> GTree_model.tree_model
    method refilter : unit -> unit
    method set_visible_column : int -> unit
    method virtual_root : Tree_path.t
    method as_tree_model_filter : Tree_model_filter.t
  end

