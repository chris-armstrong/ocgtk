(overrides
  (library "GdkPixbuf")

  ;; Internal types not in public GdkPixbuf headers — their C types are
  ;; not declared in gdk-pixbuf.h, causing gdkpixbuf_decls.h to fail
  (class PixbufNonAnim (ignore))
  (record PixbufModule (ignore))
  (record PixbufModulePattern (ignore))

  ;; GdkPixbufFormat is an incomplete typedef in public headers (the struct body
  ;; is private even though GIR lists its fields). All field access must go
  ;; through the gdk_pixbuf_format_* library functions.
  (record PixbufFormat (no_fields))

  (enumeration InterpType
    (member hyper (version "2.38"))
  )

  (bitfield PixbufFormatFlags
    (member threadsafe (version "2.28"))
  )
)
