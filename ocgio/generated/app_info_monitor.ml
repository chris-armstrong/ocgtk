class type app_info_monitor_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Signal emitted when the app info database changes, when applications are
      installed or removed. *)

  method as_app_info_monitor : Raw.App_info_monitor.t
end

(* High-level class for AppInfoMonitor *)
class app_info_monitor (obj : Raw.App_info_monitor.t) : app_info_monitor_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.App_info_monitor.on_changed ~after self#as_app_info_monitor ~callback

    method as_app_info_monitor = obj
  end
