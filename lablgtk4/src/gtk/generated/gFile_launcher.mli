class file_launcher : File_launcher.t ->
  object
    method always_ask : bool
    method set_always_ask : bool -> unit
    method writable : bool
    method set_writable : bool -> unit
    method as_file_launcher : File_launcher.t
  end

