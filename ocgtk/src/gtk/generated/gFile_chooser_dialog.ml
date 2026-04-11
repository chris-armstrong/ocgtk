class type file_chooser_dialog_t = object
    inherit GDialog.dialog_t
    inherit GFile_chooser.file_chooser_t
    method as_file_chooser_dialog : File_chooser_dialog.t
end

(* High-level class for FileChooserDialog *)
class file_chooser_dialog (obj : File_chooser_dialog.t) : file_chooser_dialog_t = object (self)
  inherit GDialog.dialog (obj :> Dialog.t)
  inherit GFile_chooser.file_chooser (File_chooser.from_gobject obj)

    method as_file_chooser_dialog = obj
end

