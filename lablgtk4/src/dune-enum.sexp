; Enum generation rules for all GTK4 subsystems
;
; Pattern for each enum module:
; 1. Run varcc to generate: {name}_tags_raw.{h,c} and {Name}Enums.ml
; 2. Copy raw .h to final .h
; 3. Create final .c by prepending #includes

; === GTK4 enums ===
(rule
 (targets gtk4_tags_raw.h gtk4_tags_raw.c Gtk4Enums.ml)
 (deps %{project_root}/src/tools/varcc.exe)
 (action (run %{project_root}/src/tools/varcc.exe -h gtk4_tags_raw.h -c gtk4_tags_raw.c %{dep:gtk4_tags.var})))

(rule
 (target gtk4_tags.h)
 (deps gtk4_tags_raw.h)
 (action (copy gtk4_tags_raw.h gtk4_tags.h)))

(rule
 (target gtk4_tags.c)
 (deps gtk4_tags_raw.c wrappers.h gtk4_tags.h)
 (action (bash "echo '#include \"wrappers.h\"' > gtk4_tags.c && echo '#include \"gtk4_tags.h\"' >> gtk4_tags.c && cat gtk4_tags_raw.c >> gtk4_tags.c")))

; === GDK4 enums ===
(rule
 (targets gdk4_tags_raw.h gdk4_tags_raw.c Gdk4Enums.ml)
 (deps %{project_root}/src/tools/varcc.exe)
 (action (run %{project_root}/src/tools/varcc.exe -h gdk4_tags_raw.h -c gdk4_tags_raw.c %{dep:gdk4_tags.var})))

(rule
 (target gdk4_tags.h)
 (deps gdk4_tags_raw.h)
 (action (copy gdk4_tags_raw.h gdk4_tags.h)))

(rule
 (target gdk4_tags.c)
 (deps gdk4_tags_raw.c wrappers.h gdk4_tags.h)
 (action (bash "echo '#include \"wrappers.h\"' > gdk4_tags.c && echo '#include \"gdk4_tags.h\"' >> gdk4_tags.c && cat gdk4_tags_raw.c >> gdk4_tags.c")))

; === GLib enums ===
(rule
 (targets glib_tags_raw.h glib_tags_raw.c GlibEnums.ml)
 (deps %{project_root}/src/tools/varcc.exe)
 (action (run %{project_root}/src/tools/varcc.exe -h glib_tags_raw.h -c glib_tags_raw.c %{dep:glib_tags.var})))

(rule
 (target glib_tags.h)
 (deps glib_tags_raw.h)
 (action (copy glib_tags_raw.h glib_tags.h)))

(rule
 (target glib_tags.c)
 (deps glib_tags_raw.c wrappers.h glib_tags.h)
 (action (bash "echo '#include \"wrappers.h\"' > glib_tags.c && echo '#include \"glib_tags.h\"' >> glib_tags.c && echo '#include <locale.h>' >> glib_tags.c && cat glib_tags_raw.c >> glib_tags.c")))

; === Pango enums ===
(rule
 (targets pango_tags_raw.h pango_tags_raw.c pangoEnums.ml)
 (deps %{project_root}/src/tools/varcc.exe)
 (action (run %{project_root}/src/tools/varcc.exe -h pango_tags_raw.h -c pango_tags_raw.c %{dep:pango_tags.var})))

(rule
 (target pango_tags.h)
 (deps pango_tags_raw.h)
 (action (copy pango_tags_raw.h pango_tags.h)))

(rule
 (target pango_tags.c)
 (deps pango_tags_raw.c wrappers.h pango_tags.h)
 (action (bash "echo '#include \"wrappers.h\"' > pango_tags.c && echo '#include \"pango_tags.h\"' >> pango_tags.c && cat pango_tags_raw.c >> pango_tags.c")))

; === GObject enums ===
(rule
 (targets gobject_tags_raw.h gobject_tags_raw.c GobjectEnums.ml)
 (deps %{project_root}/src/tools/varcc.exe)
 (action (run %{project_root}/src/tools/varcc.exe -h gobject_tags_raw.h -c gobject_tags_raw.c %{dep:gobject_tags.var})))

(rule
 (target gobject_tags.h)
 (deps gobject_tags_raw.h)
 (action (copy gobject_tags_raw.h gobject_tags.h)))

(rule
 (target gobject_tags.c)
 (deps gobject_tags_raw.c wrappers.h gobject_tags.h)
 (action (bash "echo '#include \"wrappers.h\"' > gobject_tags.c && echo '#include \"gobject_tags.h\"' >> gobject_tags.c && cat gobject_tags_raw.c >> gobject_tags.c")))

; === GdkPixbuf enums ===
(rule
 (targets gdkpixbuf_tags_raw.h gdkpixbuf_tags_raw.c GdkPixbufEnums.ml)
 (deps %{project_root}/src/tools/varcc.exe)
 (action (run %{project_root}/src/tools/varcc.exe -h gdkpixbuf_tags_raw.h -c gdkpixbuf_tags_raw.c %{dep:gdkpixbuf_tags.var})))

(rule
 (target gdkpixbuf_tags.c)
 (deps gdkpixbuf_tags_raw.c wrappers.h gdkpixbuf_tags.h)
 (action (bash "echo '#include \"wrappers.h\"' > gdkpixbuf_tags.c && echo '#include \"gdkpixbuf_tags.h\"' >> gdkpixbuf_tags.c && cat gdkpixbuf_tags_raw.c >> gdkpixbuf_tags.c")))
