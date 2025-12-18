(* High-level class for FileChooserNative *)
class file_chooser_native (obj : File_chooser_native.t) = object (self)

  method accept_label = File_chooser_native.get_accept_label obj
  method set_accept_label v = File_chooser_native.set_accept_label obj v

  method cancel_label = File_chooser_native.get_cancel_label obj
  method set_cancel_label v = File_chooser_native.set_cancel_label obj v

    method as_file_chooser_native = obj
end

