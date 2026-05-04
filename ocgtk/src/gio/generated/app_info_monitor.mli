(* GENERATED CODE - DO NOT EDIT *)
(* AppInfoMonitor: AppInfoMonitor *)

type t = [ `app_info_monitor | `object_ ] Gobject.obj

(* Methods *)
val on_changed :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
