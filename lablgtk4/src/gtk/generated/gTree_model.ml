(* Signal class defined in gtree_model_signals.ml *)

(* High-level class for TreeModel *)
class tree_model (obj : Tree_model.t) = object (self)
  inherit Gtree_model_signals.tree_model_signals obj

  method get_n_columns : unit -> int =
    fun () ->
      (Tree_model.get_n_columns obj)

  method get_path : Tree_iter.t -> Tree_path.t =
    fun iter ->
      (Tree_model.get_path obj iter)

  method get_string_from_iter : Tree_iter.t -> string option =
    fun iter ->
      (Tree_model.get_string_from_iter obj iter)

  method iter_has_child : Tree_iter.t -> bool =
    fun iter ->
      (Tree_model.iter_has_child obj iter)

  method iter_n_children : Tree_iter.t option -> int =
    fun iter ->
      (Tree_model.iter_n_children obj iter)

  method iter_next : Tree_iter.t -> bool =
    fun iter ->
      (Tree_model.iter_next obj iter)

  method iter_previous : Tree_iter.t -> bool =
    fun iter ->
      (Tree_model.iter_previous obj iter)

  method ref_node : Tree_iter.t -> unit =
    fun iter ->
      (Tree_model.ref_node obj iter)

  method row_changed : Tree_path.t -> Tree_iter.t -> unit =
    fun path iter ->
      (Tree_model.row_changed obj path iter)

  method row_deleted : Tree_path.t -> unit =
    fun path ->
      (Tree_model.row_deleted obj path)

  method row_has_child_toggled : Tree_path.t -> Tree_iter.t -> unit =
    fun path iter ->
      (Tree_model.row_has_child_toggled obj path iter)

  method row_inserted : Tree_path.t -> Tree_iter.t -> unit =
    fun path iter ->
      (Tree_model.row_inserted obj path iter)

  method rows_reordered : Tree_path.t -> Tree_iter.t -> int -> unit =
    fun path iter new_order ->
      (Tree_model.rows_reordered obj path iter new_order)

  method unref_node : Tree_iter.t -> unit =
    fun iter ->
      (Tree_model.unref_node obj iter)

    method as_tree_model = obj
end

