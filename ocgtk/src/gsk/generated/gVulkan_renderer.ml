class type vulkan_renderer_t = object
    method as_vulkan_renderer : Vulkan_renderer.t
end

(* High-level class for VulkanRenderer *)
class vulkan_renderer (obj : Vulkan_renderer.t) : vulkan_renderer_t = object (self)

    method as_vulkan_renderer = obj
end

