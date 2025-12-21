class tree_model_sort : Tree_model_sort.t ->
  object
    method clear_cache : unit -> unit
    method convert_child_path_to_path : Tree_path.t -> Tree_path.t option
    method convert_path_to_child_path : Tree_path.t -> Tree_path.t option
    method iter_is_valid : Tree_iter.t -> bool
    method reset_default_sort_func : unit -> unit
    method as_tree_model_sort : Tree_model_sort.t
  end

