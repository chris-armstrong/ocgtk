(overrides
  (library "cairo")

  ;; The GIR is hand-written and carries no versions, but the GType
  ;; functions for these two records (cairo_gobject_glyph_get_type,
  ;; cairo_gobject_text_cluster_get_type) first appear in cairo 1.18.0.
  (record Glyph (version "1.18"))
  (record TextCluster (version "1.18"))
)
