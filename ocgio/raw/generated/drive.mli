(* GENERATED CODE - DO NOT EDIT *)
(* Drive, a member of the cyclic module App_info_cycle_64c425a0 *)

(** [GDrive] represents a piece of hardware connected to the machine. It’s
    generally only created for removable hardware or hardware with removable
    media. For example, an optical disc drive, or a USB flash drive.

    [GDrive] is a container class for {{!Ocgio.Raw.Volume}[Gio.Volume]} objects
    that stem from the same piece of media. As such, [GDrive] abstracts a drive
    with (or without) removable media and provides operations for querying
    whether media is available, determining whether media change is
    automatically detected and ejecting the media.

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
    {{!Ocgio.Raw.Drive.val-get_start_stop_type}[Gio.Drive.get_start_stop_type]}.

    For porting from GnomeVFS note that there is no equivalent of [GDrive] in
    that API.

    The class built on this module is in {!Ocgio.Drive}. *)

include module type of struct
  include App_info_cycle_64c425a0.Drive
end
