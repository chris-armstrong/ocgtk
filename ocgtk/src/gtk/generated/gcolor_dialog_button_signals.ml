(* Signal handlers for ColorDialogButton *)
class color_dialog_button_signals (obj : Color_dialog_button.t) = object
  (** Emitted when the color dialog button is activated.

The `::activate` signal on `GtkColorDialogButton` is an action signal
and emitting it causes the button to pop up its dialog. *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
