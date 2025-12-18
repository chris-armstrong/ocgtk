(* Signal handlers for Notebook *)
class notebook_signals (obj : Notebook.t) = object
  method on_change_current_page ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"change-current-page" ~callback ~after:false

  method on_create_window ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"create-window" ~callback ~after:false

  method on_focus_tab ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"focus-tab" ~callback ~after:false

  method on_move_focus_out ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"move-focus-out" ~callback ~after:false

  method on_page_added ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"page-added" ~callback ~after:false

  method on_page_removed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"page-removed" ~callback ~after:false

  method on_page_reordered ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"page-reordered" ~callback ~after:false

  method on_reorder_tab ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"reorder-tab" ~callback ~after:false

  method on_select_page ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"select-page" ~callback ~after:false

  method on_switch_page ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"switch-page" ~callback ~after:false

end
