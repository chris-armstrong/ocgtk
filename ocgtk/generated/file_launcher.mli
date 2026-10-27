(** Asynchronous API to open a file with an application.

    [GtkFileLauncher] collects the arguments that are needed to open the file.

    Depending on system configuration, user preferences and available APIs, this
    may or may not show an app chooser dialog or launch the default application
    right away.

    The operation is started with the [Gtk.FileLauncher.launch] function.

    To launch uris that don't represent files, use [Gtk.UriLauncher].

    Its methods, signals and properties are on {!class-type-file_launcher_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.File_launcher}. *)

(** The methods, signals and properties of a [GtkFileLauncher]. *)
class type file_launcher_t = object
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

  method as_file_launcher : Raw.File_launcher.t
end

class file_launcher : Raw.File_launcher.t -> file_launcher_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.File_launcher.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkFileLauncher], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : Ocgio.File.file_t option -> file_launcher_t
(** Creates a new [GtkFileLauncher] object. *)
