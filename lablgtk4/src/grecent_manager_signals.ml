(* Signal handlers for RecentManager *)
class recent_manager_signals (obj : Recent_manager.t) = object
  method on_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"changed" ~callback ~after:false

end
