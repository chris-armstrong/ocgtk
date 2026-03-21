class type font_chooser_widget_t = object
    method tweak_action : Ocgtk_gio.Gio.action_t
    method as_font_chooser_widget : Font_chooser_widget.t
end

class font_chooser_widget : Font_chooser_widget.t -> font_chooser_widget_t

