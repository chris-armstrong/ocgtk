(* Signal handlers for Device *)
class device_signals (obj : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Device.t) = object
  (** Emitted either when the number of either axes or keys changes.

On X11 this will normally happen when the physical device
routing events through the logical device changes (for
example, user switches from the USB mouse to a tablet); in
that case the logical device will change to reflect the axes
and keys on the new physical device. *)
  method on_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"changed" ~callback ~after:false

end
