(* Signal handlers for ToggleButton *)
class toggle_button_signals (obj : Toggle_button.t) = object
  method on_toggled ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"toggled" ~callback ~after:false

end
