(* High-level class for ColorChooserDialog *)
class color_chooser_dialog_skel (obj : Color_chooser_dialog.t) = object (self)
  inherit GObj.widget_impl (Color_chooser_dialog.as_widget obj)

end

class color_chooser_dialog obj = object
  inherit color_chooser_dialog_skel obj
end
