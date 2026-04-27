; Auto-generated library for generated C bindings
; Regenerate by running gir_gen

(rule
 (targets cflag-pangocairo.sexp clink-pangocairo.sexp)
 (action
  (run
   %{exe:../configurator/config_flags.exe}
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

(library
 (name ocgtk_pango_cairo_generated_stubs)
 (public_name ocgtk.pango_cairo.generated_stubs)
 (wrapped false)
 (modules)  ; No OCaml modules, only C stubs
 (libraries ocgtk.gio ocgtk.pango ocgtk.cairo ocgtk_common)  ; Dependencies and common for header files
 (foreign_stubs
  (language c)
  (names
   ml_font_gen
   ml_font_map_gen
  )
  (flags -fPIC -Igenerated -Icore -I../common (:include cflag-pangocairo.sexp) -Wno-deprecated-declarations -Wno-incompatible-pointer-types -Wno-int-conversion))
 (c_library_flags (:include clink-pangocairo.sexp)))

