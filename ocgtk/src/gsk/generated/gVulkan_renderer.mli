class type vulkan_renderer_t = object
    inherit GRenderer.renderer_t
    method as_vulkan_renderer : Vulkan_renderer.t
end

class vulkan_renderer : Vulkan_renderer.t -> vulkan_renderer_t

val new_ : unit -> vulkan_renderer_t
