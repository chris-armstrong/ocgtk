(* Signal handlers for TreeView *)
class tree_view_signals (obj : Tree_view.t) = object
  method columns_changed ~callback =
    Gobject.Signal.connect_simple (Tree_view.as_widget obj :> [`widget] Gobject.obj) ~name:"columns-changed" ~callback ~after:false

  method cursor_changed ~callback =
    Gobject.Signal.connect_simple (Tree_view.as_widget obj :> [`widget] Gobject.obj) ~name:"cursor-changed" ~callback ~after:false

  method expand_collapse_cursor_row ~callback =
    Gobject.Signal.connect_simple (Tree_view.as_widget obj :> [`widget] Gobject.obj) ~name:"expand-collapse-cursor-row" ~callback ~after:false

  method move_cursor ~callback =
    Gobject.Signal.connect_simple (Tree_view.as_widget obj :> [`widget] Gobject.obj) ~name:"move-cursor" ~callback ~after:false

  method row_activated ~callback =
    Gobject.Signal.connect_simple (Tree_view.as_widget obj :> [`widget] Gobject.obj) ~name:"row-activated" ~callback ~after:false

  method row_collapsed ~callback =
    Gobject.Signal.connect_simple (Tree_view.as_widget obj :> [`widget] Gobject.obj) ~name:"row-collapsed" ~callback ~after:false

  method row_expanded ~callback =
    Gobject.Signal.connect_simple (Tree_view.as_widget obj :> [`widget] Gobject.obj) ~name:"row-expanded" ~callback ~after:false

  method select_all ~callback =
    Gobject.Signal.connect_simple (Tree_view.as_widget obj :> [`widget] Gobject.obj) ~name:"select-all" ~callback ~after:false

  method select_cursor_parent ~callback =
    Gobject.Signal.connect_simple (Tree_view.as_widget obj :> [`widget] Gobject.obj) ~name:"select-cursor-parent" ~callback ~after:false

  method select_cursor_row ~callback =
    Gobject.Signal.connect_simple (Tree_view.as_widget obj :> [`widget] Gobject.obj) ~name:"select-cursor-row" ~callback ~after:false

  method start_interactive_search ~callback =
    Gobject.Signal.connect_simple (Tree_view.as_widget obj :> [`widget] Gobject.obj) ~name:"start-interactive-search" ~callback ~after:false

  method test_collapse_row ~callback =
    Gobject.Signal.connect_simple (Tree_view.as_widget obj :> [`widget] Gobject.obj) ~name:"test-collapse-row" ~callback ~after:false

  method test_expand_row ~callback =
    Gobject.Signal.connect_simple (Tree_view.as_widget obj :> [`widget] Gobject.obj) ~name:"test-expand-row" ~callback ~after:false

  method toggle_cursor_row ~callback =
    Gobject.Signal.connect_simple (Tree_view.as_widget obj :> [`widget] Gobject.obj) ~name:"toggle-cursor-row" ~callback ~after:false

  method unselect_all ~callback =
    Gobject.Signal.connect_simple (Tree_view.as_widget obj :> [`widget] Gobject.obj) ~name:"unselect-all" ~callback ~after:false

end
