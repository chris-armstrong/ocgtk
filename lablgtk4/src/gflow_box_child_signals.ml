(* Signal handlers for FlowBoxChild *)
class flow_box_child_signals (obj : Flow_box_child.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Flow_box_child.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
