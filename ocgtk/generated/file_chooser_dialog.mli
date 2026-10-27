class type file_chooser_dialog_t = object
  inherit Dialog.dialog_t
  inherit File_chooser.file_chooser_t
  method as_file_chooser_dialog : Raw.File_chooser_dialog.t
end

class file_chooser_dialog : Raw.File_chooser_dialog.t -> file_chooser_dialog_t
