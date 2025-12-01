(* Signal handlers for CellRenderer *)
class cell_renderer_signals (obj : Cell_renderer.t) = object
  method editing_canceled ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"editing-canceled" ~callback ~after:false

  method editing_started ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"editing-started" ~callback ~after:false

end
