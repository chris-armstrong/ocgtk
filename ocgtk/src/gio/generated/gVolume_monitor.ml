(* Signal class defined in gvolume_monitor_signals.ml *)

class type volume_monitor_t = object
    inherit Gvolume_monitor_signals.volume_monitor_signals
    method get_connected_drives : unit -> GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.drive_t list
    method get_mount_for_uuid : string -> GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.mount_t option
    method get_mounts : unit -> GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.mount_t list
    method get_volume_for_uuid : string -> GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.volume_t option
    method get_volumes : unit -> GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.volume_t list
    method as_volume_monitor : Volume_monitor.t
end

(* High-level class for VolumeMonitor *)
class volume_monitor (obj : Volume_monitor.t) : volume_monitor_t = object (self)
  inherit Gvolume_monitor_signals.volume_monitor_signals obj

  method get_connected_drives : unit -> GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.drive_t list =
    fun () ->
      (List.map (fun ret -> new GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.drive ret))(Volume_monitor.get_connected_drives obj)

  method get_mount_for_uuid : string -> GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.mount_t option =
    fun uuid ->
      Option.map (fun ret -> new GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.mount ret) (Volume_monitor.get_mount_for_uuid obj uuid)

  method get_mounts : unit -> GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.mount_t list =
    fun () ->
      (List.map (fun ret -> new GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.mount ret))(Volume_monitor.get_mounts obj)

  method get_volume_for_uuid : string -> GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.volume_t option =
    fun uuid ->
      Option.map (fun ret -> new GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.volume ret) (Volume_monitor.get_volume_for_uuid obj uuid)

  method get_volumes : unit -> GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.volume_t list =
    fun () ->
      (List.map (fun ret -> new GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.volume ret))(Volume_monitor.get_volumes obj)

    method as_volume_monitor = obj
end

