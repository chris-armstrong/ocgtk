(* Signal handlers for FontDialogButton *)
class font_dialog_button_signals (obj : Font_dialog_button.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Font_dialog_button.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
