class file_filter : File_filter.t ->
  object
    method add_mime_type : string -> unit
    method add_pattern : string -> unit
    method add_pixbuf_formats : unit -> unit
    method add_suffix : string -> unit
    method get_name : unit -> string option
    method set_name : string option -> unit
    method as_file_filter : File_filter.t
  end

