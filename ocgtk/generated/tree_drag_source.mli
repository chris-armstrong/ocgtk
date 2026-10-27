(** Interface for Drag-and-Drop destinations in [GtkTreeView].

    Its methods, signals and properties are on {!class-type-tree_drag_source_t}.
    The functions it is built on are in {!Ocgtk.Raw.Tree_drag_source}. *)

(** The methods, signals and properties of a [GtkTreeDragSource]. *)
class type tree_drag_source_t = object
  method drag_data_delete : Raw.Tree_path.t -> bool

  method drag_data_get :
    Raw.Tree_path.t -> Ocgdk.Content_provider.content_provider_t option

  method row_draggable : Raw.Tree_path.t -> bool
  method as_tree_drag_source : Raw.Tree_drag_source.t
end

class tree_drag_source : Raw.Tree_drag_source.t -> tree_drag_source_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Tree_drag_source.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkTreeDragSource], give one already wrapped. *)
