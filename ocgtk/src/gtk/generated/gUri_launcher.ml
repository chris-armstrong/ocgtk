class type uri_launcher_t = object
    method get_uri : unit -> string option
    method launch_finish : Ocgtk_gio.Gio.async_result_t -> (bool, GError.t) result
    method set_uri : string option -> unit
    method as_uri_launcher : Uri_launcher.t
end

(* High-level class for UriLauncher *)
class uri_launcher (obj : Uri_launcher.t) : uri_launcher_t = object (self)

  method get_uri : unit -> string option =
    fun () ->
      (Uri_launcher.get_uri obj)

  method launch_finish : Ocgtk_gio.Gio.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (Uri_launcher.launch_finish obj result)

  method set_uri : string option -> unit =
    fun uri ->
      (Uri_launcher.set_uri obj uri)

    method as_uri_launcher = obj
end

