(* High-level class for FontChooserWidget *)
class font_chooser_widget (obj : Font_chooser_widget.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Font_chooser_widget.as_widget obj)

  method as_widget = (Font_chooser_widget.as_widget obj)
    method as_font_chooser_widget = obj
end

