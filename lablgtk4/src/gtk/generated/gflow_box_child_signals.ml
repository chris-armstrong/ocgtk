(* Signal handlers for FlowBoxChild *)
class flow_box_child_signals (obj : Flow_box_child.t) = object
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
