class type volume_monitor_t = object
  method on_drive_changed :
    ?after:bool ->
    callback:
      (drive:
         GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .drive_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drive_connected :
    ?after:bool ->
    callback:
      (drive:
         GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .drive_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drive_disconnected :
    ?after:bool ->
    callback:
      (drive:
         GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .drive_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drive_eject_button :
    ?after:bool ->
    callback:
      (drive:
         GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .drive_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drive_stop_button :
    ?after:bool ->
    callback:
      (drive:
         GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .drive_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_mount_added :
    ?after:bool ->
    callback:
      (mount:
         GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .mount_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_mount_changed :
    ?after:bool ->
    callback:
      (mount:
         GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .mount_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_mount_pre_unmount :
    ?after:bool ->
    callback:
      (mount:
         GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .mount_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_mount_removed :
    ?after:bool ->
    callback:
      (mount:
         GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .mount_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_volume_added :
    ?after:bool ->
    callback:
      (volume:
         GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .volume_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_volume_changed :
    ?after:bool ->
    callback:
      (volume:
         GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .volume_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_volume_removed :
    ?after:bool ->
    callback:
      (volume:
         GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .volume_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_connected_drives :
    unit ->
    GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
    .drive_t
    list

  method get_mount_for_uuid :
    string ->
    GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
    .mount_t
    option

  method get_mounts :
    unit ->
    GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
    .mount_t
    list

  method get_volume_for_uuid :
    string ->
    GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
    .volume_t
    option

  method get_volumes :
    unit ->
    GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
    .volume_t
    list

  method as_volume_monitor : Volume_monitor.t
end

class volume_monitor : Volume_monitor.t -> volume_monitor_t
