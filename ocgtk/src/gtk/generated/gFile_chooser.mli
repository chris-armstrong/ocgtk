class file_chooser : File_chooser.t ->
  object
    method add_choice : string -> string -> string array option -> string array option -> unit
    method add_filter : #GFile_filter.file_filter -> unit
    method add_shortcut_folder : #Ocgtk_gio.Gio.file -> (bool, GError.t) result
    method get_action : unit -> Gtk_enums.filechooseraction
    method get_choice : string -> string option
    method get_create_folders : unit -> bool
    method get_current_folder : unit -> Ocgtk_gio.Gio.file option
    method get_current_name : unit -> string option
    method get_file : unit -> Ocgtk_gio.Gio.file option
    method get_files : unit -> Ocgtk_gio.Gio.list_model
    method get_filter : unit -> GFile_filter.file_filter option
    method get_filters : unit -> Ocgtk_gio.Gio.list_model
    method get_select_multiple : unit -> bool
    method get_shortcut_folders : unit -> Ocgtk_gio.Gio.list_model
    method remove_choice : string -> unit
    method remove_filter : #GFile_filter.file_filter -> unit
    method remove_shortcut_folder : #Ocgtk_gio.Gio.file -> (bool, GError.t) result
    method set_action : Gtk_enums.filechooseraction -> unit
    method set_choice : string -> string -> unit
    method set_create_folders : bool -> unit
    method set_current_folder : #Ocgtk_gio.Gio.file option -> (bool, GError.t) result
    method set_current_name : string -> unit
    method set_file : #Ocgtk_gio.Gio.file -> (bool, GError.t) result
    method set_filter : #GFile_filter.file_filter -> unit
    method set_select_multiple : bool -> unit
    method as_file_chooser : File_chooser.t
  end

