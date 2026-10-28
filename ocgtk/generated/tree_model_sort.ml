class type tree_model_sort_t = object
  inherit Tree_drag_source.tree_drag_source_t
  inherit Tree_model.tree_model_t
  inherit Tree_sortable.tree_sortable_t

  (** {2:methods Methods} *)

  method clear_cache : unit -> unit
  (** This function should almost never be called. It clears the
      [tree_model_sort] of any cached iterators that haven’t been reffed with
      gtk_tree_model_ref_node(). This might be useful if the child model being
      sorted is static (and doesn’t change often) and there has been a lot of
      unreffed access to nodes. As a side effect of this function, all unreffed
      iters will be invalid. *)

  method convert_child_path_to_path : Raw.Tree_path.t -> Raw.Tree_path.t option
  (** Converts [child_path] to a path relative to [tree_model_sort]. That is,
      [child_path] points to a path in the child model. The returned path will
      point to the same row in the sorted model. If [child_path] isn’t a valid
      path on the child model, then [None] is returned. *)

  method convert_path_to_child_path : Raw.Tree_path.t -> Raw.Tree_path.t option
  (** Converts [sorted_path] to a path on the child model of [tree_model_sort].
      That is, [sorted_path] points to a location in [tree_model_sort]. The
      returned path will point to the same location in the model not being
      sorted. If [sorted_path] does not point to a location in the child model,
      [None] is returned. *)

  method get_model : unit -> Tree_model.tree_model_t
  (** Returns the model the [GtkTreeModelSort] is sorting. *)

  method iter_is_valid : Raw.Tree_iter.t -> bool
  (** This function is slow. Only use it for debugging and/or testing purposes.

      Checks if the given iter is a valid iter for this [GtkTreeModelSort]. *)

  method reset_default_sort_func : unit -> unit
  (** This resets the default sort function to be in the “unsorted” state. That
      is, it is in the same order as the child model. It will re-sort the model
      to be in the same order as the child model only if the [GtkTreeModelSort]
      is in “unsorted” state. *)

  (** {2:conversions Conversions} *)

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
