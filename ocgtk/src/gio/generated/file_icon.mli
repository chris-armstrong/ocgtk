(* GENERATED CODE - DO NOT EDIT *)
(* FileIcon: FileIcon *)

type t = [ `file_icon | `object_ ] Gobject.obj

external new_ : App_info_cycle_64c425a0.File.t -> t = "ml_g_file_icon_new"
(** Create a new FileIcon *)

(* Methods *)

external get_file : t -> App_info_cycle_64c425a0.File.t
  = "ml_g_file_icon_get_file"
(** Gets the #GFile associated with the given @icon. *)

(* Properties *)
