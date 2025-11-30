(* Signal handlers for ToggleButton *)
class toggle_button_signals (obj : Toggle_button.t) = object
  method toggled ~callback =
    Gobject.Signal.connect_simple (Toggle_button.as_widget obj :> [`widget] Gobject.obj) ~name:"toggled" ~callback ~after:false

end
