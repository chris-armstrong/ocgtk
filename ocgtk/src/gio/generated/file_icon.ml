(* GENERATED CODE - DO NOT EDIT *)
(* FileIcon: FileIcon *)

type t = [`file_icon | `object_] Gobject.obj

(** Create a new FileIcon *)
external new_ : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t -> t = "ml_g_file_icon_new"

(* Methods *)
(** Gets the #GFile associated with the given @icon. *)
external get_file : t -> App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t = "ml_g_file_icon_get_file"

(* Properties *)

