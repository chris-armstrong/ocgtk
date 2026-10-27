class type tree_model_sort_t = object
  inherit Tree_drag_source.tree_drag_source_t
  inherit Tree_model.tree_model_t
  inherit Tree_sortable.tree_sortable_t
  method clear_cache : unit -> unit
  method convert_child_path_to_path : Raw.Tree_path.t -> Raw.Tree_path.t option
  method convert_path_to_child_path : Raw.Tree_path.t -> Raw.Tree_path.t option
  method get_model : unit -> Tree_model.tree_model_t
  method iter_is_valid : Raw.Tree_iter.t -> bool
  method reset_default_sort_func : unit -> unit
  method as_tree_model_sort : Raw.Tree_model_sort.t
end

(* High-level class for TreeModelSort *)
class tree_model_sort (obj : Raw.Tree_model_sort.t) : tree_model_sort_t =
  object (self)
    inherit
      Tree_drag_source.tree_drag_source (Raw.Tree_drag_source.from_gobject obj)

    inherit Tree_model.tree_model (Raw.Tree_model.from_gobject obj)
    inherit Tree_sortable.tree_sortable (Raw.Tree_sortable.from_gobject obj)

    method clear_cache : unit -> unit =
      fun () -> Raw.Tree_model_sort.clear_cache obj

    method convert_child_path_to_path :
        Raw.Tree_path.t -> Raw.Tree_path.t option =
      fun child_path ->
        Raw.Tree_model_sort.convert_child_path_to_path obj child_path

    method convert_path_to_child_path :
        Raw.Tree_path.t -> Raw.Tree_path.t option =
      fun sorted_path ->
        Raw.Tree_model_sort.convert_path_to_child_path obj sorted_path

    method get_model : unit -> Tree_model.tree_model_t =
      fun () -> new Tree_model.tree_model (Raw.Tree_model_sort.get_model obj)

    method iter_is_valid : Raw.Tree_iter.t -> bool =
      fun iter -> Raw.Tree_model_sort.iter_is_valid obj iter

    method reset_default_sort_func : unit -> unit =
      fun () -> Raw.Tree_model_sort.reset_default_sort_func obj

    method as_tree_model_sort = obj
  end

let new_with_model (child_model : Tree_model.tree_model_t) : tree_model_sort_t =
  let child_model = child_model#as_tree_model in
  let obj_ = Raw.Tree_model_sort.new_with_model child_model in
  new tree_model_sort obj_
