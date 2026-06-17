class type tree_drag_dest_t = object
    method drag_data_received : Tree_path.t -> Gobject.Value.t -> bool
    method row_drop_possible : Tree_path.t -> Gobject.Value.t -> bool
    method as_tree_drag_dest : Tree_drag_dest.t
end

(* High-level class for TreeDragDest *)
class tree_drag_dest (obj : Tree_drag_dest.t) : tree_drag_dest_t = object (self)

  method drag_data_received : Tree_path.t -> Gobject.Value.t -> bool =
    fun dest value ->
      (Tree_drag_dest.drag_data_received obj dest value)

  method row_drop_possible : Tree_path.t -> Gobject.Value.t -> bool =
    fun dest_path value ->
      (Tree_drag_dest.row_drop_possible obj dest_path value)

    method as_tree_drag_dest = obj
end

