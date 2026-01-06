(* GENERATED CODE - DO NOT EDIT *)
(* FileList: FileList *)

(** An opaque type representing a list of files. *)
type t = [`file_list] Gobject.obj

(** Create a new FileList *)
external new_from_array : unit -> unit -> t = "ml_gdk_file_list_new_from_array"

(** Create a new FileList *)
external new_from_list : unit -> t = "ml_gdk_file_list_new_from_list"

(* Methods *)
