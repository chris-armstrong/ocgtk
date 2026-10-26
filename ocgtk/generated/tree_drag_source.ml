class type tree_drag_source_t = object
  method drag_data_delete : Raw.Tree_path.t -> bool

  method drag_data_get :
    Raw.Tree_path.t -> Ocgdk.Content_provider.content_provider_t option

  method row_draggable : Raw.Tree_path.t -> bool
  method as_tree_drag_source : Raw.Tree_drag_source.t
end

(* High-level class for TreeDragSource *)
class tree_drag_source (obj : Raw.Tree_drag_source.t) : tree_drag_source_t =
  object (self)
    method drag_data_delete : Raw.Tree_path.t -> bool =
      fun path -> Raw.Tree_drag_source.drag_data_delete obj path

    method drag_data_get :
        Raw.Tree_path.t -> Ocgdk.Content_provider.content_provider_t option =
      fun path ->
        Option.map
          (fun ret -> new Ocgdk.Content_provider.content_provider ret)
          (Raw.Tree_drag_source.drag_data_get obj path)

    method row_draggable : Raw.Tree_path.t -> bool =
      fun path -> Raw.Tree_drag_source.row_draggable obj path

    method as_tree_drag_source = obj
  end
