class type file_launcher_t = object
    method get_always_ask : unit -> bool
    method get_file : unit -> Ocgtk_gio.Gio.file_t option
    method get_writable : unit -> bool
    method launch_finish : Ocgtk_gio.Gio.async_result_t -> (bool, GError.t) result
    method open_containing_folder_finish : Ocgtk_gio.Gio.async_result_t -> (bool, GError.t) result
    method set_always_ask : bool -> unit
    method set_file : Ocgtk_gio.Gio.file_t option -> unit
    method set_writable : bool -> unit
    method as_file_launcher : File_launcher.t
end

class file_launcher : File_launcher.t -> file_launcher_t

