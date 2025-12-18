class file_dialog : File_dialog.t ->
  object
    method accept_label : string
    method set_accept_label : string -> unit
    method initial_name : string
    method set_initial_name : string -> unit
    method modal : bool
    method set_modal : bool -> unit
    method title : string
    method set_title : string -> unit
    method get_default_filter : unit -> GFile_filter.file_filter option
    method set_default_filter : #GFile_filter.file_filter option -> unit
    method as_file_dialog : File_dialog.t
  end

