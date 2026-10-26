class type file_launcher_t = object
  method get_always_ask : unit -> bool
  method get_file : unit -> Ocgio.File.file_t option
  method get_writable : unit -> bool

  method launch_finish :
    Ocgio.Async_result.async_result_t -> (bool, GError.t) result

  method open_containing_folder_finish :
    Ocgio.Async_result.async_result_t -> (bool, GError.t) result

  method set_always_ask : bool -> unit
  method set_file : Ocgio.File.file_t option -> unit
  method set_writable : bool -> unit
  method as_file_launcher : Raw.File_launcher.t
end

class file_launcher : Raw.File_launcher.t -> file_launcher_t

val new_ : Ocgio.File.file_t option -> file_launcher_t
