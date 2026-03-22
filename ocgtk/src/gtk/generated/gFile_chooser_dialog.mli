class type file_chooser_dialog_t = object
    inherit GDialog.dialog_t
    method as_file_chooser_dialog : File_chooser_dialog.t
end

class file_chooser_dialog : File_chooser_dialog.t -> file_chooser_dialog_t

