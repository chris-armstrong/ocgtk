(* Signal handlers for FontButton *)
class font_button_signals (obj : Font_button.t) = object
  (** Emitted to when the font button is activated.

The `::activate` signal on `GtkFontButton` is an action signal and
emitting it causes the button to present its dialog. *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  (** Emitted when the user selects a font.

When handling this signal, use [method@Gtk.FontChooser.get_font]
to find out which font was just selected.

Note that this signal is only emitted when the user changes the font.
If you need to react to programmatic font changes as well, use
the notify::font signal. *)
  method on_font_set ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"font-set" ~callback ~after:false

end
