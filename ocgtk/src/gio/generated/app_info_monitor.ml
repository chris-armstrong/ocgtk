(* GENERATED CODE - DO NOT EDIT *)
(* AppInfoMonitor: AppInfoMonitor *)

type t = [ `app_info_monitor | `object_ ] Gobject.obj

(* Methods *)
let on_changed ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"changed" ~callback
    ~after:(Option.value after ~default:false)
