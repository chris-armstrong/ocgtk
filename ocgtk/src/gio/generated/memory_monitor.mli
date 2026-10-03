(* GENERATED CODE - DO NOT EDIT *)
(* MemoryMonitor: MemoryMonitor *)

(** [GMemoryMonitor] will monitor system memory and suggest to the application
    when to free memory so as to leave more room for other applications. It is
    implemented on Linux using the
    {{:https://gitlab.freedesktop.org/hadess/low-memory-monitor/}Low Memory
     Monitor}
    ({{:https://hadess.pages.freedesktop.org/low-memory-monitor/}API
      documentation}).

    There is also an implementation for use inside Flatpak sandboxes.

    Possible actions to take when the signal is received are:

    - Free caches
    - Save files that haven’t been looked at in a while to disk, ready to be
      reopened when needed
    - Run a garbage collection cycle
    - Try and compress fragmented allocations
    - Exit on idle if the process has no reason to stay around
    - Call [malloc_trim(3)]) to return cached heap pages to the kernel (if
      supported by your libc)

    Note that some actions may not always improve system performance, and so
    should be profiled for your application. [malloc_trim()], for example, may
    make future heap allocations slower (due to releasing cached heap pages back
    to the kernel).

    See [Gio.MemoryMonitorWarningLevel] for details on the various warning
    levels.

    {[
    static void
    warning_cb (GMemoryMonitor *m, GMemoryMonitorWarningLevel level)
    {
      g_debug (“Warning level: %d”, level);
      if (warning_level > G_MEMORY_MONITOR_WARNING_LEVEL_LOW)
        drop_caches ();
    }

    static GMemoryMonitor *
    monitor_low_memory (void)
    {
      GMemoryMonitor *m;
      m = g_memory_monitor_dup_default ();
      g_signal_connect (G_OBJECT (m), “low-memory-warning”,
                        G_CALLBACK (warning_cb), NULL);
      return m;
    }
    ]}

    Don’t forget to disconnect the [Gio.MemoryMonitor::low-memory-warning]
    signal, and unref the [GMemoryMonitor] itself when exiting. *)

type t = [ `memory_monitor ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t
  = "ml_gio_memory_monitor_from_gobject"

(* Methods *)
val on_low_memory_warning :
  ?after:bool ->
  t ->
  callback:(level:Gio_enums.memorymonitorwarninglevel -> unit) ->
  Gobject.Signal.handler_id
