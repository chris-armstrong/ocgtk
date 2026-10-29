(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Mount from cyclic group App_info_cycle_64c425a0 *)

(** The [GMount] interface represents a user-visible mount, such as a mounted
    file system.

    Its methods, signals and properties are on {!class-type-mount_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Mount}. *)

(** {1:class Class} *)

class type mount_t = App_info_cycle_64c425a0.mount_t
(** {b The methods, signals and properties of a [Mount].}

    The [GMount] interface represents a user-visible mount, such as a mounted
    file system.

    [GMount] is a ‘mounted’ filesystem that you can access. Mounted is in quotes
    because it’s not the same as a UNIX mount, it might be a GVFS mount, but you
    can still access the files on it if you use GIO.

    A [GMount] might be associated with a
    {{!Ocgio.Volume.class-type-volume_t}[Gio.Volume]} (such as a USB flash
    drive) which hosts it.

    Unmounting a [GMount] instance is an asynchronous operation. For more
    information about asynchronous operations, see
    {{!Ocgio.Async_result.class-type-async_result_t}[Gio.AsyncResult]} and
    {{!Ocgio.Task.class-type-task_t}[Gio.Task]}. To unmount a [GMount] instance,
    first call [Gio.Mount.unmount_with_operation] with (at least) the [GMount]
    instance and a [Gio.AsyncReadyCallback]. The callback will be fired when the
    operation has resolved (either with success or failure), and a
    {{!Ocgio.Async_result.class-type-async_result_t}[Gio.AsyncResult]} structure
    will be passed to the callback. That callback should then call
    [Gio.Mount.unmount_with_operation_finish] with the [GMount] and the
    {{!Ocgio.Async_result.class-type-async_result_t}[Gio.AsyncResult]} data to
    see if the operation was completed successfully. If an [error] is present
    when [Gio.Mount.unmount_with_operation_finish] is called, then it will be
    filled with any error information.

    Note, when porting from GnomeVFS, [GMount] is the moral equivalent of
    [GnomeVFSVolume]. *)

class mount : Raw.Mount.t -> mount_t
(** Wraps a raw handle of {!Ocgio.Raw.Mount.t}. *)

(** {1:description Description}

    The [GMount] interface represents a user-visible mount, such as a mounted
    file system.

    [GMount] is a ‘mounted’ filesystem that you can access. Mounted is in quotes
    because it’s not the same as a UNIX mount, it might be a GVFS mount, but you
    can still access the files on it if you use GIO.

    A [GMount] might be associated with a
    {{!Ocgio.Volume.class-type-volume_t}[Gio.Volume]} (such as a USB flash
    drive) which hosts it.

    Unmounting a [GMount] instance is an asynchronous operation. For more
    information about asynchronous operations, see
    {{!Ocgio.Async_result.class-type-async_result_t}[Gio.AsyncResult]} and
    {{!Ocgio.Task.class-type-task_t}[Gio.Task]}. To unmount a [GMount] instance,
    first call [Gio.Mount.unmount_with_operation] with (at least) the [GMount]
    instance and a [Gio.AsyncReadyCallback]. The callback will be fired when the
    operation has resolved (either with success or failure), and a
    {{!Ocgio.Async_result.class-type-async_result_t}[Gio.AsyncResult]} structure
    will be passed to the callback. That callback should then call
    [Gio.Mount.unmount_with_operation_finish] with the [GMount] and the
    {{!Ocgio.Async_result.class-type-async_result_t}[Gio.AsyncResult]} data to
    see if the operation was completed successfully. If an [error] is present
    when [Gio.Mount.unmount_with_operation_finish] is called, then it will be
    filled with any error information.

    Note, when porting from GnomeVFS, [GMount] is the moral equivalent of
    [GnomeVFSVolume]. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
