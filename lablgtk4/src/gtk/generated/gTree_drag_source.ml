(* High-level class for TreeDragSource *)
class tree_drag_source (obj : Tree_drag_source.t) = object (self)

  method drag_data_delete : Tree_path.t -> bool = fun path -> (Tree_drag_source.drag_data_delete obj path)

  method row_draggable : Tree_path.t -> bool = fun path -> (Tree_drag_source.row_draggable obj path)

    method as_tree_drag_source = obj
end

