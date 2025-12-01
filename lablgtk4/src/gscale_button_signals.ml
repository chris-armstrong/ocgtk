(* Signal handlers for ScaleButton *)
class scale_button_signals (obj : Scale_button.t) = object
  method popdown ~callback =
    Gobject.Signal.connect_simple (Scale_button.as_widget obj :> [`widget] Gobject.obj) ~name:"popdown" ~callback ~after:false

  method popup ~callback =
    Gobject.Signal.connect_simple (Scale_button.as_widget obj :> [`widget] Gobject.obj) ~name:"popup" ~callback ~after:false

  method value_changed ~callback =
    Gobject.Signal.connect_simple (Scale_button.as_widget obj :> [`widget] Gobject.obj) ~name:"value-changed" ~callback ~after:false

end
