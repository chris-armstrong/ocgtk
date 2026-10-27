class type tree_model_filter_t = object
  inherit Tree_drag_source.tree_drag_source_t
  inherit Tree_model.tree_model_t

  method clear_cache : unit -> unit
  (** This function should almost never be called. It clears the [filter] of any
      cached iterators that haven’t been reffed with gtk_tree_model_ref_node().
      This might be useful if the child model being filtered is static (and
      doesn’t change often) and there has been a lot of unreffed access to
      nodes. As a side effect of this function, all unreffed iters will be
      invalid. *)

  method convert_child_path_to_path : Raw.Tree_path.t -> Raw.Tree_path.t option
  (** Converts [child_path] to a path relative to [filter]. That is,
      [child_path] points to a path in the child model. The rerturned path will
      point to the same row in the filtered model. If [child_path] isn’t a valid
      path on the child model or points to a row which is not visible in
      [filter], then [NULL] is returned. *)

  method convert_path_to_child_path : Raw.Tree_path.t -> Raw.Tree_path.t option
  (** Converts [filter_path] to a path on the child model of [filter]. That is,
      [filter_path] points to a location in [filter]. The returned path will
      point to the same location in the model not being filtered. If
      [filter_path] does not point to a location in the child model, [NULL] is
      returned. *)

  method get_model : unit -> Tree_model.tree_model_t
  (** Returns a pointer to the child model of [filter]. *)

  method refilter : unit -> unit
  (** Emits ::row_changed for each row in the child model, which causes the
      filter to re-evaluate whether a row is visible or not. *)

  method set_visible_column : int -> unit
  (** Sets [column] of the child_model to be the column where [filter] should
      look for visibility information. [columns] should be a column of type
      [G_TYPE_BOOLEAN], where [TRUE] means that a row is visible, and [FALSE] if
      not.

      Note that gtk_tree_model_filter_set_visible_func() or
      gtk_tree_model_filter_set_visible_column() can only be called once for a
      given filter model. *)

  method child_model : Tree_model.tree_model_t
  method virtual_root : Raw.Tree_path.t
  method as_tree_model_filter : Raw.Tree_model_filter.t
end

(* High-level class for TreeModelFilter *)
class tree_model_filter (obj : Raw.Tree_model_filter.t) : tree_model_filter_t =
  object (self)
    inherit
      Tree_drag_source.tree_drag_source (Raw.Tree_drag_source.from_gobject obj)

    inherit Tree_model.tree_model (Raw.Tree_model.from_gobject obj)

    method clear_cache : unit -> unit =
      fun () -> Raw.Tree_model_filter.clear_cache obj

    method convert_child_path_to_path :
        Raw.Tree_path.t -> Raw.Tree_path.t option =
      fun child_path ->
        Raw.Tree_model_filter.convert_child_path_to_path obj child_path

    method convert_path_to_child_path :
        Raw.Tree_path.t -> Raw.Tree_path.t option =
      fun filter_path ->
        Raw.Tree_model_filter.convert_path_to_child_path obj filter_path

    method get_model : unit -> Tree_model.tree_model_t =
      fun () -> new Tree_model.tree_model (Raw.Tree_model_filter.get_model obj)

    method refilter : unit -> unit =
      fun () -> Raw.Tree_model_filter.refilter obj

    method set_visible_column : int -> unit =
      fun column -> Raw.Tree_model_filter.set_visible_column obj column

    method child_model =
      new Tree_model.tree_model (Raw.Tree_model_filter.get_child_model obj)

    method virtual_root = Raw.Tree_model_filter.get_virtual_root obj
    method as_tree_model_filter = obj
  end
