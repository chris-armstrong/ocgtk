(* GENERATED CODE - DO NOT EDIT *)
(* VolumeMonitor: VolumeMonitor *)

type t = [`volume_monitor | `object_] Gobject.obj

(* Methods *)
(** Finds a #GVolume object by its UUID (see g_volume_get_uuid()) *)
external get_volume_for_uuid : t -> string -> File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.t option = "ml_g_volume_monitor_get_volume_for_uuid"

(** Finds a #GMount object by its UUID (see g_mount_get_uuid()) *)
external get_mount_for_uuid : t -> string -> File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.t option = "ml_g_volume_monitor_get_mount_for_uuid"

