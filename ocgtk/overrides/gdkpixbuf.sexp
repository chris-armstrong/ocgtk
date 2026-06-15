(overrides
  (library "GdkPixbuf")

  ;; Internal types not in public GdkPixbuf headers — their C types are
  ;; not declared in gdk-pixbuf.h, causing gdkpixbuf_decls.h to fail
  (class PixbufNonAnim (ignore))
  (record PixbufModule (ignore))
  (record PixbufModulePattern (ignore))

  ;; GdkPixbufFormat is an incomplete typedef in public headers (struct body is
  ;; private). The fields with no corresponding get_*/set_* methods cannot be
  ;; accessed directly; only the library functions work.
  (record PixbufFormat
    (field signature (ignore))
    (field domain (ignore))
    (field flags (ignore))
  )

  (enumeration InterpType
    (member hyper (version "2.38"))
  )

  (bitfield PixbufFormatFlags
    (member threadsafe (version "2.28"))
  )
)
