(overrides
  (library "Gdk")
  (bitfield ToplevelState
     (member suspended (version "4.12"))
     )
  ; GDK AppLaunchContext.get_display conflicts with the inherited
  ; Gio.AppLaunchContext.get_display(app_info, files) -> string virtual method.
  ; GDK's version returns GdkDisplay* with an incompatible signature.
  ; The display is still accessible via the generated property accessor.
  (class AppLaunchContext
     (method get_display (ignore))
  )
)
