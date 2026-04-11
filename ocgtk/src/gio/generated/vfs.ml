(* GENERATED CODE - DO NOT EDIT *)
(* Vfs: Vfs *)

type t = [`vfs | `object_] Gobject.obj

(* Methods *)
(** Unregisters the URI handler for @scheme previously registered with
g_vfs_register_uri_scheme(). *)
external unregister_uri_scheme : t -> string -> bool = "ml_g_vfs_unregister_uri_scheme"

(** This operation never fails, but the returned object might
not support any I/O operations if the @parse_name cannot
be parsed by the #GVfs module. *)
external parse_name : t -> string -> File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t = "ml_g_vfs_parse_name"

(** Checks if the VFS is active. *)
external is_active : t -> bool = "ml_g_vfs_is_active"

(** Gets a list of URI schemes supported by @vfs. *)
external get_supported_uri_schemes : t -> string array = "ml_g_vfs_get_supported_uri_schemes"

(** Gets a #GFile for @uri.

This operation never fails, but the returned object
might not support any I/O operation if the URI
is malformed or if the URI scheme is not supported. *)
external get_file_for_uri : t -> string -> File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t = "ml_g_vfs_get_file_for_uri"

(** Gets a #GFile for @path. *)
external get_file_for_path : t -> string -> File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t = "ml_g_vfs_get_file_for_path"

