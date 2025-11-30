(* Signal handlers for CellArea *)
class cell_area_signals (obj : Cell_area.t) = object
  method add_editable ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"add-editable" ~callback ~after:false

  method apply_attributes ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"apply-attributes" ~callback ~after:false

  method focus_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"focus-changed" ~callback ~after:false

  method remove_editable ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"remove-editable" ~callback ~after:false

end
