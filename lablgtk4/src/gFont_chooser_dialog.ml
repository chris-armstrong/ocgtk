(* High-level class for FontChooserDialog *)
class font_chooser_dialog (obj : Font_chooser_dialog.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Font_chooser_dialog.as_widget obj)

  method as_widget = (Font_chooser_dialog.as_widget obj)
    method as_font_chooser_dialog = obj
end

