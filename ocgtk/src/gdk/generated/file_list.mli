(* GENERATED CODE - DO NOT EDIT *)
(* FileList: FileList *)

(** An opaque type representing a list of files. *)
type t = [`file_list] Gobject.obj

(** Create a new FileList *)
external new_from_list : Ocgtk_gio.Gio.Wrappers.File.t list -> t = "ml_gdk_file_list_new_from_list"

(* Methods *)
(** Retrieves the list of files inside a `GdkFileList`.

This function is meant for language bindings. *)
external get_files : t -> Ocgtk_gio.Gio.Wrappers.File.t list = "ml_gdk_file_list_get_files"

