(overrides
  (library "Gsk")

  ;; Platform-specific renderers — only available when built with the
  ;; corresponding backend (GL, Vulkan, Broadway). Not present in public
  ;; GSK headers on all platforms/distros (e.g. absent on Debian 12).
  (class BroadwayRenderer (ignore))
  (class NglRenderer (ignore))
  (class GLRenderer (ignore))
  (class VulkanRenderer (ignore))
)
