class type tree_drag_dest_t = object
  method as_tree_drag_dest : Tree_drag_dest.t
end

class tree_drag_dest : Tree_drag_dest.t -> tree_drag_dest_t
