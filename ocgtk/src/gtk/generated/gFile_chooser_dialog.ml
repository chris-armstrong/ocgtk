class type file_chooser_dialog_t = object
    inherit GDialog.dialog_t
    method as_file_chooser_dialog : File_chooser_dialog.t
end

(* High-level class for FileChooserDialog *)
class file_chooser_dialog (obj : File_chooser_dialog.t) : file_chooser_dialog_t = object (self)
  inherit GDialog.dialog (Obj.magic obj : Dialog.t)

    method as_file_chooser_dialog = obj
end

