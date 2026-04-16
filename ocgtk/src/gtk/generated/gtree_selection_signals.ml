(* Signal handlers for TreeSelection *)
class tree_selection_signals
  (obj : Tree_selection_and__tree_view.Tree_selection.t) =
  object
    method on_changed ~callback =
      Gobject.Signal.connect_simple obj ~name:"changed" ~callback ~after:false
    (** Emitted whenever the selection has (possibly) changed. Please note that
        this signal is mostly a hint. It may only be emitted once when a range
        of rows are selected, and it may occasionally be emitted when nothing
        has happened. *)
  end
