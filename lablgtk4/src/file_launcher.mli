(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FileLauncher *)

type t = Gtk.Widget.t

(** Create a new FileLauncher *)
external new_ : unit -> t = "ml_gtk_file_launcher_new"

(* Properties *)

(** Get property: always-ask *)
external get_always_ask : t -> bool = "ml_gtk_file_launcher_get_always_ask"

(** Set property: always-ask *)
external set_always_ask : t -> bool -> unit = "ml_gtk_file_launcher_set_always_ask"

(** Get property: writable *)
external get_writable : t -> bool = "ml_gtk_file_launcher_get_writable"

(** Set property: writable *)
external set_writable : t -> bool -> unit = "ml_gtk_file_launcher_set_writable"

external set_file : t -> unit -> unit = "ml_gtk_file_launcher_set_file"

external open_containing_folder_finish : t -> unit -> (bool, GError.t) result = "ml_gtk_file_launcher_open_containing_folder_finish"

external open_containing_folder : t -> Gtk.Widget.t option -> unit -> unit -> unit -> unit = "ml_gtk_file_launcher_open_containing_folder"

external launch_finish : t -> unit -> (bool, GError.t) result = "ml_gtk_file_launcher_launch_finish"

external launch : t -> Gtk.Widget.t option -> unit -> unit -> unit -> unit = "ml_gtk_file_launcher_launch"

