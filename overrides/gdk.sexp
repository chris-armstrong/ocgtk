(overrides
  (library "Gdk")
  (bitfield ToplevelState
     (member suspended (version "4.12"))
     )
  ;; GIR doesn't tag pad_dial with a `version` attribute even though it
  ;; postdates the enum's baseline (confirmed via GTK gitlab source history:
  ;; landed in gdk/gdkevents.h in the 4.20.0 cycle, in lockstep with Gtk).
  (enumeration EventType
     (member pad_dial (version "4.20"))
     )
  ; GDK AppLaunchContext.get_display conflicts with the inherited
  ; Gio.AppLaunchContext.get_display(app_info, files) -> string virtual method.
  ; GDK's version returns GdkDisplay* with an incompatible signature.
  ; The display is still accessible via the generated property accessor.
  (class AppLaunchContext
     (method get_display (ignore))
  )
)
