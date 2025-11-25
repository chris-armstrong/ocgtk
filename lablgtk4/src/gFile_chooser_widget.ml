(* High-level class for FileChooserWidget *)
class file_chooser_widget_skel (obj : File_chooser_widget.t) = object (self)
  inherit GObj.widget_impl (File_chooser_widget.as_widget obj)

end

class file_chooser_widget obj = object
  inherit file_chooser_widget_skel obj
end
