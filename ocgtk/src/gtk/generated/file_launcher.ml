(* GENERATED CODE - DO NOT EDIT *)
(* FileLauncher: FileLauncher *)

type t = [`file_launcher | `object_] Gobject.obj

(** Create a new FileLauncher *)
external new_ : unit -> t = "ml_gtk_file_launcher_new"

(* Methods *)
(** Sets whether to make the file writable for the handler. *)
external set_writable : t -> bool -> unit = "ml_gtk_file_launcher_set_writable"

(** Sets whether to awlays ask the user to choose an app for opening the file.
If `FALSE`, the file might be opened with a default app or the previous choice. *)
external set_always_ask : t -> bool -> unit = "ml_gtk_file_launcher_set_always_ask"

(** Returns whether to make the file writable for the handler. *)
external get_writable : t -> bool = "ml_gtk_file_launcher_get_writable"

(** Returns whether to ask the user to choose an app for opening the file. *)
external get_always_ask : t -> bool = "ml_gtk_file_launcher_get_always_ask"

(* Properties *)

