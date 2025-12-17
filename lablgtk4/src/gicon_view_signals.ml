(* Signal handlers for IconView *)
class icon_view_signals (obj : Icon_view.t) = object
  method on_activate_cursor_item ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate-cursor-item" ~callback ~after:false

  method on_item_activated ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"item-activated" ~callback ~after:false

  method on_move_cursor ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"move-cursor" ~callback ~after:false

  method on_select_all ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"select-all" ~callback ~after:false

  method on_select_cursor_item ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"select-cursor-item" ~callback ~after:false

  method on_selection_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"selection-changed" ~callback ~after:false

  method on_toggle_cursor_item ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"toggle-cursor-item" ~callback ~after:false

  method on_unselect_all ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"unselect-all" ~callback ~after:false

end
