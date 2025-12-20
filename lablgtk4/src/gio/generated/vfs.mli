(* GENERATED CODE - DO NOT EDIT *)
(* Vfs: Vfs *)

type t = [`vfs | `object_] Gobject.obj

(* Methods *)
(** Unregisters the URI handler for @scheme previously registered with
g_vfs_register_uri_scheme(). *)
external unregister_uri_scheme : t -> string -> bool = "ml_g_vfs_unregister_uri_scheme"

(** Checks if the VFS is active. *)
external is_active : t -> bool = "ml_g_vfs_is_active"

