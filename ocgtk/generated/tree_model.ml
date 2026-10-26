class type tree_model_t = object
  method filter_new : Raw.Tree_path.t option -> tree_model_t
  method get_column_type : int -> Gobject.Type.t
  method get_flags : unit -> Enums.treemodelflags
  method get_n_columns : unit -> int
  method get_path : Raw.Tree_iter.t -> Raw.Tree_path.t
  method get_string_from_iter : Raw.Tree_iter.t -> string option
  method iter_has_child : Raw.Tree_iter.t -> bool
  method iter_n_children : Raw.Tree_iter.t option -> int
  method iter_next : Raw.Tree_iter.t -> bool
  method iter_previous : Raw.Tree_iter.t -> bool
  method ref_node : Raw.Tree_iter.t -> unit
  method row_changed : Raw.Tree_path.t -> Raw.Tree_iter.t -> unit
  method row_deleted : Raw.Tree_path.t -> unit
  method row_has_child_toggled : Raw.Tree_path.t -> Raw.Tree_iter.t -> unit
  method row_inserted : Raw.Tree_path.t -> Raw.Tree_iter.t -> unit

  method rows_reordered_with_length :
    Raw.Tree_path.t -> Raw.Tree_iter.t option -> int array -> int -> unit

  method unref_node : Raw.Tree_iter.t -> unit
  method as_tree_model : Raw.Tree_model.t
end

(* High-level class for TreeModel *)
class tree_model (obj : Raw.Tree_model.t) : tree_model_t =
  object (self)
    method filter_new : Raw.Tree_path.t option -> tree_model_t =
      fun root -> new tree_model (Raw.Tree_model.filter_new obj root)

    method get_column_type : int -> Gobject.Type.t =
      fun index_ -> Raw.Tree_model.get_column_type obj index_

    method get_flags : unit -> Enums.treemodelflags =
      fun () -> Raw.Tree_model.get_flags obj

    method get_n_columns : unit -> int =
      fun () -> Raw.Tree_model.get_n_columns obj

    method get_path : Raw.Tree_iter.t -> Raw.Tree_path.t =
      fun iter -> Raw.Tree_model.get_path obj iter

    method get_string_from_iter : Raw.Tree_iter.t -> string option =
      fun iter -> Raw.Tree_model.get_string_from_iter obj iter

    method iter_has_child : Raw.Tree_iter.t -> bool =
      fun iter -> Raw.Tree_model.iter_has_child obj iter

    method iter_n_children : Raw.Tree_iter.t option -> int =
      fun iter -> Raw.Tree_model.iter_n_children obj iter

    method iter_next : Raw.Tree_iter.t -> bool =
      fun iter -> Raw.Tree_model.iter_next obj iter

    method iter_previous : Raw.Tree_iter.t -> bool =
      fun iter -> Raw.Tree_model.iter_previous obj iter

    method ref_node : Raw.Tree_iter.t -> unit =
      fun iter -> Raw.Tree_model.ref_node obj iter

    method row_changed : Raw.Tree_path.t -> Raw.Tree_iter.t -> unit =
      fun path iter -> Raw.Tree_model.row_changed obj path iter

    method row_deleted : Raw.Tree_path.t -> unit =
      fun path -> Raw.Tree_model.row_deleted obj path

    method row_has_child_toggled : Raw.Tree_path.t -> Raw.Tree_iter.t -> unit =
      fun path iter -> Raw.Tree_model.row_has_child_toggled obj path iter

    method row_inserted : Raw.Tree_path.t -> Raw.Tree_iter.t -> unit =
      fun path iter -> Raw.Tree_model.row_inserted obj path iter

    method rows_reordered_with_length :
        Raw.Tree_path.t -> Raw.Tree_iter.t option -> int array -> int -> unit =
      fun path iter new_order length ->
        Raw.Tree_model.rows_reordered_with_length obj path iter new_order length

    method unref_node : Raw.Tree_iter.t -> unit =
      fun iter -> Raw.Tree_model.unref_node obj iter

    method as_tree_model = obj
  end
