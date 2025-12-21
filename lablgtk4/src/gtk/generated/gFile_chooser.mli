class file_chooser : File_chooser.t ->
  object
    method add_filter : #GFile_filter.file_filter -> unit
    method get_action : unit -> Gtk_enums.filechooseraction
    method get_choice : string -> string option
    method get_create_folders : unit -> bool
    method get_current_name : unit -> string option
    method get_filter : unit -> GFile_filter.file_filter option
    method get_select_multiple : unit -> bool
    method remove_choice : string -> unit
    method remove_filter : #GFile_filter.file_filter -> unit
    method set_action : Gtk_enums.filechooseraction -> unit
    method set_choice : string -> string -> unit
    method set_create_folders : bool -> unit
    method set_current_name : string -> unit
    method set_filter : #GFile_filter.file_filter -> unit
    method set_select_multiple : bool -> unit
    method as_file_chooser : File_chooser.t
  end

