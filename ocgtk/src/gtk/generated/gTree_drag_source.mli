class type tree_drag_source_t = object
  method drag_data_delete : Tree_path.t -> bool

  method drag_data_get :
    Tree_path.t -> Ocgtk_gdk.Gdk.Content_provider.content_provider_t option

  method row_draggable : Tree_path.t -> bool
  method as_tree_drag_source : Tree_drag_source.t
end

class tree_drag_source : Tree_drag_source.t -> tree_drag_source_t
