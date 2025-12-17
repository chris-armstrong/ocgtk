(* Signal handlers for ColorDialogButton *)
class color_dialog_button_signals (obj : Color_dialog_button.t) = object
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
