(** [GMemoryMonitor] will monitor system memory and suggest to the application
    when to free memory so as to leave more room for other applications. It is
    implemented on Linux using the
    {{:https://gitlab.freedesktop.org/hadess/low-memory-monitor/}Low Memory
     Monitor}
    ({{:https://hadess.pages.freedesktop.org/low-memory-monitor/}API
      documentation}).

    Its methods, signals and properties are on {!class-type-memory_monitor_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Memory_monitor}. *)

(** {1:class Class} *)

class type memory_monitor_t = object
  (** {2:signals Signals} *)

  method on_low_memory_warning :
    ?after:bool ->
    callback:(level:Enums.memorymonitorwarninglevel -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the system is running low on free memory.

      The signal handler should then take the appropriate action depending on
      the warning level. See the [GMemoryMonitorWarningLevel] documentation for
      details.

      Since the [Gio.MemoryMonitor] is a singleton, this signal will be emitted
      in the [GLib.MainContext.default]\[global-default main context\]. *)

  (** {2:conversions Conversions} *)

  method as_memory_monitor : Raw.Memory_monitor.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [MemoryMonitor].}\n\n\
     Requires:\n\
     - {{!Ocgio.Initable.class-type-initable_t}Ocgio.Initable}\n\n\
     [GMemoryMonitor] will monitor system memory and suggest to the application\n\
     when to free memory so as to leave more room for other applications.\n\
     It is implemented on Linux using the\n\
     {{:https://gitlab.freedesktop.org/hadess/low-memory-monitor/}Low Memory \
     Monitor}\n\
     ({{:https://hadess.pages.freedesktop.org/low-memory-monitor/}API \
     documentation}).\n\n\
     There is also an implementation for use inside Flatpak sandboxes.\n\n\
     Possible actions to take when the signal is received are:\n\n\
     - Free caches\n\
     - Save files that haven’t been looked at in a while to disk, ready to be \
     reopened when needed\n\
     - Run a garbage collection cycle\n\
     - Try and compress fragmented allocations\n\
     - Exit on idle if the process has no reason to stay around\n\
     - Call [malloc_trim(3)]) to return cached heap pages to\n\
     the kernel (if supported by your libc)\n\n\
     Note that some actions may not always improve system performance, and so\n\
     should be profiled for your application. [malloc_trim()], for example, may\n\
     make future heap allocations slower (due to releasing cached heap pages \
     back\n\
     to the kernel).\n\n\
     See \
     {{!Ocgio.Enums.type-memorymonitorwarninglevel}[Gio.MemoryMonitorWarningLevel]} \
     for details on the various warning\n\
     levels.\n\n\
     {[\n\
     static void\n\
     warning_cb (GMemoryMonitor *m, GMemoryMonitorWarningLevel level)\n\
     {\n\
    \  g_debug (\"Warning level: %d\", level);\n\
    \  if (warning_level > G_MEMORY_MONITOR_WARNING_LEVEL_LOW)\n\
    \    drop_caches ();\n\
     }\n\n\
     static GMemoryMonitor *\n\
     monitor_low_memory (void)\n\
     {\n\
    \  GMemoryMonitor *m;\n\
    \  m = g_memory_monitor_dup_default ();\n\
    \  g_signal_connect (G_OBJECT (m), \"low-memory-warning\",\n\
    \                    G_CALLBACK (warning_cb), NULL);\n\
    \  return m;\n\
     }\n\
     ]}\n\n\
     Don’t forget to disconnect the [Gio.MemoryMonitor::low-memory-warning]\n\
     signal, and unref the [GMemoryMonitor] itself when exiting."]

class memory_monitor : Raw.Memory_monitor.t -> memory_monitor_t
(** Wraps a raw handle of {!Ocgio.Raw.Memory_monitor.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 [GMemoryMonitor] will monitor system memory and suggest to the application\n\
 when to free memory so as to leave more room for other applications.\n\
 It is implemented on Linux using the\n\
 {{:https://gitlab.freedesktop.org/hadess/low-memory-monitor/}Low Memory \
 Monitor}\n\
 ({{:https://hadess.pages.freedesktop.org/low-memory-monitor/}API \
 documentation}).\n\n\
 There is also an implementation for use inside Flatpak sandboxes.\n\n\
 Possible actions to take when the signal is received are:\n\n\
 - Free caches\n\
 - Save files that haven’t been looked at in a while to disk, ready to be \
 reopened when needed\n\
 - Run a garbage collection cycle\n\
 - Try and compress fragmented allocations\n\
 - Exit on idle if the process has no reason to stay around\n\
 - Call [malloc_trim(3)]) to return cached heap pages to\n\
 the kernel (if supported by your libc)\n\n\
 Note that some actions may not always improve system performance, and so\n\
 should be profiled for your application. [malloc_trim()], for example, may\n\
 make future heap allocations slower (due to releasing cached heap pages back\n\
 to the kernel).\n\n\
 See \
 {{!Ocgio.Enums.type-memorymonitorwarninglevel}[Gio.MemoryMonitorWarningLevel]} \
 for details on the various warning\n\
 levels.\n\n\
 {[\n\
 static void\n\
 warning_cb (GMemoryMonitor *m, GMemoryMonitorWarningLevel level)\n\
 {\n\
\  g_debug (\"Warning level: %d\", level);\n\
\  if (warning_level > G_MEMORY_MONITOR_WARNING_LEVEL_LOW)\n\
\    drop_caches ();\n\
 }\n\n\
 static GMemoryMonitor *\n\
 monitor_low_memory (void)\n\
 {\n\
\  GMemoryMonitor *m;\n\
\  m = g_memory_monitor_dup_default ();\n\
\  g_signal_connect (G_OBJECT (m), \"low-memory-warning\",\n\
\                    G_CALLBACK (warning_cb), NULL);\n\
\  return m;\n\
 }\n\
 ]}\n\n\
 Don’t forget to disconnect the [Gio.MemoryMonitor::low-memory-warning]\n\
 signal, and unref the [GMemoryMonitor] itself when exiting."]

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
