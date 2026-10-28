(** [GVolumeMonitor] is for listing the user interesting devices and volumes on
    the computer. In other words, what a file selector or file manager would
    show in a sidebar.

    Its methods, signals and properties are on {!class-type-volume_monitor_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgio.Raw.Volume_monitor}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [VolumeMonitor].}

    [GVolumeMonitor] is for listing the user interesting devices and volumes on
    the computer. In other words, what a file selector or file manager would
    show in a sidebar.

    [GVolumeMonitor] is not thread-default-context aware (see
    [GLib.MainContext.push_thread_default]), and so should not be used other
    than from the main thread, with no thread-default-context active.

    In order to receive updates about volumes and mounts monitored through GVFS,
    a main loop must be running. *)
class type volume_monitor_t = object
  method on_drive_changed :
    ?after:bool ->
    callback:(drive:App_info_cycle_64c425a0.drive_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a drive changes. *)

  method on_drive_connected :
    ?after:bool ->
    callback:(drive:App_info_cycle_64c425a0.drive_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a drive is connected to the system. *)

  method on_drive_disconnected :
    ?after:bool ->
    callback:(drive:App_info_cycle_64c425a0.drive_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a drive is disconnected from the system. *)

  method on_drive_eject_button :
    ?after:bool ->
    callback:(drive:App_info_cycle_64c425a0.drive_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the eject button is pressed on [drive]. *)

  method on_drive_stop_button :
    ?after:bool ->
    callback:(drive:App_info_cycle_64c425a0.drive_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the stop button is pressed on [drive]. *)

  method on_mount_added :
    ?after:bool ->
    callback:(mount:App_info_cycle_64c425a0.mount_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a mount is added. *)

  method on_mount_changed :
    ?after:bool ->
    callback:(mount:App_info_cycle_64c425a0.mount_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a mount changes. *)

  method on_mount_pre_unmount :
    ?after:bool ->
    callback:(mount:App_info_cycle_64c425a0.mount_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** May be emitted when a mount is about to be removed.

      This signal depends on the backend and is only emitted if GIO was used to
      unmount. *)

  method on_mount_removed :
    ?after:bool ->
    callback:(mount:App_info_cycle_64c425a0.mount_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a mount is removed. *)

  method on_volume_added :
    ?after:bool ->
    callback:(volume:App_info_cycle_64c425a0.volume_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a mountable volume is added to the system. *)

  method on_volume_changed :
    ?after:bool ->
    callback:(volume:App_info_cycle_64c425a0.volume_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when mountable volume is changed. *)

  method on_volume_removed :
    ?after:bool ->
    callback:(volume:App_info_cycle_64c425a0.volume_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a mountable volume is removed from the system. *)

  method get_connected_drives : unit -> App_info_cycle_64c425a0.drive_t list
  (** Gets a list of drives connected to the system.

      The returned list should be freed with g_list_free(), after its elements
      have been unreffed with g_object_unref(). *)

  method get_mount_for_uuid : string -> App_info_cycle_64c425a0.mount_t option
  (** Finds a [GMount] object by its UUID (see g_mount_get_uuid()) *)

  method get_mounts : unit -> App_info_cycle_64c425a0.mount_t list
  (** Gets a list of the mounts on the system.

      The returned list should be freed with g_list_free(), after its elements
      have been unreffed with g_object_unref(). *)

  method get_volume_for_uuid : string -> App_info_cycle_64c425a0.volume_t option
  (** Finds a [GVolume] object by its UUID (see g_volume_get_uuid()) *)

  method get_volumes : unit -> App_info_cycle_64c425a0.volume_t list
  (** Gets a list of the volumes on the system.

      The returned list should be freed with g_list_free(), after its elements
      have been unreffed with g_object_unref(). *)

  method as_volume_monitor : Raw.Volume_monitor.t
end

class volume_monitor : Raw.Volume_monitor.t -> volume_monitor_t
(** Wraps a raw handle of {!Ocgio.Raw.Volume_monitor.t}. *)

(** {1:description Description}

    [GVolumeMonitor] is for listing the user interesting devices and volumes on
    the computer. In other words, what a file selector or file manager would
    show in a sidebar.

    [GVolumeMonitor] is not thread-default-context aware (see
    [GLib.MainContext.push_thread_default]), and so should not be used other
    than from the main thread, with no thread-default-context active.

    In order to receive updates about volumes and mounts monitored through GVFS,
    a main loop must be running. *)
