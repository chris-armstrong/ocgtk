(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for FileMonitor from cyclic group App_info_cycle_64c425a0 *)

(** Monitors a file or directory for changes.

    Its methods, signals and properties are on {!class-type-file_monitor_t}. Its
    full description is under {!section-description}. The functions it is built
    on are in {!Ocgio.Raw.File_monitor}. *)

(** {1:class Class} *)

class type file_monitor_t = App_info_cycle_64c425a0.file_monitor_t
(** {b The methods, signals and properties of a [FileMonitor].}

    Inherits from: [GObject.Object]

    Monitors a file or directory for changes.

    To obtain a [GFileMonitor] for a file or directory, use [Gio.File.monitor],
    [Gio.File.monitor_file], or [Gio.File.monitor_directory].

    To get informed about changes to the file or directory you are monitoring,
    connect to the [Gio.FileMonitor::changed] signal. The signal will be emitted
    in the thread-default main context (see
    [GLib.MainContext.push_thread_default]) of the thread that the monitor was
    created in (though if the global default main context is blocked, this may
    cause notifications to be blocked even if the thread-default context is
    still running). *)

class file_monitor : Raw.File_monitor.t -> file_monitor_t
(** Wraps a raw handle of {!Ocgio.Raw.File_monitor.t}. *)

(** {1:description Description}

    Monitors a file or directory for changes.

    To obtain a [GFileMonitor] for a file or directory, use [Gio.File.monitor],
    [Gio.File.monitor_file], or [Gio.File.monitor_directory].

    To get informed about changes to the file or directory you are monitoring,
    connect to the [Gio.FileMonitor::changed] signal. The signal will be emitted
    in the thread-default main context (see
    [GLib.MainContext.push_thread_default]) of the thread that the monitor was
    created in (though if the global default main context is blocked, this may
    cause notifications to be blocked even if the thread-default context is
    still running). *)
