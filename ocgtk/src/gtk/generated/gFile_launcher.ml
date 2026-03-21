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

(* High-level class for FileLauncher *)
class file_launcher (obj : File_launcher.t) : file_launcher_t = object (self)

  method get_always_ask : unit -> bool =
    fun () ->
      (File_launcher.get_always_ask obj)

  method get_file : unit -> Ocgtk_gio.Gio.file_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.file ret) (File_launcher.get_file obj)

  method get_writable : unit -> bool =
    fun () ->
      (File_launcher.get_writable obj)

  method launch_finish : Ocgtk_gio.Gio.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_launcher.launch_finish obj result)

  method open_containing_folder_finish : Ocgtk_gio.Gio.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_launcher.open_containing_folder_finish obj result)

  method set_always_ask : bool -> unit =
    fun always_ask ->
      (File_launcher.set_always_ask obj always_ask)

  method set_file : Ocgtk_gio.Gio.file_t option -> unit =
    fun file ->
      let file = Option.map (fun (c) -> c#as_file) file in
      (File_launcher.set_file obj file)

  method set_writable : bool -> unit =
    fun writable ->
      (File_launcher.set_writable obj writable)

    method as_file_launcher = obj
end

