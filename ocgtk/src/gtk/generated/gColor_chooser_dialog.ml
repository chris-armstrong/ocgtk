(* High-level class for ColorChooserDialog *)
class color_chooser_dialog (obj : Color_chooser_dialog.t) = object (self)

  method show_editor = Color_chooser_dialog.get_show_editor obj
  method set_show_editor v =  Color_chooser_dialog.set_show_editor obj v

    method as_color_chooser_dialog = obj
end

