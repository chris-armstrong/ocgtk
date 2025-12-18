class file_chooser : File_chooser.t ->
  object
    method create_folders : bool
    method set_create_folders : bool -> unit
    method select_multiple : bool
    method set_select_multiple : bool -> unit
    method add_filter : #GFile_filter.file_filter -> unit
    method get_action : unit -> Gtk_enums.filechooseraction
    method get_choice : string -> string option
    method get_filter : unit -> GFile_filter.file_filter option
    method remove_choice : string -> unit
    method remove_filter : #GFile_filter.file_filter -> unit
    method set_action : Gtk_enums.filechooseraction -> unit
    method set_choice : string -> string -> unit
    method set_current_name : string -> unit
    method set_filter : #GFile_filter.file_filter -> unit
    method as_file_chooser : File_chooser.t
  end

