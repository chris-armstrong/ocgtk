(* Signal handlers for FontDialogButton *)
class font_dialog_button_signals (obj : Font_dialog_button.t) = object
  (** Emitted when the font dialog button is activated.

The `::activate` signal on `GtkFontDialogButton` is an action signal
and emitting it causes the button to pop up its dialog. *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
