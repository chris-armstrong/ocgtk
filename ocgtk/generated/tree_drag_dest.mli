(** Interface for Drag-and-Drop destinations in [GtkTreeView].

    Its methods, signals and properties are on {!class-type-tree_drag_dest_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Tree_drag_dest}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TreeDragDest].}

    Interface for Drag-and-Drop destinations in [GtkTreeView]. *)
class type tree_drag_dest_t = object
  (** {2:methods Methods} *)

  method drag_data_received : Raw.Tree_path.t -> Gobject.Value.t -> bool
  (** Asks the [GtkTreeDragDest] to insert a row before the path [dest],
      deriving the contents of the row from [value]. If [dest] is outside the
      tree so that inserting before it is impossible, [FALSE] will be returned.
      Also, [FALSE] may be returned if the new row is not created for some
      model-specific reason. Should robustly handle a [dest] no longer found in
      the model! *)

  method row_drop_possible : Raw.Tree_path.t -> Gobject.Value.t -> bool
  (** Determines whether a drop is possible before the given [dest_path], at the
      same depth as [dest_path]. i.e., can we drop the data in [value] at that
      location. [dest_path] does not have to exist; the return value will almost
      certainly be [FALSE] if the parent of [dest_path] doesn’t exist, though.
  *)

  (** {2:conversions Conversions} *)

  method as_tree_drag_dest : Raw.Tree_drag_dest.t
end

class tree_drag_dest : Raw.Tree_drag_dest.t -> tree_drag_dest_t
(** Wraps a raw handle of {!Ocgtk.Raw.Tree_drag_dest.t}. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
