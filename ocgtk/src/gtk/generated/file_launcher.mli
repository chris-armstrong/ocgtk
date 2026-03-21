(* GENERATED CODE - DO NOT EDIT *)
(* FileLauncher: FileLauncher *)

type t = [`file_launcher | `object_] Gobject.obj

(** Create a new FileLauncher *)
external new_ : Ocgtk_gio.Gio.Wrappers.File.t option -> t = "ml_gtk_file_launcher_new"

(* Methods *)
(** Sets whether to make the file writable for the handler. *)
external set_writable : t -> bool -> unit = "ml_gtk_file_launcher_set_writable"

(** Sets the file that will be opened. *)
external set_file : t -> Ocgtk_gio.Gio.Wrappers.File.t option -> unit = "ml_gtk_file_launcher_set_file"

(** Sets whether to awlays ask the user to choose an app for opening the file.
If `FALSE`, the file might be opened with a default app or the previous choice. *)
external set_always_ask : t -> bool -> unit = "ml_gtk_file_launcher_set_always_ask"

(** Finishes the [method@Gtk.FileLauncher.open_containing_folder]
call and returns the result. *)
external open_containing_folder_finish : t -> Ocgtk_gio.Gio.Wrappers.Async_result.t -> (bool, GError.t) result = "ml_gtk_file_launcher_open_containing_folder_finish"

(** Finishes the [method@Gtk.FileLauncher.launch] call and
returns the result. *)
external launch_finish : t -> Ocgtk_gio.Gio.Wrappers.Async_result.t -> (bool, GError.t) result = "ml_gtk_file_launcher_launch_finish"

(** Returns whether to make the file writable for the handler. *)
external get_writable : t -> bool = "ml_gtk_file_launcher_get_writable"

(** Gets the file that will be opened. *)
external get_file : t -> Ocgtk_gio.Gio.Wrappers.File.t option = "ml_gtk_file_launcher_get_file"

(** Returns whether to ask the user to choose an app for opening the file. *)
external get_always_ask : t -> bool = "ml_gtk_file_launcher_get_always_ask"

(* Properties *)

