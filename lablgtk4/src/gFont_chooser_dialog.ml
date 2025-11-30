(* High-level class for FontChooserDialog *)
class font_chooser_dialog_skel (obj : Font_chooser_dialog.t) = object (self)
  inherit GObj.widget_impl (Font_chooser_dialog.as_widget obj)

end

class font_chooser_dialog obj = object
  inherit font_chooser_dialog_skel obj
end
