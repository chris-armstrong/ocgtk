(* Signal handlers for CellRendererCombo *)
class cell_renderer_combo_signals (obj : Cell_renderer_combo.t) = object
  method on_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"changed" ~callback ~after:false

end
