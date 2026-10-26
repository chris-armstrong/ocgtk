class type tree_drag_dest_t = object
  method drag_data_received : Raw.Tree_path.t -> Gobject.Value.t -> bool
  method row_drop_possible : Raw.Tree_path.t -> Gobject.Value.t -> bool
  method as_tree_drag_dest : Raw.Tree_drag_dest.t
end

(* High-level class for TreeDragDest *)
class tree_drag_dest (obj : Raw.Tree_drag_dest.t) : tree_drag_dest_t =
  object (self)
    method drag_data_received : Raw.Tree_path.t -> Gobject.Value.t -> bool =
      fun dest value -> Raw.Tree_drag_dest.drag_data_received obj dest value

    method row_drop_possible : Raw.Tree_path.t -> Gobject.Value.t -> bool =
      fun dest_path value ->
        Raw.Tree_drag_dest.row_drop_possible obj dest_path value

    method as_tree_drag_dest = obj
  end
