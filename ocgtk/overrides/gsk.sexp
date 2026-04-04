(overrides
  (library "Gsk")

  ;; Platform-specific renderers not present on all platforms
  (class BroadwayRenderer (ignore))
  (class NglRenderer (ignore))
)
