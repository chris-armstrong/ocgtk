(* Signal handlers for TreeView *)
class tree_view_signals (obj : Tree_selection_and__tree_view.Tree_view.t) =
  object
    method on_columns_changed ~callback =
      Gobject.Signal.connect_simple obj ~name:"columns-changed" ~callback
        ~after:false
    (** The number of columns of the treeview has changed. *)

    method on_cursor_changed ~callback =
      Gobject.Signal.connect_simple obj ~name:"cursor-changed" ~callback
        ~after:false
    (** The position of the cursor (focused cell) has changed. *)
  end
