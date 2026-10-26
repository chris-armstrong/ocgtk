class type tree_drag_dest_t = object
  method drag_data_received : Raw.Tree_path.t -> Gobject.Value.t -> bool
  method row_drop_possible : Raw.Tree_path.t -> Gobject.Value.t -> bool
  method as_tree_drag_dest : Raw.Tree_drag_dest.t
end

class tree_drag_dest : Raw.Tree_drag_dest.t -> tree_drag_dest_t
