(* Signal handlers for ColorButton *)
class color_button_signals (obj : Color_button.t) = object
  (** Emitted to when the color button is activated.

The `::activate` signal on `GtkMenuButton` is an action signal and
emitting it causes the button to pop up its dialog. *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  (** Emitted when the user selects a color.

When handling this signal, use [method@Gtk.ColorChooser.get_rgba]
to find out which color was just selected.

Note that this signal is only emitted when the user changes the color.
If you need to react to programmatic color changes as well, use
the notify::rgba signal. *)
  method on_color_set ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"color-set" ~callback ~after:false

end
