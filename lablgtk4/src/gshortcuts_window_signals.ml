(* Signal handlers for ShortcutsWindow *)
class shortcuts_window_signals (obj : Shortcuts_window.t) = object
  method close ~callback =
    Gobject.Signal.connect_simple (Shortcuts_window.as_widget obj :> [`widget] Gobject.obj) ~name:"close" ~callback ~after:false

  method search ~callback =
    Gobject.Signal.connect_simple (Shortcuts_window.as_widget obj :> [`widget] Gobject.obj) ~name:"search" ~callback ~after:false

end
