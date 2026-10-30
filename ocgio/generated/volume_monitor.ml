class type volume_monitor_t = object
  (** {2:signals Signals} *)

  method on_drive_changed :
    ?after:bool ->
    callback:(drive:Drive.drive_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a drive changes. *)

  method on_drive_connected :
    ?after:bool ->
    callback:(drive:Drive.drive_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a drive is connected to the system. *)

  method on_drive_disconnected :
    ?after:bool ->
    callback:(drive:Drive.drive_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a drive is disconnected from the system. *)

  method on_drive_eject_button :
    ?after:bool ->
    callback:(drive:Drive.drive_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the eject button is pressed on [drive]. *)

  method on_drive_stop_button :
    ?after:bool ->
    callback:(drive:Drive.drive_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the stop button is pressed on [drive]. *)

  method on_mount_added :
    ?after:bool ->
    callback:(mount:Mount.mount_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a mount is added. *)

  method on_mount_changed :
    ?after:bool ->
    callback:(mount:Mount.mount_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a mount changes. *)

  method on_mount_pre_unmount :
    ?after:bool ->
    callback:(mount:Mount.mount_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** May be emitted when a mount is about to be removed.

      This signal depends on the backend and is only emitted if GIO was used to
      unmount. *)

  method on_mount_removed :
    ?after:bool ->
    callback:(mount:Mount.mount_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a mount is removed. *)

  method on_volume_added :
    ?after:bool ->
    callback:(volume:Volume.volume_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a mountable volume is added to the system. *)

  method on_volume_changed :
    ?after:bool ->
    callback:(volume:Volume.volume_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when mountable volume is changed. *)

  method on_volume_removed :
    ?after:bool ->
    callback:(volume:Volume.volume_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a mountable volume is removed from the system. *)

  (** {2:methods Methods} *)

  method get_connected_drives : unit -> Drive.drive_t list
  (** Gets a list of drives connected to the system. *)

  method get_mount_for_uuid : string -> Mount.mount_t option
  (** Finds a [GMount] object by its UUID (see [g_mount_get_uuid ()]) *)

  method get_mounts : unit -> Mount.mount_t list
  (** Gets a list of the mounts on the system. *)

  method get_volume_for_uuid : string -> Volume.volume_t option
  (** Finds a [GVolume] object by its UUID (see [g_volume_get_uuid ()]) *)

  method get_volumes : unit -> Volume.volume_t list
  (** Gets a list of the volumes on the system. *)

  (** {2:conversions Conversions} *)

  method as_volume_monitor : Raw.Volume_monitor.t
end

(* High-level class for VolumeMonitor *)
class volume_monitor (obj : Raw.Volume_monitor.t) : volume_monitor_t =
  object (self)
    method on_drive_changed ?(after = false) ~callback () =
      Raw.Volume_monitor.on_drive_changed ~after self#as_volume_monitor
        ~callback:(fun ~drive -> callback ~drive:(new Drive.drive drive))

    method on_drive_connected ?(after = false) ~callback () =
      Raw.Volume_monitor.on_drive_connected ~after self#as_volume_monitor
        ~callback:(fun ~drive -> callback ~drive:(new Drive.drive drive))

    method on_drive_disconnected ?(after = false) ~callback () =
      Raw.Volume_monitor.on_drive_disconnected ~after self#as_volume_monitor
        ~callback:(fun ~drive -> callback ~drive:(new Drive.drive drive))

    method on_drive_eject_button ?(after = false) ~callback () =
      Raw.Volume_monitor.on_drive_eject_button ~after self#as_volume_monitor
        ~callback:(fun ~drive -> callback ~drive:(new Drive.drive drive))

    method on_drive_stop_button ?(after = false) ~callback () =
      Raw.Volume_monitor.on_drive_stop_button ~after self#as_volume_monitor
        ~callback:(fun ~drive -> callback ~drive:(new Drive.drive drive))

    method on_mount_added ?(after = false) ~callback () =
      Raw.Volume_monitor.on_mount_added ~after self#as_volume_monitor
        ~callback:(fun ~mount -> callback ~mount:(new Mount.mount mount))

    method on_mount_changed ?(after = false) ~callback () =
      Raw.Volume_monitor.on_mount_changed ~after self#as_volume_monitor
        ~callback:(fun ~mount -> callback ~mount:(new Mount.mount mount))

    method on_mount_pre_unmount ?(after = false) ~callback () =
      Raw.Volume_monitor.on_mount_pre_unmount ~after self#as_volume_monitor
        ~callback:(fun ~mount -> callback ~mount:(new Mount.mount mount))

    method on_mount_removed ?(after = false) ~callback () =
      Raw.Volume_monitor.on_mount_removed ~after self#as_volume_monitor
        ~callback:(fun ~mount -> callback ~mount:(new Mount.mount mount))

    method on_volume_added ?(after = false) ~callback () =
      Raw.Volume_monitor.on_volume_added ~after self#as_volume_monitor
        ~callback:(fun ~volume -> callback ~volume:(new Volume.volume volume))

    method on_volume_changed ?(after = false) ~callback () =
      Raw.Volume_monitor.on_volume_changed ~after self#as_volume_monitor
        ~callback:(fun ~volume -> callback ~volume:(new Volume.volume volume))

    method on_volume_removed ?(after = false) ~callback () =
      Raw.Volume_monitor.on_volume_removed ~after self#as_volume_monitor
        ~callback:(fun ~volume -> callback ~volume:(new Volume.volume volume))

    method get_connected_drives : unit -> Drive.drive_t list =
      fun () ->
        (List.map (fun ret -> new Drive.drive ret))
          (Raw.Volume_monitor.get_connected_drives obj)

    method get_mount_for_uuid : string -> Mount.mount_t option =
      fun uuid ->
        Option.map
          (fun ret -> new Mount.mount ret)
          (Raw.Volume_monitor.get_mount_for_uuid obj uuid)

    method get_mounts : unit -> Mount.mount_t list =
      fun () ->
        (List.map (fun ret -> new Mount.mount ret))
          (Raw.Volume_monitor.get_mounts obj)

    method get_volume_for_uuid : string -> Volume.volume_t option =
      fun uuid ->
        Option.map
          (fun ret -> new Volume.volume ret)
          (Raw.Volume_monitor.get_volume_for_uuid obj uuid)

    method get_volumes : unit -> Volume.volume_t list =
      fun () ->
        (List.map (fun ret -> new Volume.volume ret))
          (Raw.Volume_monitor.get_volumes obj)

    method as_volume_monitor = obj
  end
