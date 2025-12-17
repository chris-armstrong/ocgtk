(* Signal handlers for Window *)
class window_signals (obj : Application_and__window_and__window_group.Window.t) = object
  method on_activate_default ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate-default" ~callback ~after:false

  method on_activate_focus ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate-focus" ~callback ~after:false

  method on_close_request ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"close-request" ~callback ~after:false

  method on_enable_debugging ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"enable-debugging" ~callback ~after:false

  method on_keys_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"keys-changed" ~callback ~after:false

end
