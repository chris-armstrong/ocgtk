(* Signal handlers for FontButton *)
class font_button_signals (obj : Font_button.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Font_button.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  method font_set ~callback =
    Gobject.Signal.connect_simple (Font_button.as_widget obj :> [`widget] Gobject.obj) ~name:"font-set" ~callback ~after:false

end
