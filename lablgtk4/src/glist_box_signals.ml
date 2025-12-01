(* Signal handlers for ListBox *)
class list_box_signals (obj : List_box.t) = object
  method activate_cursor_row ~callback =
    Gobject.Signal.connect_simple (List_box.as_widget obj :> [`widget] Gobject.obj) ~name:"activate-cursor-row" ~callback ~after:false

  method move_cursor ~callback =
    Gobject.Signal.connect_simple (List_box.as_widget obj :> [`widget] Gobject.obj) ~name:"move-cursor" ~callback ~after:false

  method row_activated ~callback =
    Gobject.Signal.connect_simple (List_box.as_widget obj :> [`widget] Gobject.obj) ~name:"row-activated" ~callback ~after:false

  method row_selected ~callback =
    Gobject.Signal.connect_simple (List_box.as_widget obj :> [`widget] Gobject.obj) ~name:"row-selected" ~callback ~after:false

  method select_all ~callback =
    Gobject.Signal.connect_simple (List_box.as_widget obj :> [`widget] Gobject.obj) ~name:"select-all" ~callback ~after:false

  method selected_rows_changed ~callback =
    Gobject.Signal.connect_simple (List_box.as_widget obj :> [`widget] Gobject.obj) ~name:"selected-rows-changed" ~callback ~after:false

  method toggle_cursor_row ~callback =
    Gobject.Signal.connect_simple (List_box.as_widget obj :> [`widget] Gobject.obj) ~name:"toggle-cursor-row" ~callback ~after:false

  method unselect_all ~callback =
    Gobject.Signal.connect_simple (List_box.as_widget obj :> [`widget] Gobject.obj) ~name:"unselect-all" ~callback ~after:false

end
