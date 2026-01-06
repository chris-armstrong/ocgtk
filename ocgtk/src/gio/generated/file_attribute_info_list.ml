(* GENERATED CODE - DO NOT EDIT *)
(* FileAttributeInfoList: FileAttributeInfoList *)

(** Acts as a lightweight registry for possible valid file attributes.
The registry stores Key-Value pair formats as #GFileAttributeInfos. *)
type t = [`file_attribute_info_list] Gobject.obj

(** Create a new FileAttributeInfoList *)
external new_ : unit -> t = "ml_g_file_attribute_info_list_new"

(* Methods *)
(** Removes a reference from the given @list. If the reference count
falls to zero, the @list is deleted. *)
external unref : t -> unit = "ml_g_file_attribute_info_list_unref"

(** References a file attribute info list. *)
external ref : t -> t = "ml_g_file_attribute_info_list_ref"

(** Gets the file attribute with the name @name from @list. *)
external lookup : t -> string -> File_attribute_info.t = "ml_g_file_attribute_info_list_lookup"

(** Makes a duplicate of a file attribute info list. *)
external dup : t -> t = "ml_g_file_attribute_info_list_dup"

(** Adds a new attribute with @name to the @list, setting
its @type and @flags. *)
external add : t -> string -> Gio_enums.fileattributetype -> Gio_enums.fileattributeinfoflags -> unit = "ml_g_file_attribute_info_list_add"

