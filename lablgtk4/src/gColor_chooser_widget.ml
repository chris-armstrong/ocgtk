(* High-level class for ColorChooserWidget *)
class color_chooser_widget_skel (obj : Color_chooser_widget.t) = object (self)
  inherit GObj.widget_impl (Color_chooser_widget.as_widget obj)

end

class color_chooser_widget obj = object
  inherit color_chooser_widget_skel obj
end
