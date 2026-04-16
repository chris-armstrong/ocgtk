class type tree_drag_dest_t = object
  method as_tree_drag_dest : Tree_drag_dest.t
end

(* High-level class for TreeDragDest *)
class tree_drag_dest (obj : Tree_drag_dest.t) : tree_drag_dest_t =
  object (self)
    method as_tree_drag_dest = obj
  end
