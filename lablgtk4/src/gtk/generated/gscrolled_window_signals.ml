(* Signal handlers for ScrolledWindow *)
class scrolled_window_signals (obj : Scrolled_window.t) = object
  method on_edge_overshot ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"edge-overshot" ~callback ~after:false

  method on_edge_reached ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"edge-reached" ~callback ~after:false

  method on_move_focus_out ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"move-focus-out" ~callback ~after:false

  method on_scroll_child ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"scroll-child" ~callback ~after:false

end
