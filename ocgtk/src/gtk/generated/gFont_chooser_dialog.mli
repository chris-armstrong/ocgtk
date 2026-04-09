class type font_chooser_dialog_t = object
    inherit GDialog.dialog_t
    inherit GFont_chooser.font_chooser_t
    method as_font_chooser_dialog : Font_chooser_dialog.t
end

class font_chooser_dialog : Font_chooser_dialog.t -> font_chooser_dialog_t

val new_ : string option -> GApplication_and__window_and__window_group.window_t option -> font_chooser_dialog_t
