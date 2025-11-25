(* High-level class for AboutDialog *)
class about_dialog_skel (obj : About_dialog.t) = object (self)
  inherit GObj.widget_impl (About_dialog.as_widget obj)

end

class about_dialog obj = object
  inherit about_dialog_skel obj
end
