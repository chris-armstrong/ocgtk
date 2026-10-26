class type uri_launcher_t = object
  method can_launch :
    Application_and__window_and__window_group.window_t option -> bool

  method get_uri : unit -> string option

  method launch_finish :
    Ocgio.Async_result.async_result_t -> (bool, GError.t) result

  method set_uri : string option -> unit
  method as_uri_launcher : Raw.Uri_launcher.t
end

(* High-level class for UriLauncher *)
class uri_launcher (obj : Raw.Uri_launcher.t) : uri_launcher_t =
  object (self)
    method can_launch :
        Application_and__window_and__window_group.window_t option -> bool =
      fun parent ->
        let parent = Option.map (fun c -> c#as_window) parent in
        Raw.Uri_launcher.can_launch obj parent

    method get_uri : unit -> string option =
      fun () -> Raw.Uri_launcher.get_uri obj

    method launch_finish :
        Ocgio.Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Uri_launcher.launch_finish obj result

    method set_uri : string option -> unit =
      fun uri -> Raw.Uri_launcher.set_uri obj uri

    method as_uri_launcher = obj
  end

let new_ (uri : string option) : uri_launcher_t =
  let obj_ = Raw.Uri_launcher.new_ uri in
  new uri_launcher obj_
