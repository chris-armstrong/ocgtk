(* Signal handlers for Monitor *)
class monitor_signals (obj : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Monitor.t) = object
  (** Emitted when the output represented by @monitor gets disconnected. *)
  method on_invalidate ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"invalidate" ~callback ~after:false

end
