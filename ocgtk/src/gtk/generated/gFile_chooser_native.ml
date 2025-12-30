(* High-level class for FileChooserNative *)
class file_chooser_native (obj : File_chooser_native.t) = object (self)

  method get_accept_label : unit -> string option =
    fun () ->
      (File_chooser_native.get_accept_label obj)

  method get_cancel_label : unit -> string option =
    fun () ->
      (File_chooser_native.get_cancel_label obj)

  method set_accept_label : string option -> unit =
    fun accept_label ->
      (File_chooser_native.set_accept_label obj accept_label)

  method set_cancel_label : string option -> unit =
    fun cancel_label ->
      (File_chooser_native.set_cancel_label obj cancel_label)

    method as_file_chooser_native = obj
end

