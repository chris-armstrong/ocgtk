(overrides
  (library "GdkPixbuf")

  ;; Internal types not in public GdkPixbuf headers — their C types are
  ;; not declared in gdk-pixbuf.h, causing gdkpixbuf_decls.h to fail
  (class PixbufNonAnim (ignore))
  (record PixbufModule (ignore))
  (record PixbufModulePattern (ignore))

  (enumeration InterpType
    (member hyper (version "2.38"))
  )

  (bitfield PixbufFormatFlags
    (member threadsafe (version "2.28"))
  )
)
