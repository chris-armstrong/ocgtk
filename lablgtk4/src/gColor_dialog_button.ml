(* High-level class for ColorDialogButton *)
class color_dialog_button_skel (obj : Color_dialog_button.t) = object (self)
  inherit GObj.widget_impl (Color_dialog_button.as_widget obj)

end

class color_dialog_button obj = object
  inherit color_dialog_button_skel obj
end
