(* High-level class for AppChooserButton *)
class app_chooser_button_skel (obj : App_chooser_button.t) = object (self)
  inherit GObj.widget_impl (App_chooser_button.as_widget obj)

end

class app_chooser_button obj = object
  inherit app_chooser_button_skel obj
end
