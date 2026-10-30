class type file_launcher_t = object
  (** {2:methods Methods} *)

  method get_always_ask : unit -> bool
  (** Returns whether to ask the user which app to use. *)

  method get_file : unit -> Ocgio.File.file_t option
  (** Gets the file that will be opened. *)

  method get_writable : unit -> bool
  (** Returns whether to make the file writable for the handler. *)

  method launch_finish :
    Ocgio.Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes the [Gtk.FileLauncher.launch] call and returns the result. *)

  method open_containing_folder_finish :
    Ocgio.Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes the [Gtk.FileLauncher.open_containing_folder] call and returns
      the result. *)

  method set_always_ask : bool -> unit
  (** Sets whether to always ask the user which app to use.

      If false, the file might be opened with a default app or the previous
      choice. *)

  method set_file : Ocgio.File.file_t option -> unit
  (** Sets the file that will be opened. *)

  method set_writable : bool -> unit
  (** Sets whether to make the file writable for the handler. *)

  (** {2:conversions Conversions} *)

  method as_file_launcher : Raw.File_launcher.t
end

(* High-level class for FileLauncher *)
class file_launcher (obj : Raw.File_launcher.t) : file_launcher_t =
  object (self)
    method get_always_ask : unit -> bool =
      fun () -> Raw.File_launcher.get_always_ask obj

    method get_file : unit -> Ocgio.File.file_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.File.file ret)
          (Raw.File_launcher.get_file obj)

    method get_writable : unit -> bool =
      fun () -> Raw.File_launcher.get_writable obj

    method launch_finish :
        Ocgio.Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.File_launcher.launch_finish obj result

    method open_containing_folder_finish :
        Ocgio.Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.File_launcher.open_containing_folder_finish obj result

    method set_always_ask : bool -> unit =
      fun always_ask -> Raw.File_launcher.set_always_ask obj always_ask

    method set_file : Ocgio.File.file_t option -> unit =
      fun file ->
        let file = Option.map (fun c -> c#as_file) file in
        Raw.File_launcher.set_file obj file

    method set_writable : bool -> unit =
      fun writable -> Raw.File_launcher.set_writable obj writable

    method as_file_launcher = obj
  end

let new_ (file : Ocgio.File.file_t option) : file_launcher_t =
  let file = Option.map (fun c -> c#as_file) file in
  let obj_ = Raw.File_launcher.new_ file in
  new file_launcher obj_
