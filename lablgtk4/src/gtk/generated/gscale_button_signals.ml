(* Signal handlers for ScaleButton *)
class scale_button_signals (obj : Scale_button.t) = object
  method on_popdown ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"popdown" ~callback ~after:false

  method on_popup ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"popup" ~callback ~after:false

  method on_value_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"value-changed" ~callback ~after:false

end
