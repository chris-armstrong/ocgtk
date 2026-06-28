class type volume_monitor_t = object
  method on_drive_changed :
    ?after:bool ->
    callback:(drive:GApp_info_cycle_64c425a0.drive_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drive_connected :
    ?after:bool ->
    callback:(drive:GApp_info_cycle_64c425a0.drive_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drive_disconnected :
    ?after:bool ->
    callback:(drive:GApp_info_cycle_64c425a0.drive_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drive_eject_button :
    ?after:bool ->
    callback:(drive:GApp_info_cycle_64c425a0.drive_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drive_stop_button :
    ?after:bool ->
    callback:(drive:GApp_info_cycle_64c425a0.drive_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_mount_added :
    ?after:bool ->
    callback:(mount:GApp_info_cycle_64c425a0.mount_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_mount_changed :
    ?after:bool ->
    callback:(mount:GApp_info_cycle_64c425a0.mount_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_mount_pre_unmount :
    ?after:bool ->
    callback:(mount:GApp_info_cycle_64c425a0.mount_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_mount_removed :
    ?after:bool ->
    callback:(mount:GApp_info_cycle_64c425a0.mount_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_volume_added :
    ?after:bool ->
    callback:(volume:GApp_info_cycle_64c425a0.volume_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_volume_changed :
    ?after:bool ->
    callback:(volume:GApp_info_cycle_64c425a0.volume_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_volume_removed :
    ?after:bool ->
    callback:(volume:GApp_info_cycle_64c425a0.volume_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_connected_drives : unit -> GApp_info_cycle_64c425a0.drive_t list
  method get_mount_for_uuid : string -> GApp_info_cycle_64c425a0.mount_t option
  method get_mounts : unit -> GApp_info_cycle_64c425a0.mount_t list

  method get_volume_for_uuid :
    string -> GApp_info_cycle_64c425a0.volume_t option

  method get_volumes : unit -> GApp_info_cycle_64c425a0.volume_t list
  method as_volume_monitor : Volume_monitor.t
end

(* High-level class for VolumeMonitor *)
class volume_monitor (obj : Volume_monitor.t) : volume_monitor_t =
  object (self)
    method on_drive_changed ?(after = false) ~callback () =
      Volume_monitor.on_drive_changed ~after self#as_volume_monitor
        ~callback:(fun ~drive ->
          callback ~drive:(new GApp_info_cycle_64c425a0.drive drive))

    method on_drive_connected ?(after = false) ~callback () =
      Volume_monitor.on_drive_connected ~after self#as_volume_monitor
        ~callback:(fun ~drive ->
          callback ~drive:(new GApp_info_cycle_64c425a0.drive drive))

    method on_drive_disconnected ?(after = false) ~callback () =
      Volume_monitor.on_drive_disconnected ~after self#as_volume_monitor
        ~callback:(fun ~drive ->
          callback ~drive:(new GApp_info_cycle_64c425a0.drive drive))

    method on_drive_eject_button ?(after = false) ~callback () =
      Volume_monitor.on_drive_eject_button ~after self#as_volume_monitor
        ~callback:(fun ~drive ->
          callback ~drive:(new GApp_info_cycle_64c425a0.drive drive))

    method on_drive_stop_button ?(after = false) ~callback () =
      Volume_monitor.on_drive_stop_button ~after self#as_volume_monitor
        ~callback:(fun ~drive ->
          callback ~drive:(new GApp_info_cycle_64c425a0.drive drive))

    method on_mount_added ?(after = false) ~callback () =
      Volume_monitor.on_mount_added ~after self#as_volume_monitor
        ~callback:(fun ~mount ->
          callback ~mount:(new GApp_info_cycle_64c425a0.mount mount))

    method on_mount_changed ?(after = false) ~callback () =
      Volume_monitor.on_mount_changed ~after self#as_volume_monitor
        ~callback:(fun ~mount ->
          callback ~mount:(new GApp_info_cycle_64c425a0.mount mount))

    method on_mount_pre_unmount ?(after = false) ~callback () =
      Volume_monitor.on_mount_pre_unmount ~after self#as_volume_monitor
        ~callback:(fun ~mount ->
          callback ~mount:(new GApp_info_cycle_64c425a0.mount mount))

    method on_mount_removed ?(after = false) ~callback () =
      Volume_monitor.on_mount_removed ~after self#as_volume_monitor
        ~callback:(fun ~mount ->
          callback ~mount:(new GApp_info_cycle_64c425a0.mount mount))

    method on_volume_added ?(after = false) ~callback () =
      Volume_monitor.on_volume_added ~after self#as_volume_monitor
        ~callback:(fun ~volume ->
          callback ~volume:(new GApp_info_cycle_64c425a0.volume volume))

    method on_volume_changed ?(after = false) ~callback () =
      Volume_monitor.on_volume_changed ~after self#as_volume_monitor
        ~callback:(fun ~volume ->
          callback ~volume:(new GApp_info_cycle_64c425a0.volume volume))

    method on_volume_removed ?(after = false) ~callback () =
      Volume_monitor.on_volume_removed ~after self#as_volume_monitor
        ~callback:(fun ~volume ->
          callback ~volume:(new GApp_info_cycle_64c425a0.volume volume))

    method get_connected_drives : unit -> GApp_info_cycle_64c425a0.drive_t list
        =
      fun () ->
        (List.map (fun ret -> new GApp_info_cycle_64c425a0.drive ret))
          (Volume_monitor.get_connected_drives obj)

    method get_mount_for_uuid :
        string -> GApp_info_cycle_64c425a0.mount_t option =
      fun uuid ->
        Option.map
          (fun ret -> new GApp_info_cycle_64c425a0.mount ret)
          (Volume_monitor.get_mount_for_uuid obj uuid)

    method get_mounts : unit -> GApp_info_cycle_64c425a0.mount_t list =
      fun () ->
        (List.map (fun ret -> new GApp_info_cycle_64c425a0.mount ret))
          (Volume_monitor.get_mounts obj)

    method get_volume_for_uuid :
        string -> GApp_info_cycle_64c425a0.volume_t option =
      fun uuid ->
        Option.map
          (fun ret -> new GApp_info_cycle_64c425a0.volume ret)
          (Volume_monitor.get_volume_for_uuid obj uuid)

    method get_volumes : unit -> GApp_info_cycle_64c425a0.volume_t list =
      fun () ->
        (List.map (fun ret -> new GApp_info_cycle_64c425a0.volume ret))
          (Volume_monitor.get_volumes obj)

    method as_volume_monitor = obj
  end
