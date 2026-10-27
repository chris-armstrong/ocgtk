(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Mount from cyclic group App_info_cycle_64c425a0 *)

(** The [GMount] interface represents a user-visible mount, such as a mounted
    file system.

    [GMount] is a ‘mounted’ filesystem that you can access. Mounted is in quotes
    because it’s not the same as a UNIX mount, it might be a GVFS mount, but you
    can still access the files on it if you use GIO.

    A [GMount] might be associated with a [Gio.Volume] (such as a USB flash
    drive) which hosts it.

    Unmounting a [GMount] instance is an asynchronous operation. For more
    information about asynchronous operations, see [Gio.AsyncResult] and
    [Gio.Task]. To unmount a [GMount] instance, first call
    [Gio.Mount.unmount_with_operation] with (at least) the [GMount] instance and
    a [Gio.AsyncReadyCallback]. The callback will be fired when the operation
    has resolved (either with success or failure), and a [Gio.AsyncResult]
    structure will be passed to the callback. That callback should then call
    [Gio.Mount.unmount_with_operation_finish] with the [GMount] and the
    [Gio.AsyncResult] data to see if the operation was completed successfully.
    If an [error] is present when [Gio.Mount.unmount_with_operation_finish] is
    called, then it will be filled with any error information.

    Note, when porting from GnomeVFS, [GMount] is the moral equivalent of
    [GnomeVFSVolume].

    Its methods, signals and properties are on {!class-type-mount_t}. The
    functions it is built on are in {!Ocgio.Raw.Mount}. *)

class type mount_t = App_info_cycle_64c425a0.mount_t
(** The methods, signals and properties of a [GMount]. *)

class mount : Raw.Mount.t -> mount_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Mount.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GMount], give one already wrapped. *)
