class type tree_model_sort_t = object
    method clear_cache : unit -> unit
    method convert_child_path_to_path : Tree_path.t -> Tree_path.t option
    method convert_path_to_child_path : Tree_path.t -> Tree_path.t option
    method get_model : unit -> GTree_model.tree_model_t
    method iter_is_valid : Tree_iter.t -> bool
    method reset_default_sort_func : unit -> unit
    method as_tree_model_sort : Tree_model_sort.t
end

(* High-level class for TreeModelSort *)
class tree_model_sort (obj : Tree_model_sort.t) : tree_model_sort_t = object (self)

  method clear_cache : unit -> unit =
    fun () ->
      (Tree_model_sort.clear_cache obj)

  method convert_child_path_to_path : Tree_path.t -> Tree_path.t option =
    fun child_path ->
      (Tree_model_sort.convert_child_path_to_path obj child_path)

  method convert_path_to_child_path : Tree_path.t -> Tree_path.t option =
    fun sorted_path ->
      (Tree_model_sort.convert_path_to_child_path obj sorted_path)

  method get_model : unit -> GTree_model.tree_model_t =
    fun () ->
      new  GTree_model.tree_model(Tree_model_sort.get_model obj)

  method iter_is_valid : Tree_iter.t -> bool =
    fun iter ->
      (Tree_model_sort.iter_is_valid obj iter)

  method reset_default_sort_func : unit -> unit =
    fun () ->
      (Tree_model_sort.reset_default_sort_func obj)

    method as_tree_model_sort = obj
end

let new_with_model (child_model : GTree_model.tree_model_t) : tree_model_sort_t =
  let child_model = child_model#as_tree_model in
  let obj_ = Tree_model_sort.new_with_model child_model in
  new tree_model_sort obj_

