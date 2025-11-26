(* High-level class for FontDialogButton *)
class font_dialog_button_skel (obj : Font_dialog_button.t) = object (self)
  inherit GObj.widget_impl (Font_dialog_button.as_widget obj)

end

class font_dialog_button obj = object
  inherit font_dialog_button_skel obj
end
