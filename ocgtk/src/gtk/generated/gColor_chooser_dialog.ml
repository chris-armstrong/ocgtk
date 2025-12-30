(* High-level class for ColorChooserDialog *)
class color_chooser_dialog (obj : Color_chooser_dialog.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Color_chooser_dialog.as_widget obj)

  method show_editor = Color_chooser_dialog.get_show_editor obj
  method set_show_editor v =  Color_chooser_dialog.set_show_editor obj v

  method as_widget = (Color_chooser_dialog.as_widget obj)
    method as_color_chooser_dialog = obj
end

