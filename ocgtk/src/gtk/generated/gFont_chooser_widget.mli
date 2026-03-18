class font_chooser_widget : Font_chooser_widget.t ->
  object
    method tweak_action : Ocgtk_gio.Gio.action
    method as_font_chooser_widget : Font_chooser_widget.t
  end

