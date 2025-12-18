(* High-level class for TreeModelSort *)
class tree_model_sort (obj : Tree_model_sort.t) = object (self)

  method clear_cache : unit -> unit = fun () -> (Tree_model_sort.clear_cache obj )

  method convert_child_path_to_path : Tree_path.t -> Tree_path.t option = fun child_path -> (Tree_model_sort.convert_child_path_to_path obj child_path)

  method convert_path_to_child_path : Tree_path.t -> Tree_path.t option = fun sorted_path -> (Tree_model_sort.convert_path_to_child_path obj sorted_path)

  method get_model : unit -> GTree_model.tree_model = fun () -> new  GTree_model.tree_model(Tree_model_sort.get_model obj )

  method iter_is_valid : Tree_iter.t -> bool = fun iter -> (Tree_model_sort.iter_is_valid obj iter)

  method reset_default_sort_func : unit -> unit = fun () -> (Tree_model_sort.reset_default_sort_func obj )

    method as_tree_model_sort = obj
end

