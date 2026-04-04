(overrides
  (library "Gsk")

  ;; Platform-specific renderers — GskBroadwayRenderer/GskNglRenderer are not
  ;; in public GSK headers on standard installs
  (class BroadwayRenderer (ignore))
  (class NglRenderer (ignore))
)
