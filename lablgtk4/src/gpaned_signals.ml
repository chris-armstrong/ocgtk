(* Signal handlers for Paned *)
class paned_signals (obj : Paned.t) = object
  method on_accept_position ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"accept-position" ~callback ~after:false

  method on_cancel_position ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"cancel-position" ~callback ~after:false

  method on_cycle_child_focus ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"cycle-child-focus" ~callback ~after:false

  method on_cycle_handle_focus ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"cycle-handle-focus" ~callback ~after:false

  method on_move_handle ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"move-handle" ~callback ~after:false

  method on_toggle_handle_focus ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"toggle-handle-focus" ~callback ~after:false

end
