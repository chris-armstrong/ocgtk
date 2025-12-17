class tree_drag_source : Tree_drag_source.t ->
  object
    method drag_data_delete : Tree_path.t -> bool
    method row_draggable : Tree_path.t -> bool
    method as_tree_drag_source : Tree_drag_source.t
  end

