class volume_monitor : Volume_monitor.t ->
  object
    inherit Gvolume_monitor_signals.volume_monitor_signals
    method get_mount_for_uuid : string -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.mount option
    method get_volume_for_uuid : string -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.volume option
    method as_volume_monitor : Volume_monitor.t
  end

