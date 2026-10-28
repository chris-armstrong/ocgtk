(** Asynchronous API to open a uri with an application.

    Its methods, signals and properties are on {!class-type-uri_launcher_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Uri_launcher}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [UriLauncher].}

    Asynchronous API to open a uri with an application.

    [GtkUriLauncher] collects the arguments that are needed to open the uri.

    Depending on system configuration, user preferences and available APIs, this
    may or may not show an app chooser dialog or launch the default application
    right away.

    The operation is started with the [Gtk.UriLauncher.launch] function.

    To launch a file, use [Gtk.FileLauncher]. *)
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

class uri_launcher : Raw.Uri_launcher.t -> uri_launcher_t
(** Wraps a raw handle of {!Ocgtk.Raw.Uri_launcher.t}. *)

(** {1:description Description}

    Asynchronous API to open a uri with an application.

    [GtkUriLauncher] collects the arguments that are needed to open the uri.

    Depending on system configuration, user preferences and available APIs, this
    may or may not show an app chooser dialog or launch the default application
    right away.

    The operation is started with the [Gtk.UriLauncher.launch] function.

    To launch a file, use [Gtk.FileLauncher]. *)

(** {1:constructors Constructors} *)

val new_ : string option -> uri_launcher_t
(** Creates a new [GtkUriLauncher] object. *)
