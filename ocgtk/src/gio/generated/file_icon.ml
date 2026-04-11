(* GENERATED CODE - DO NOT EDIT *)
(* FileIcon: FileIcon *)

type t = [`file_icon | `object_] Gobject.obj

(** Create a new FileIcon *)
external new_ : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t -> t = "ml_g_file_icon_new"

(* Methods *)
(** Gets the #GFile associated with the given @icon. *)
external get_file : t -> File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t = "ml_g_file_icon_get_file"

(* Properties *)

