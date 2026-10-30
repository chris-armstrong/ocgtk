(* GENERATED CODE - DO NOT EDIT *)
(* FileList: FileList *)

(** An opaque type representing a list of files.

    The class built on this module is in {!Ocgdk.File_list}. *)

type t = [ `file_list ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gdk_file_list_get_type"

external new_from_array : Ocgio_raw.File.t array -> Gsize.t -> t
  = "ml_gdk_file_list_new_from_array"
(** Creates a new [GdkFileList] for the given array of files.

    This function is meant to be used by language bindings. *)

external new_from_list : Ocgio_raw.File.t list -> t
  = "ml_gdk_file_list_new_from_list"
(** Creates a new files list container from a singly linked list of [GFile]
    instances.

    This function is meant to be used by language bindings *)

(* Methods *)

external get_files : t -> Ocgio_raw.File.t list = "ml_gdk_file_list_get_files"
(** Retrieves the list of files inside a [GdkFileList].

    This function is meant for language bindings. *)
