(* Signal handlers for ColorDialogButton *)
class color_dialog_button_signals (obj : Color_dialog_button.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Color_dialog_button.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
