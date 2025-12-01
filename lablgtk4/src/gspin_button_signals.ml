(* Signal handlers for SpinButton *)
class spin_button_signals (obj : Spin_button.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Spin_button.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  method change_value ~callback =
    Gobject.Signal.connect_simple (Spin_button.as_widget obj :> [`widget] Gobject.obj) ~name:"change-value" ~callback ~after:false

  method input ~callback =
    Gobject.Signal.connect_simple (Spin_button.as_widget obj :> [`widget] Gobject.obj) ~name:"input" ~callback ~after:false

  method output ~callback =
    Gobject.Signal.connect_simple (Spin_button.as_widget obj :> [`widget] Gobject.obj) ~name:"output" ~callback ~after:false

  method value_changed ~callback =
    Gobject.Signal.connect_simple (Spin_button.as_widget obj :> [`widget] Gobject.obj) ~name:"value-changed" ~callback ~after:false

  method wrapped ~callback =
    Gobject.Signal.connect_simple (Spin_button.as_widget obj :> [`widget] Gobject.obj) ~name:"wrapped" ~callback ~after:false

end
