(** Interface for Drag-and-Drop destinations in [GtkTreeView].

    Its methods, signals and properties are on {!class-type-tree_drag_source_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Tree_drag_source}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TreeDragSource].}

    Interface for Drag-and-Drop destinations in [GtkTreeView]. *)
class type tree_drag_source_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_tree_drag_source : Raw.Tree_drag_source.t
end

class tree_drag_source : Raw.Tree_drag_source.t -> tree_drag_source_t
(** Wraps a raw handle of {!Ocgtk.Raw.Tree_drag_source.t}. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
