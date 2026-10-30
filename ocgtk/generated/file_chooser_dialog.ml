class type file_chooser_dialog_t = object
  inherit Dialog.dialog_t
  inherit File_chooser.file_chooser_t

  (** {2:conversions Conversions} *)

  method as_file_chooser_dialog : Raw.File_chooser_dialog.t
end

(* High-level class for FileChooserDialog *)
class file_chooser_dialog (obj : Raw.File_chooser_dialog.t) :
  file_chooser_dialog_t =
  object (self)
    inherit Dialog.dialog (obj :> Raw.Dialog.t)
    inherit File_chooser.file_chooser (Raw.File_chooser.from_gobject obj)
    method as_file_chooser_dialog = obj
  end
