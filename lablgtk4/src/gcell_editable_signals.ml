(* Signal handlers for CellEditable *)
class cell_editable_signals (obj : Cell_editable.t) = object
  method editing_done ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"editing-done" ~callback ~after:false

  method remove_widget ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"remove-widget" ~callback ~after:false

end
