class type volume_monitor_t = object
  method on_drive_changed :
    callback:
      (drive:
         App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .Drive
         .t
         Gobject.obj
         option ->
      unit) ->
    Gobject.Signal.handler_id

  method on_drive_connected :
    callback:
      (drive:
         App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .Drive
         .t
         Gobject.obj
         option ->
      unit) ->
    Gobject.Signal.handler_id

  method on_drive_disconnected :
    callback:
      (drive:
         App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .Drive
         .t
         Gobject.obj
         option ->
      unit) ->
    Gobject.Signal.handler_id

  method on_drive_eject_button :
    callback:
      (drive:
         App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .Drive
         .t
         Gobject.obj
         option ->
      unit) ->
    Gobject.Signal.handler_id

  method on_drive_stop_button :
    callback:
      (drive:
         App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .Drive
         .t
         Gobject.obj
         option ->
      unit) ->
    Gobject.Signal.handler_id

  method on_mount_added :
    callback:
      (mount:
         App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .Mount
         .t
         Gobject.obj
         option ->
      unit) ->
    Gobject.Signal.handler_id

  method on_mount_changed :
    callback:
      (mount:
         App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .Mount
         .t
         Gobject.obj
         option ->
      unit) ->
    Gobject.Signal.handler_id

  method on_mount_pre_unmount :
    callback:
      (mount:
         App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .Mount
         .t
         Gobject.obj
         option ->
      unit) ->
    Gobject.Signal.handler_id

  method on_mount_removed :
    callback:
      (mount:
         App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .Mount
         .t
         Gobject.obj
         option ->
      unit) ->
    Gobject.Signal.handler_id

  method on_volume_added :
    callback:
      (volume:
         App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .Volume
         .t
         Gobject.obj
         option ->
      unit) ->
    Gobject.Signal.handler_id

  method on_volume_changed :
    callback:
      (volume:
         App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .Volume
         .t
         Gobject.obj
         option ->
      unit) ->
    Gobject.Signal.handler_id

  method on_volume_removed :
    callback:
      (volume:
         App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
         .Volume
         .t
         Gobject.obj
         option ->
      unit) ->
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

(* High-level class for VolumeMonitor *)
class volume_monitor (obj : Volume_monitor.t) : volume_monitor_t =
  object (self)
    method on_drive_changed ~callback =
      Volume_monitor.on_drive_changed self#as_volume_monitor ~callback

    method on_drive_connected ~callback =
      Volume_monitor.on_drive_connected self#as_volume_monitor ~callback

    method on_drive_disconnected ~callback =
      Volume_monitor.on_drive_disconnected self#as_volume_monitor ~callback

    method on_drive_eject_button ~callback =
      Volume_monitor.on_drive_eject_button self#as_volume_monitor ~callback

    method on_drive_stop_button ~callback =
      Volume_monitor.on_drive_stop_button self#as_volume_monitor ~callback

    method on_mount_added ~callback =
      Volume_monitor.on_mount_added self#as_volume_monitor ~callback

    method on_mount_changed ~callback =
      Volume_monitor.on_mount_changed self#as_volume_monitor ~callback

    method on_mount_pre_unmount ~callback =
      Volume_monitor.on_mount_pre_unmount self#as_volume_monitor ~callback

    method on_mount_removed ~callback =
      Volume_monitor.on_mount_removed self#as_volume_monitor ~callback

    method on_volume_added ~callback =
      Volume_monitor.on_volume_added self#as_volume_monitor ~callback

    method on_volume_changed ~callback =
      Volume_monitor.on_volume_changed self#as_volume_monitor ~callback

    method on_volume_removed ~callback =
      Volume_monitor.on_volume_removed self#as_volume_monitor ~callback

    method get_connected_drives :
        unit ->
        GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
        .drive_t
        list =
      fun () ->
        (List.map (fun ret ->
             new
               GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
               .drive
               ret))
          (Volume_monitor.get_connected_drives obj)

    method get_mount_for_uuid :
        string ->
        GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
        .mount_t
        option =
      fun uuid ->
        Option.map
          (fun ret ->
            new
              GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
              .mount
              ret)
          (Volume_monitor.get_mount_for_uuid obj uuid)

    method get_mounts :
        unit ->
        GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
        .mount_t
        list =
      fun () ->
        (List.map (fun ret ->
             new
               GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
               .mount
               ret))
          (Volume_monitor.get_mounts obj)

    method get_volume_for_uuid :
        string ->
        GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
        .volume_t
        option =
      fun uuid ->
        Option.map
          (fun ret ->
            new
              GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
              .volume
              ret)
          (Volume_monitor.get_volume_for_uuid obj uuid)

    method get_volumes :
        unit ->
        GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
        .volume_t
        list =
      fun () ->
        (List.map (fun ret ->
             new
               GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
               .volume
               ret))
          (Volume_monitor.get_volumes obj)

    method as_volume_monitor = obj
  end
