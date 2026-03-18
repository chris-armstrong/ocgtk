class media_file : Media_file.t ->
  object
    method clear : unit -> unit
    method get_file : unit -> Ocgtk_gio.Gio.file option
    method get_input_stream : unit -> Ocgtk_gio.Gio.input_stream option
    method set_file : #Ocgtk_gio.Gio.file option -> unit
    method set_filename : string option -> unit
    method set_input_stream : #Ocgtk_gio.Gio.input_stream option -> unit
    method set_resource : string option -> unit
    method as_media_file : Media_file.t
  end

