(* High-level class for UriLauncher *)
class uri_launcher (obj : Uri_launcher.t) = object (self)

  method get_uri : unit -> string option =
    fun () ->
      (Uri_launcher.get_uri obj)

  method launch_finish : 'p1. (#Ocgtk_gio.Gio.async_result as 'p1) -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (Uri_launcher.launch_finish obj result)

  method set_uri : string option -> unit =
    fun uri ->
      (Uri_launcher.set_uri obj uri)

    method as_uri_launcher = obj
end

