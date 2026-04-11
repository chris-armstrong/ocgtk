(* Signal class defined in gvolume_monitor_signals.ml *)

class type volume_monitor_t = object
    inherit Gvolume_monitor_signals.volume_monitor_signals
    method get_mount_for_uuid : string -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.mount_t option
    method get_volume_for_uuid : string -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.volume_t option
    method as_volume_monitor : Volume_monitor.t
end

(* High-level class for VolumeMonitor *)
class volume_monitor (obj : Volume_monitor.t) : volume_monitor_t = object (self)
  inherit Gvolume_monitor_signals.volume_monitor_signals obj

  method get_mount_for_uuid : string -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.mount_t option =
    fun uuid ->
      Option.map (fun ret -> new GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.mount ret) (Volume_monitor.get_mount_for_uuid obj uuid)

  method get_volume_for_uuid : string -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.volume_t option =
    fun uuid ->
      Option.map (fun ret -> new GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.volume ret) (Volume_monitor.get_volume_for_uuid obj uuid)

    method as_volume_monitor = obj
end

