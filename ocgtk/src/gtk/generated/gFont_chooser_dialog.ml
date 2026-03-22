class type font_chooser_dialog_t = object
    inherit GDialog.dialog_t
    method as_font_chooser_dialog : Font_chooser_dialog.t
end

(* High-level class for FontChooserDialog *)
class font_chooser_dialog (obj : Font_chooser_dialog.t) : font_chooser_dialog_t = object (self)
  inherit GDialog.dialog (Obj.magic obj : Dialog.t)

    method as_font_chooser_dialog = obj
end

