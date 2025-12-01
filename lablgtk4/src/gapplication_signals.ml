(* Signal handlers for Application *)
class application_signals (obj : Application.t) = object
  method query_end ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"query-end" ~callback ~after:false

  method window_added ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"window-added" ~callback ~after:false

  method window_removed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"window-removed" ~callback ~after:false

end
