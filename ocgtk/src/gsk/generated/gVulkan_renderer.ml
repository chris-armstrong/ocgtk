class type vulkan_renderer_t = object
  inherit GRenderer.renderer_t
  method as_vulkan_renderer : Vulkan_renderer.t
end

(* High-level class for VulkanRenderer *)
class vulkan_renderer (obj : Vulkan_renderer.t) : vulkan_renderer_t =
  object (self)
    inherit GRenderer.renderer (obj :> Renderer.t)
    method as_vulkan_renderer = obj
  end

let new_ () : vulkan_renderer_t = new vulkan_renderer (Vulkan_renderer.new_ ())
