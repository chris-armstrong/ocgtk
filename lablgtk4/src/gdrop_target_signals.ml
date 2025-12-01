(* Signal handlers for DropTarget *)
class drop_target_signals (obj : Drop_target.t) = object
  method accept ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"accept" ~callback ~after:false

  method drop ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"drop" ~callback ~after:false

  method enter ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"enter" ~callback ~after:false

  method leave ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"leave" ~callback ~after:false

  method motion ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"motion" ~callback ~after:false

end
