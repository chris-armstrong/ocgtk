class type tree_drag_source_t = object
  method drag_data_delete : Raw.Tree_path.t -> bool

  method drag_data_get :
    Raw.Tree_path.t -> Ocgdk.Content_provider.content_provider_t option

  method row_draggable : Raw.Tree_path.t -> bool
  method as_tree_drag_source : Raw.Tree_drag_source.t
end

class tree_drag_source : Raw.Tree_drag_source.t -> tree_drag_source_t
