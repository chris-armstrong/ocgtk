class type tree_drag_source_t = object
  method drag_data_delete : Raw.Tree_path.t -> bool
  (** Asks the [GtkTreeDragSource] to delete the row at [path], because it was
      moved somewhere else via drag-and-drop. Returns [FALSE] if the deletion
      fails because [path] no longer exists, or for some model-specific reason.
      Should robustly handle a [path] no longer found in the model! *)

  method drag_data_get :
    Raw.Tree_path.t -> Ocgdk.Content_provider.content_provider_t option
  (** Asks the [GtkTreeDragSource] to return a [GdkContentProvider] representing
      the row at [path]. Should robustly handle a [path] no longer found in the
      model! *)

  method row_draggable : Raw.Tree_path.t -> bool
  (** Asks the [GtkTreeDragSource] whether a particular row can be used as the
      source of a DND operation. If the source doesn’t implement this interface,
      the row is assumed draggable. *)

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
