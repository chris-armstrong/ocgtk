class file_dialog : File_dialog.t ->
  object
    method get_accept_label : unit -> string option
    method get_default_filter : unit -> GFile_filter.file_filter option
    method get_initial_name : unit -> string option
    method get_modal : unit -> bool
    method get_title : unit -> string
    method set_accept_label : string option -> unit
    method set_default_filter : #GFile_filter.file_filter option -> unit
    method set_initial_name : string option -> unit
    method set_modal : bool -> unit
    method set_title : string -> unit
    method as_file_dialog : File_dialog.t
  end

