(* High-level class for TreeDragSource *)
class tree_drag_source (obj : Tree_drag_source.t) = object (self)

  method drag_data_delete : Tree_path.t -> bool =
    fun path ->
      (Tree_drag_source.drag_data_delete obj path)

  method drag_data_get : Tree_path.t -> Ocgtk_gdk.Gdk.content_provider option =
    fun path ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.content_provider ret) (Tree_drag_source.drag_data_get obj path)

  method row_draggable : Tree_path.t -> bool =
    fun path ->
      (Tree_drag_source.row_draggable obj path)

    method as_tree_drag_source = obj
end

