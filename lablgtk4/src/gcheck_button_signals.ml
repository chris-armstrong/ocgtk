(* Signal handlers for CheckButton *)
class check_button_signals (obj : Check_button.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Check_button.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  method toggled ~callback =
    Gobject.Signal.connect_simple (Check_button.as_widget obj :> [`widget] Gobject.obj) ~name:"toggled" ~callback ~after:false

end
