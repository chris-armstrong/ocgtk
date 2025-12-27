class tree_model : Tree_model.t ->
  object
    inherit Gtree_model_signals.tree_model_signals
    method filter_new : Tree_path.t option -> tree_model
    method get_flags : unit -> Gtk_enums.treemodelflags
    method get_n_columns : unit -> int
    method get_path : Tree_iter.t -> Tree_path.t
    method get_string_from_iter : Tree_iter.t -> string option
    method iter_has_child : Tree_iter.t -> bool
    method iter_n_children : Tree_iter.t option -> int
    method iter_next : Tree_iter.t -> bool
    method iter_previous : Tree_iter.t -> bool
    method ref_node : Tree_iter.t -> unit
    method row_changed : Tree_path.t -> Tree_iter.t -> unit
    method row_deleted : Tree_path.t -> unit
    method row_has_child_toggled : Tree_path.t -> Tree_iter.t -> unit
    method row_inserted : Tree_path.t -> Tree_iter.t -> unit
    method rows_reordered : Tree_path.t -> Tree_iter.t -> int -> unit
    method unref_node : Tree_iter.t -> unit
    method as_tree_model : Tree_model.t
  end

