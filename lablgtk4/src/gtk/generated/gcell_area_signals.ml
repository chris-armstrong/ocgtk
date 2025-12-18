(* Signal handlers for CellArea *)
class cell_area_signals (obj : Cell_area_and__cell_area_context.Cell_area.t) = object
  method on_add_editable ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"add-editable" ~callback ~after:false

  method on_apply_attributes ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"apply-attributes" ~callback ~after:false

  method on_focus_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"focus-changed" ~callback ~after:false

  method on_remove_editable ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"remove-editable" ~callback ~after:false

end
