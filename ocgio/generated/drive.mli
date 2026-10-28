(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Drive from cyclic group App_info_cycle_64c425a0 *)

(** [GDrive] represents a piece of hardware connected to the machine. It’s
    generally only created for removable hardware or hardware with removable
    media. For example, an optical disc drive, or a USB flash drive.

    Its methods, signals and properties are on {!class-type-drive_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Drive}. *)

(** {1:class Class} *)

class type drive_t = App_info_cycle_64c425a0.drive_t
(** {b The methods, signals and properties of a [Drive].}

    [GDrive] represents a piece of hardware connected to the machine. It’s
    generally only created for removable hardware or hardware with removable
    media. For example, an optical disc drive, or a USB flash drive.

    [GDrive] is a container class for [Gio.Volume] objects that stem from the
    same piece of media. As such, [GDrive] abstracts a drive with (or without)
    removable media and provides operations for querying whether media is
    available, determining whether media change is automatically detected and
    ejecting the media.

    If the [GDrive] reports that media isn’t automatically detected, one can
    poll for media; typically one should not do this periodically as a poll for
    media operation is potentially expensive and may spin up the drive creating
    noise.

    [GDrive] supports starting and stopping drives with authentication support
    for the former. This can be used to support a diverse set of use cases
    including connecting/disconnecting iSCSI devices, powering down external
    disk enclosures and starting/stopping multi-disk devices such as RAID
    devices. Note that the actual semantics and side-effects of
    starting/stopping a [GDrive] may vary according to implementation. To choose
    the correct verbs in e.g. a file manager, use
    [Gio.Drive.get_start_stop_type].

    For porting from GnomeVFS note that there is no equivalent of [GDrive] in
    that API. *)

class drive : Raw.Drive.t -> drive_t
(** Wraps a raw handle of {!Ocgio.Raw.Drive.t}. *)

(** {1:description Description}

    [GDrive] represents a piece of hardware connected to the machine. It’s
    generally only created for removable hardware or hardware with removable
    media. For example, an optical disc drive, or a USB flash drive.

    [GDrive] is a container class for [Gio.Volume] objects that stem from the
    same piece of media. As such, [GDrive] abstracts a drive with (or without)
    removable media and provides operations for querying whether media is
    available, determining whether media change is automatically detected and
    ejecting the media.

    If the [GDrive] reports that media isn’t automatically detected, one can
    poll for media; typically one should not do this periodically as a poll for
    media operation is potentially expensive and may spin up the drive creating
    noise.

    [GDrive] supports starting and stopping drives with authentication support
    for the former. This can be used to support a diverse set of use cases
    including connecting/disconnecting iSCSI devices, powering down external
    disk enclosures and starting/stopping multi-disk devices such as RAID
    devices. Note that the actual semantics and side-effects of
    starting/stopping a [GDrive] may vary according to implementation. To choose
    the correct verbs in e.g. a file manager, use
    [Gio.Drive.get_start_stop_type].

    For porting from GnomeVFS note that there is no equivalent of [GDrive] in
    that API. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
