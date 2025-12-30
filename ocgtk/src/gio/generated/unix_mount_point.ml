(* GENERATED CODE - DO NOT EDIT *)
(* UnixMountPoint: UnixMountPoint *)

(** Defines a Unix mount point (e.g. <filename>/dev</filename>).
This corresponds roughly to a fstab entry. *)
type t = [`unix_mount_point] Gobject.obj

(* Methods *)
(** Checks if a unix mount point is mountable by the user. *)
external is_user_mountable : t -> bool = "ml_g_unix_mount_point_is_user_mountable"

(** Checks if a unix mount point is read only. *)
external is_readonly : t -> bool = "ml_g_unix_mount_point_is_readonly"

(** Checks if a unix mount point is a loopback device. *)
external is_loopback : t -> bool = "ml_g_unix_mount_point_is_loopback"

(** Guesses the symbolic icon of a Unix mount point. *)
external guess_symbolic_icon : t -> Icon.t = "ml_g_unix_mount_point_guess_symbolic_icon"

(** Guesses the name of a Unix mount point.
The result is a translated string. *)
external guess_name : t -> string = "ml_g_unix_mount_point_guess_name"

(** Guesses the icon of a Unix mount point. *)
external guess_icon : t -> Icon.t = "ml_g_unix_mount_point_guess_icon"

(** Guesses whether a Unix mount point can be ejected. *)
external guess_can_eject : t -> bool = "ml_g_unix_mount_point_guess_can_eject"

(** Gets the options for the mount point. *)
external get_options : t -> string option = "ml_g_unix_mount_point_get_options"

(** Gets the mount path for a unix mount point. *)
external get_mount_path : t -> string = "ml_g_unix_mount_point_get_mount_path"

(** Gets the file system type for the mount point. *)
external get_fs_type : t -> string = "ml_g_unix_mount_point_get_fs_type"

(** Gets the device path for a unix mount point. *)
external get_device_path : t -> string = "ml_g_unix_mount_point_get_device_path"

(** Frees a unix mount point. *)
external free : t -> unit = "ml_g_unix_mount_point_free"

(** Makes a copy of @mount_point. *)
external copy : t -> t = "ml_g_unix_mount_point_copy"

(** Compares two unix mount points. *)
external compare : t -> t -> int = "ml_g_unix_mount_point_compare"

