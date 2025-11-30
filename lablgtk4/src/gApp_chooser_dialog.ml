(* High-level class for AppChooserDialog *)
class app_chooser_dialog_skel (obj : App_chooser_dialog.t) = object (self)
  inherit GObj.widget_impl (App_chooser_dialog.as_widget obj)

end

class app_chooser_dialog obj = object
  inherit app_chooser_dialog_skel obj
end
