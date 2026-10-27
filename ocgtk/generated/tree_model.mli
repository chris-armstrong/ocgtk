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

class tree_model : Raw.Tree_model.t -> tree_model_t
