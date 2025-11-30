(* High-level class for AppChooserWidget *)
class app_chooser_widget_skel (obj : App_chooser_widget.t) = object (self)
  inherit GObj.widget_impl (App_chooser_widget.as_widget obj)

end

class app_chooser_widget obj = object
  inherit app_chooser_widget_skel obj
end
