(* GENERATED CODE - DO NOT EDIT *)
(* UnixMountEntry: UnixMountEntry *)

type t = [ `unix_mount_entry ] Gobject.obj
(** Defines a Unix mount entry (e.g. <filename>/media/cdrom</filename>). This
    corresponds roughly to a mtab entry. *)

(* Methods *)

external get_type : unit -> Gobject.Type.t = "ml_gio_unix_mount_entry_get_type"
