(* Signal handlers for Monitor *)
class monitor_signals (obj : App_launch_context_cycle_de440b34.Monitor.t) =
  object
    method on_invalidate ~callback =
      Gobject.Signal.connect_simple obj ~name:"invalidate" ~callback
        ~after:false
    (** Emitted when the output represented by @monitor gets disconnected. *)
  end
