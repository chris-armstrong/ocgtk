class type file_chooser_dialog_t = object
    method as_file_chooser_dialog : File_chooser_dialog.t
end

(* High-level class for FileChooserDialog *)
class file_chooser_dialog (obj : File_chooser_dialog.t) : file_chooser_dialog_t = object (self)

    method as_file_chooser_dialog = obj
end

