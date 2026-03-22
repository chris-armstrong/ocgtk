class type font_chooser_dialog_t = object
    inherit GDialog.dialog_t
    method as_font_chooser_dialog : Font_chooser_dialog.t
end

class font_chooser_dialog : Font_chooser_dialog.t -> font_chooser_dialog_t

