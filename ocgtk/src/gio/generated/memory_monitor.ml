(* GENERATED CODE - DO NOT EDIT *)
(* MemoryMonitor: MemoryMonitor *)

[@@@ocaml.text
"[GMemoryMonitor] will monitor system memory and suggest to the application\n\
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
 See [Gio.MemoryMonitorWarningLevel] for details on the various warning\n\
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

type t = [ `memory_monitor ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t
  = "ml_gio_memory_monitor_from_gobject"

(* Methods *)
let on_low_memory_warning ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let level =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gio_enums.memorymonitorwarninglevel_of_int
            (Gobject.Value.get_enum_int v)
        in
        callback ~level)
  in
  Gobject.Signal.connect obj ~name:"low-memory-warning" ~callback:closure
    ~after:(Option.value after ~default:false)
