(* Signal handlers for IconView *)
class icon_view_signals (obj : Icon_view.t) = object
  method activate_cursor_item ~callback =
    Gobject.Signal.connect_simple (Icon_view.as_widget obj :> [`widget] Gobject.obj) ~name:"activate-cursor-item" ~callback ~after:false

  method item_activated ~callback =
    Gobject.Signal.connect_simple (Icon_view.as_widget obj :> [`widget] Gobject.obj) ~name:"item-activated" ~callback ~after:false

  method move_cursor ~callback =
    Gobject.Signal.connect_simple (Icon_view.as_widget obj :> [`widget] Gobject.obj) ~name:"move-cursor" ~callback ~after:false

  method select_all ~callback =
    Gobject.Signal.connect_simple (Icon_view.as_widget obj :> [`widget] Gobject.obj) ~name:"select-all" ~callback ~after:false

  method select_cursor_item ~callback =
    Gobject.Signal.connect_simple (Icon_view.as_widget obj :> [`widget] Gobject.obj) ~name:"select-cursor-item" ~callback ~after:false

  method selection_changed ~callback =
    Gobject.Signal.connect_simple (Icon_view.as_widget obj :> [`widget] Gobject.obj) ~name:"selection-changed" ~callback ~after:false

  method toggle_cursor_item ~callback =
    Gobject.Signal.connect_simple (Icon_view.as_widget obj :> [`widget] Gobject.obj) ~name:"toggle-cursor-item" ~callback ~after:false

  method unselect_all ~callback =
    Gobject.Signal.connect_simple (Icon_view.as_widget obj :> [`widget] Gobject.obj) ~name:"unselect-all" ~callback ~after:false

end
