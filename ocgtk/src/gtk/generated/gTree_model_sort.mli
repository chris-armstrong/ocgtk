class type tree_model_sort_t = object
  inherit GTree_drag_source.tree_drag_source_t
  inherit GTree_model.tree_model_t
  inherit GTree_sortable.tree_sortable_t
  method clear_cache : unit -> unit
  method convert_child_path_to_path : Tree_path.t -> Tree_path.t option
  method convert_path_to_child_path : Tree_path.t -> Tree_path.t option
  method get_model : unit -> GTree_model.tree_model_t
  method iter_is_valid : Tree_iter.t -> bool
  method reset_default_sort_func : unit -> unit
  method as_tree_model_sort : Tree_model_sort.t
end

class tree_model_sort : Tree_model_sort.t -> tree_model_sort_t

val new_with_model : GTree_model.tree_model_t -> tree_model_sort_t
