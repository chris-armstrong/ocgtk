(* GENERATED CODE - DO NOT EDIT *)
(* AppInfoMonitor: AppInfoMonitor *)

(** [GAppInfoMonitor] monitors application information for changes.

    [GAppInfoMonitor] is a very simple object used for monitoring the app info
    database for changes (newly installed or removed applications).

    Call [Gio.AppInfoMonitor.get] to get a [GAppInfoMonitor] and connect to the
    [Gio.AppInfoMonitor::changed] signal. The signal will be emitted once when
    the app info database changes, and will not be emitted again until after the
    next call to [Gio.AppInfo.get_all] or another [g_app_info_*()] function.
    This is because monitoring the app info database for changes is expensive.

    The following functions will re-arm the [Gio.AppInfoMonitor::changed] signal
    so it can be emitted again:

    - [Gio.AppInfo.get_all]
    - [Gio.AppInfo.get_all_for_type]
    - [Gio.AppInfo.get_default_for_type]
    - [Gio.AppInfo.get_fallback_for_type]
    - [Gio.AppInfo.get_recommended_for_type]
    - [g_desktop_app_info_get_implementations()]
    - [g_desktop_app_info_new()]
    - [g_desktop_app_info_new_from_filename()]
    - [g_desktop_app_info_new_from_keyfile()]
    - [g_desktop_app_info_search()]

    The latter functions are available if using [GDesktopAppInfo] from
    [gio-unix-2.0.pc] (GIR namespace [GioUnix-2.0]).

    In the usual case, applications should try to make note of the change (doing
    things like invalidating caches) but not act on it. In particular,
    applications should avoid making calls to [GAppInfo] APIs in response to the
    change signal, deferring these until the time that the updated data is
    actually required. The exception to this case is when application
    information is actually being displayed on the screen (for example, during a
    search or when the list of all applications is shown). The reason for this
    is that changes to the list of installed applications often come in groups
    (like during system updates) and rescanning the list on every change is
    pointless and expensive. *)

type t = [ `app_info_monitor | `object_ ] Gobject.obj

(* Methods *)
let on_changed ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"changed" ~callback
    ~after:(Option.value after ~default:false)
