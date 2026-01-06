(* Signal handlers for VulkanContext *)
class vulkan_context_signals (obj : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Vulkan_context.t) = object
  (** Emitted when the images managed by this context have changed.

Usually this means that the swapchain had to be recreated,
for example in response to a change of the surface size. *)
  method on_images_updated ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"images-updated" ~callback ~after:false

end
