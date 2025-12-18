(* High-level class for ColorChooserWidget *)
class color_chooser_widget (obj : Color_chooser_widget.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Color_chooser_widget.as_widget obj)

  method as_widget = (Color_chooser_widget.as_widget obj)
    method as_color_chooser_widget = obj
end

