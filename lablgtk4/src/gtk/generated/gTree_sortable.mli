class tree_sortable : Tree_sortable.t ->
  object
    inherit Gtree_sortable_signals.tree_sortable_signals
    method has_default_sort_func : unit -> bool
    method set_sort_column_id : int -> Gtk_enums.sorttype -> unit
    method sort_column_changed : unit -> unit
    method as_tree_sortable : Tree_sortable.t
  end

