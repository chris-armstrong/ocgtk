(* High-level class for ColorChooserWidget *)
class color_chooser_widget (obj : Color_chooser_widget.t) = object (self)

  method show_editor = Color_chooser_widget.get_show_editor obj
  method set_show_editor v =  Color_chooser_widget.set_show_editor obj v

    method as_color_chooser_widget = obj
end

