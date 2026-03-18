class print_dialog : Print_dialog.t ->
  object
    method get_accept_label : unit -> string
    method get_modal : unit -> bool
    method get_title : unit -> string
    method print_file_finish : #Ocgtk_gio.Gio.async_result -> (bool, GError.t) result
    method print_finish : #Ocgtk_gio.Gio.async_result -> (Ocgtk_gio.Gio.output_stream option, GError.t) result
    method set_accept_label : string -> unit
    method set_modal : bool -> unit
    method set_title : string -> unit
    method setup_finish : #Ocgtk_gio.Gio.async_result -> (Print_setup.t option, GError.t) result
    method as_print_dialog : Print_dialog.t
  end

