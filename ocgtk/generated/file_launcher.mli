(** Asynchronous API to open a file with an application.

    Its methods, signals and properties are on {!class-type-file_launcher_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.File_launcher}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FileLauncher].}

    Asynchronous API to open a file with an application.

    [GtkFileLauncher] collects the arguments that are needed to open the file.

    Depending on system configuration, user preferences and available APIs, this
    may or may not show an app chooser dialog or launch the default application
    right away.

    The operation is started with the [Gtk.FileLauncher.launch] function.

    To launch uris that don't represent files, use [Gtk.UriLauncher]. *)
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

class file_launcher : Raw.File_launcher.t -> file_launcher_t
(** Wraps a raw handle of {!Ocgtk.Raw.File_launcher.t}. *)

(** {1:description Description}

    Asynchronous API to open a file with an application.

    [GtkFileLauncher] collects the arguments that are needed to open the file.

    Depending on system configuration, user preferences and available APIs, this
    may or may not show an app chooser dialog or launch the default application
    right away.

    The operation is started with the [Gtk.FileLauncher.launch] function.

    To launch uris that don't represent files, use [Gtk.UriLauncher]. *)

(** {1:constructors Constructors} *)

val new_ : Ocgio.File.file_t option -> file_launcher_t
(** Creates a new [GtkFileLauncher] object. *)
