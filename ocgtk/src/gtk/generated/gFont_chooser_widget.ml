(* High-level class for FontChooserWidget *)
class font_chooser_widget (obj : Font_chooser_widget.t) = object (self)

  method tweak_action = new Ocgtk_gio.Gio.action (Font_chooser_widget.get_tweak_action obj)

    method as_font_chooser_widget = obj
end

