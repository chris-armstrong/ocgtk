(* Signal handlers for CellRendererAccel *)
class cell_renderer_accel_signals (obj : Cell_renderer_accel.t) = object
  method accel_cleared ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"accel-cleared" ~callback ~after:false

  method accel_edited ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"accel-edited" ~callback ~after:false

end
