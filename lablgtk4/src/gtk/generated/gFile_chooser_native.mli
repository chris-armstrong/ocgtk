class file_chooser_native : File_chooser_native.t ->
  object
    method accept_label : string
    method set_accept_label : string -> unit
    method cancel_label : string
    method set_cancel_label : string -> unit
    method as_file_chooser_native : File_chooser_native.t
  end

