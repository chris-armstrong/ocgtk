class file_launcher : File_launcher.t ->
  object
    method get_always_ask : unit -> bool
    method get_writable : unit -> bool
    method set_always_ask : bool -> unit
    method set_writable : bool -> unit
    method as_file_launcher : File_launcher.t
  end

