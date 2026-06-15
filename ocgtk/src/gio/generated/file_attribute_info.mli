(* GENERATED CODE - DO NOT EDIT *)
(* FileAttributeInfo: FileAttributeInfo *)

type t = [ `file_attribute_info ] Gobject.obj
(** Information about a specific attribute. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_name : t -> string = "ml_g_file_attribute_info_get_name"

external get_type : t -> Gio_enums.fileattributetype
  = "ml_g_file_attribute_info_get_type"

external get_flags : t -> Gio_enums.fileattributeinfoflags
  = "ml_g_file_attribute_info_get_flags"

(* Setters *)
external set_name : t -> string -> unit = "ml_g_file_attribute_info_set_name"

external set_type : t -> Gio_enums.fileattributetype -> unit
  = "ml_g_file_attribute_info_set_type"

external set_flags : t -> Gio_enums.fileattributeinfoflags -> unit
  = "ml_g_file_attribute_info_set_flags"

external make :
  string -> Gio_enums.fileattributetype -> Gio_enums.fileattributeinfoflags -> t
  = "ml_g_file_attribute_info_make"
