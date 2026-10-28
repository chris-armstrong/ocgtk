class type tree_drag_dest_t = object
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
