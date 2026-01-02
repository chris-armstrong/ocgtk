(* Signal handlers for Display *)
class display_signals (obj : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Display.t) = object
  (** Emitted when the connection to the windowing system for @display is opened. *)
  method on_opened ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"opened" ~callback ~after:false

end
