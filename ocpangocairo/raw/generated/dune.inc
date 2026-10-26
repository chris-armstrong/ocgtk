; Auto-generated library for generated C bindings
; Regenerate by running gir_gen

(rule
 (targets cflag-pangocairo.sexp clink-pangocairo.sexp)
 (action
  (run
   %{exe:../../configurator/config_flags.exe}
   --pkg
   cairo-gobject
   --pkg
   gio-2.0
   --pkg-optional
   gio-unix-2.0
   --pkg
   pango
   --pkg
   pangocairo
   --cflags-out
   cflag-pangocairo.sexp
   --libs-out
   clink-pangocairo.sexp)))

(rule
 (copy generated/pangocairo_decls.h pangocairo_decls.h))

(rule
 (copy core/pangocairo_core.h pangocairo_core.h))

(library
 (name ocpangocairo_raw_stubs)
 (public_name ocpangocairo.raw.stubs)
 (wrapped false)
 (modules)  ; No OCaml modules, only C stubs
 (libraries ocgio.raw ocpango.raw occairo.raw ocglib)  ; Dependencies and ocglib for header files
 (foreign_stubs
  (language c)
  (names
   ml_font_gen
   ml_font_map_gen
  )
  (flags -fPIC -Igenerated -Icore (:include cflag-pangocairo.sexp) -Wno-deprecated-declarations -Wno-incompatible-pointer-types -Wno-int-conversion))
 (c_library_flags (:include clink-pangocairo.sexp)))

