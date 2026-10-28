(* GENERATED CODE - DO NOT EDIT *)
(* FileIcon: FileIcon *)

(** [GFileIcon] specifies an icon by pointing to an image file to be used as
    icon.

    It implements [Gio.LoadableIcon].

    The class built on this module is in {!Ocgio.File_icon}. *)

type t = [ `file_icon | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_file_icon_get_type"

external new_ : App_info_cycle_64c425a0.File.t -> t = "ml_g_file_icon_new"
(** Creates a new icon for a file. *)

(* Methods *)

external get_file : t -> App_info_cycle_64c425a0.File.t
  = "ml_g_file_icon_get_file"
(** Gets the [GFile] associated with the given [icon]. *)

(* Properties *)
