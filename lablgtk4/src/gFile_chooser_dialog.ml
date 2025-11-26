(* High-level class for FileChooserDialog *)
class file_chooser_dialog_skel (obj : File_chooser_dialog.t) = object (self)
  inherit GObj.widget_impl (File_chooser_dialog.as_widget obj)

end

class file_chooser_dialog obj = object
  inherit file_chooser_dialog_skel obj
end
