(* GENERATED CODE - DO NOT EDIT *)
(* FileDescriptorBased: FileDescriptorBased *)

type t = [ `file_descriptor_based ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t
  = "ml_gio_file_descriptor_based_from_gobject"

(* Methods *)

external get_fd : t -> int = "ml_g_file_descriptor_based_get_fd"
(** Gets the underlying file descriptor. *)
