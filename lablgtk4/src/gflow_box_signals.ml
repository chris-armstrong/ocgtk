(* Signal handlers for FlowBox *)
class flow_box_signals (obj : Flow_box.t) = object
  method on_activate_cursor_child ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate-cursor-child" ~callback ~after:false

  method on_child_activated ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"child-activated" ~callback ~after:false

  method on_move_cursor ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"move-cursor" ~callback ~after:false

  method on_select_all ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"select-all" ~callback ~after:false

  method on_selected_children_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"selected-children-changed" ~callback ~after:false

  method on_toggle_cursor_child ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"toggle-cursor-child" ~callback ~after:false

  method on_unselect_all ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"unselect-all" ~callback ~after:false

end
