(* Signal handlers for DropTarget *)
class drop_target_signals (obj : Drop_target.t) = object
  method on_accept ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"accept" ~callback ~after:false

  method on_drop ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"drop" ~callback ~after:false

  method on_enter ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"enter" ~callback ~after:false

  method on_leave ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"leave" ~callback ~after:false

  method on_motion ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"motion" ~callback ~after:false

end
