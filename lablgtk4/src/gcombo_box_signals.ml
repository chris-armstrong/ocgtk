(* Signal handlers for ComboBox *)
class combo_box_signals (obj : Combo_box.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Combo_box.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  method changed ~callback =
    Gobject.Signal.connect_simple (Combo_box.as_widget obj :> [`widget] Gobject.obj) ~name:"changed" ~callback ~after:false

  method format_entry_text ~callback =
    Gobject.Signal.connect_simple (Combo_box.as_widget obj :> [`widget] Gobject.obj) ~name:"format-entry-text" ~callback ~after:false

  method move_active ~callback =
    Gobject.Signal.connect_simple (Combo_box.as_widget obj :> [`widget] Gobject.obj) ~name:"move-active" ~callback ~after:false

  method popdown ~callback =
    Gobject.Signal.connect_simple (Combo_box.as_widget obj :> [`widget] Gobject.obj) ~name:"popdown" ~callback ~after:false

  method popup ~callback =
    Gobject.Signal.connect_simple (Combo_box.as_widget obj :> [`widget] Gobject.obj) ~name:"popup" ~callback ~after:false

end
