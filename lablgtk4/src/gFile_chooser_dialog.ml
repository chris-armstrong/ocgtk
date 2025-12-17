(* High-level class for FileChooserDialog *)
class file_chooser_dialog (obj : File_chooser_dialog.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (File_chooser_dialog.as_widget obj)

  method as_widget = (File_chooser_dialog.as_widget obj)
    method as_file_chooser_dialog = obj
end

