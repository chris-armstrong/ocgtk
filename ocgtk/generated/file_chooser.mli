class type file_chooser_t = object
  method add_choice :
    string -> string -> string array option -> string array option -> unit

  method add_filter : File_filter.file_filter_t -> unit
  method add_shortcut_folder : Ocgio.File.file_t -> (bool, GError.t) result
  method get_action : unit -> Enums.filechooseraction
  method get_choice : string -> string option
  method get_create_folders : unit -> bool
  method get_current_folder : unit -> Ocgio.File.file_t option
  method get_current_name : unit -> string option
  method get_file : unit -> Ocgio.File.file_t option
  method get_files : unit -> Ocgio.List_model.list_model_t
  method get_filter : unit -> File_filter.file_filter_t option
  method get_filters : unit -> Ocgio.List_model.list_model_t
  method get_select_multiple : unit -> bool
  method get_shortcut_folders : unit -> Ocgio.List_model.list_model_t
  method remove_choice : string -> unit
  method remove_filter : File_filter.file_filter_t -> unit
  method remove_shortcut_folder : Ocgio.File.file_t -> (bool, GError.t) result
  method set_action : Enums.filechooseraction -> unit
  method set_choice : string -> string -> unit
  method set_create_folders : bool -> unit

  method set_current_folder :
    Ocgio.File.file_t option -> (bool, GError.t) result

  method set_current_name : string -> unit
  method set_file : Ocgio.File.file_t -> (bool, GError.t) result
  method set_filter : File_filter.file_filter_t -> unit
  method set_select_multiple : bool -> unit
  method as_file_chooser : Raw.File_chooser.t
end

class file_chooser : Raw.File_chooser.t -> file_chooser_t
