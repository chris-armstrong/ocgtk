class type vulkan_renderer_t = object
    method as_vulkan_renderer : Vulkan_renderer.t
end

class vulkan_renderer : Vulkan_renderer.t -> vulkan_renderer_t

