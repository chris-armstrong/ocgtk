(overrides
  (library "GdkPixbuf")

  ;; Internal types not in public headers
  (class PixbufNonAnim (ignore))
  (record PixbufModule (ignore))
  (record PixbufModulePattern (ignore))

  (enumeration InterpType
    (hyper (version "2.38"))
  )

  (bitfield PixbufFormatFlags
    (threadsafe (version "2.28"))
  )
)
