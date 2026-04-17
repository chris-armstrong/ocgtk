(* GENERATED CODE - DO NOT EDIT *)
(* VolumeMonitor: VolumeMonitor *)

type t = [`volume_monitor | `object_] Gobject.obj

(* Methods *)
(** Gets a list of the volumes on the system.

The returned list should be freed with g_list_free(), after
its elements have been unreffed with g_object_unref(). *)
external get_volumes : t -> App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.t list = "ml_g_volume_monitor_get_volumes"

(** Finds a #GVolume object by its UUID (see g_volume_get_uuid()) *)
external get_volume_for_uuid : t -> string -> App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.t option = "ml_g_volume_monitor_get_volume_for_uuid"

(** Gets a list of the mounts on the system.

The returned list should be freed with g_list_free(), after
its elements have been unreffed with g_object_unref(). *)
external get_mounts : t -> App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.t list = "ml_g_volume_monitor_get_mounts"

(** Finds a #GMount object by its UUID (see g_mount_get_uuid()) *)
external get_mount_for_uuid : t -> string -> App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.t option = "ml_g_volume_monitor_get_mount_for_uuid"

(** Gets a list of drives connected to the system.

The returned list should be freed with g_list_free(), after
its elements have been unreffed with g_object_unref(). *)
external get_connected_drives : t -> App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.t list = "ml_g_volume_monitor_get_connected_drives"

