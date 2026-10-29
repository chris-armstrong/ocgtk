class type uri_launcher_t = object
  (** {2:methods Methods} *)

  method can_launch : Window.window_t option -> bool
  (** Returns whether the launcher is likely to succeed in launching an
      application for its uri.

      This can be used to disable controls that trigger the launcher when they
      are known not to work. *)

  method get_uri : unit -> string option
  (** Gets the uri that will be opened. *)

  method launch_finish :
    Ocgio.Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes the [Gtk.UriLauncher.launch] call and returns the result. *)

  method set_uri : string option -> unit
  (** Sets the uri that will be opened. *)

  (** {2:conversions Conversions} *)

  method as_uri_launcher : Raw.Uri_launcher.t
end

(* High-level class for UriLauncher *)
class uri_launcher (obj : Raw.Uri_launcher.t) : uri_launcher_t =
  object (self)
    method can_launch : Window.window_t option -> bool =
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
