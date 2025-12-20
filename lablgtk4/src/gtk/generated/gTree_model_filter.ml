(* High-level class for TreeModelFilter *)
class tree_model_filter (obj : Tree_model_filter.t) = object (self)

  method clear_cache : unit -> unit =
    fun () ->
      (Tree_model_filter.clear_cache obj)

  method convert_child_path_to_path : Tree_path.t -> Tree_path.t option =
    fun child_path ->
      (Tree_model_filter.convert_child_path_to_path obj child_path)

  method convert_path_to_child_path : Tree_path.t -> Tree_path.t option =
    fun filter_path ->
      (Tree_model_filter.convert_path_to_child_path obj filter_path)

  method refilter : unit -> unit =
    fun () ->
      (Tree_model_filter.refilter obj)

  method set_visible_column : int -> unit =
    fun column ->
      (Tree_model_filter.set_visible_column obj column)

  method virtual_root = Tree_model_filter.get_virtual_root obj

    method as_tree_model_filter = obj
end

