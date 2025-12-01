(* Signal handlers for DragSource *)
class drag_source_signals (obj : Drag_source.t) = object
  method drag_begin ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"drag-begin" ~callback ~after:false

  method drag_cancel ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"drag-cancel" ~callback ~after:false

  method drag_end ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"drag-end" ~callback ~after:false

  method prepare ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"prepare" ~callback ~after:false

end
