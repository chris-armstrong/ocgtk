(* Signal handlers for ScrolledWindow *)
class scrolled_window_signals (obj : Scrolled_window.t) = object
  method edge_overshot ~callback =
    Gobject.Signal.connect_simple (Scrolled_window.as_widget obj :> [`widget] Gobject.obj) ~name:"edge-overshot" ~callback ~after:false

  method edge_reached ~callback =
    Gobject.Signal.connect_simple (Scrolled_window.as_widget obj :> [`widget] Gobject.obj) ~name:"edge-reached" ~callback ~after:false

  method move_focus_out ~callback =
    Gobject.Signal.connect_simple (Scrolled_window.as_widget obj :> [`widget] Gobject.obj) ~name:"move-focus-out" ~callback ~after:false

  method scroll_child ~callback =
    Gobject.Signal.connect_simple (Scrolled_window.as_widget obj :> [`widget] Gobject.obj) ~name:"scroll-child" ~callback ~after:false

end
