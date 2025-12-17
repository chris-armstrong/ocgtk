(* Signal handlers for ShortcutsWindow *)
class shortcuts_window_signals (obj : Shortcuts_window.t) = object
  method on_close ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"close" ~callback ~after:false

  method on_search ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"search" ~callback ~after:false

end
