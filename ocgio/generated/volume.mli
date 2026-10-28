(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Volume from cyclic group App_info_cycle_64c425a0 *)

(** The [GVolume] interface represents user-visible objects that can be mounted.
    For example, a file system partition on a USB flash drive, or an optical
    disc inserted into a disc drive.

    If a [GVolume] is currently mounted, the corresponding [Gio.Mount] can be
    retrieved using [Gio.Volume.get_mount].

    Mounting a [GVolume] instance is an asynchronous operation. For more
    information about asynchronous operations, see [Gio.AsyncResult] and
    [Gio.Task]. To mount a [GVolume], first call [Gio.Volume.mount] with (at
    least) the [GVolume] instance, optionally a [Gio.MountOperation] object and
    a [Gio.AsyncReadyCallback].

    Typically, one will only want to pass [NULL] for the [Gio.MountOperation] if
    automounting all volumes when a desktop session starts since it’s not
    desirable to put up a lot of dialogs asking for credentials.

    The callback will be fired when the operation has resolved (either with
    success or failure), and a [Gio.AsyncResult] instance will be passed to the
    callback. That callback should then call [Gio.Volume.mount_finish] with the
    [GVolume] instance and the [Gio.AsyncResult] data to see if the operation
    was completed successfully. If a [GLib.Error] is present when
    [Gio.Volume.mount_finish] is called, then it will be filled with any error
    information.

    Note, when porting from GnomeVFS, [GVolume] is the moral equivalent of
    [GnomeVFSDrive].

    {b Volume Identifiers}

    It is sometimes necessary to directly access the underlying operating system
    object behind a volume (e.g. for passing a volume to an application via the
    command line). For this purpose, GIO allows to obtain an ‘identifier’ for
    the volume. There can be different kinds of identifiers, such as Hal UDIs,
    filesystem labels, traditional Unix devices (e.g. [/dev/sda2]), UUIDs. GIO
    uses predefined strings as names for the different kinds of identifiers:
    [G_VOLUME_IDENTIFIER_KIND_UUID], [G_VOLUME_IDENTIFIER_KIND_LABEL], etc. Use
    [Gio.Volume.get_identifier] to obtain an identifier for a volume.

    Note that [G_VOLUME_IDENTIFIER_KIND_HAL_UDI] will only be available when the
    GVFS hal volume monitor is in use. Other volume monitors will generally be
    able to provide the [G_VOLUME_IDENTIFIER_KIND_UNIX_DEVICE] identifier, which
    can be used to obtain a hal device by means of
    [libhal_manager_find_device_string_match()].

    Its methods, signals and properties are on {!class-type-volume_t}. The
    functions it is built on are in {!Ocgio.Raw.Volume}. *)

class type volume_t = App_info_cycle_64c425a0.volume_t
(** {b The methods, signals and properties of a [Volume].}

    The [GVolume] interface represents user-visible objects that can be mounted.
    For example, a file system partition on a USB flash drive, or an optical
    disc inserted into a disc drive.

    If a [GVolume] is currently mounted, the corresponding [Gio.Mount] can be
    retrieved using [Gio.Volume.get_mount].

    Mounting a [GVolume] instance is an asynchronous operation. For more
    information about asynchronous operations, see [Gio.AsyncResult] and
    [Gio.Task]. To mount a [GVolume], first call [Gio.Volume.mount] with (at
    least) the [GVolume] instance, optionally a [Gio.MountOperation] object and
    a [Gio.AsyncReadyCallback].

    Typically, one will only want to pass [NULL] for the [Gio.MountOperation] if
    automounting all volumes when a desktop session starts since it’s not
    desirable to put up a lot of dialogs asking for credentials.

    The callback will be fired when the operation has resolved (either with
    success or failure), and a [Gio.AsyncResult] instance will be passed to the
    callback. That callback should then call [Gio.Volume.mount_finish] with the
    [GVolume] instance and the [Gio.AsyncResult] data to see if the operation
    was completed successfully. If a [GLib.Error] is present when
    [Gio.Volume.mount_finish] is called, then it will be filled with any error
    information.

    Note, when porting from GnomeVFS, [GVolume] is the moral equivalent of
    [GnomeVFSDrive].

    {b Volume Identifiers}

    It is sometimes necessary to directly access the underlying operating system
    object behind a volume (e.g. for passing a volume to an application via the
    command line). For this purpose, GIO allows to obtain an ‘identifier’ for
    the volume. There can be different kinds of identifiers, such as Hal UDIs,
    filesystem labels, traditional Unix devices (e.g. [/dev/sda2]), UUIDs. GIO
    uses predefined strings as names for the different kinds of identifiers:
    [G_VOLUME_IDENTIFIER_KIND_UUID], [G_VOLUME_IDENTIFIER_KIND_LABEL], etc. Use
    [Gio.Volume.get_identifier] to obtain an identifier for a volume.

    Note that [G_VOLUME_IDENTIFIER_KIND_HAL_UDI] will only be available when the
    GVFS hal volume monitor is in use. Other volume monitors will generally be
    able to provide the [G_VOLUME_IDENTIFIER_KIND_UNIX_DEVICE] identifier, which
    can be used to obtain a hal device by means of
    [libhal_manager_find_device_string_match()]. *)

class volume : Raw.Volume.t -> volume_t
(** Wraps a raw handle of {!Ocgio.Raw.Volume.t}. *)
