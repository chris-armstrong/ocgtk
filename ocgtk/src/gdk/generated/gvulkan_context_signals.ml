(* Signal handlers for VulkanContext *)
class vulkan_context_signals
  (obj : App_launch_context_cycle_de440b34.Vulkan_context.t) =
  object
    method on_images_updated ~callback =
      Gobject.Signal.connect_simple obj ~name:"images-updated" ~callback
        ~after:false
    (** Emitted when the images managed by this context have changed.

        Usually this means that the swapchain had to be recreated, for example
        in response to a change of the surface size. *)
  end
