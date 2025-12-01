(* Signal handlers for DropTargetAsync *)
class drop_target_async_signals (obj : Drop_target_async.t) = object
  method accept ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"accept" ~callback ~after:false

  method drag_enter ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"drag-enter" ~callback ~after:false

  method drag_leave ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"drag-leave" ~callback ~after:false

  method drag_motion ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"drag-motion" ~callback ~after:false

  method drop ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"drop" ~callback ~after:false

end
