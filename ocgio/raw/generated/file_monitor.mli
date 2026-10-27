(* GENERATED CODE - DO NOT EDIT *)
(* FileMonitor, a member of the cyclic module App_info_cycle_64c425a0 *)

(** Monitors a file or directory for changes.

    To obtain a [GFileMonitor] for a file or directory, use [Gio.File.monitor],
    [Gio.File.monitor_file], or [Gio.File.monitor_directory].

    To get informed about changes to the file or directory you are monitoring,
    connect to the [Gio.FileMonitor::changed] signal. The signal will be emitted
    in the thread-default main context (see
    [GLib.MainContext.push_thread_default]) of the thread that the monitor was
    created in (though if the global default main context is blocked, this may
    cause notifications to be blocked even if the thread-default context is
    still running).

    The class built on this module is in {!Ocgio.File_monitor}. *)

include module type of struct
  include App_info_cycle_64c425a0.File_monitor
end
