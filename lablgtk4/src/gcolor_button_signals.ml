(* Signal handlers for ColorButton *)
class color_button_signals (obj : Color_button.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Color_button.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  method color_set ~callback =
    Gobject.Signal.connect_simple (Color_button.as_widget obj :> [`widget] Gobject.obj) ~name:"color-set" ~callback ~after:false

end
