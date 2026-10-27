(** Asynchronous API to open a uri with an application.

    [GtkUriLauncher] collects the arguments that are needed to open the uri.

    Depending on system configuration, user preferences and available APIs, this
    may or may not show an app chooser dialog or launch the default application
    right away.

    The operation is started with the [Gtk.UriLauncher.launch] function.

    To launch a file, use [Gtk.FileLauncher].

    Its methods, signals and properties are on {!class-type-uri_launcher_t}. The
    functions it is built on are in {!Ocgtk.Raw.Uri_launcher}. *)

(** The methods, signals and properties of a [GtkUriLauncher]. *)
class type uri_launcher_t = object
  method can_launch :
    Application_and__window_and__window_group.window_t option -> bool

  method get_uri : unit -> string option

  method launch_finish :
    Ocgio.Async_result.async_result_t -> (bool, GError.t) result

  method set_uri : string option -> unit
  method as_uri_launcher : Raw.Uri_launcher.t
end

class uri_launcher : Raw.Uri_launcher.t -> uri_launcher_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Uri_launcher.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkUriLauncher], give one already wrapped. *)

val new_ : string option -> uri_launcher_t
