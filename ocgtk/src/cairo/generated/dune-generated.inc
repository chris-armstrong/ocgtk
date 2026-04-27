; Auto-generated library for generated C bindings
; Regenerate by running gir_gen

(rule
 (targets cflag-cairo.sexp clink-cairo.sexp)
 (action
  (run
   %{exe:../configurator/config_flags.exe}
   --pkg
   cairo-gobject
   --cflags-out
   cflag-cairo.sexp
   --libs-out
   clink-cairo.sexp)))

(library
 (name ocgtk_cairo_generated_stubs)
 (public_name ocgtk.cairo.generated_stubs)
 (wrapped false)
 (modules)  ; No OCaml modules, only C stubs
 (libraries ocgtk_common)  ; Depend on common for header files
 (foreign_stubs
  (language c)
  (names
   ml_cairo_enums_gen
   ml_context_gen
   ml_device_gen
   ml_font_face_gen
   ml_font_options_gen
   ml_matrix_gen
   ml_path_gen
   ml_pattern_gen
   ml_rectangle_gen
   ml_rectangle_int_gen
   ml_region_gen
   ml_scaled_font_gen
   ml_surface_gen
  )
  (flags -fPIC -Igenerated -Icore -I../common (:include cflag-cairo.sexp) -Wno-deprecated-declarations -Wno-incompatible-pointer-types -Wno-int-conversion))
 (c_library_flags (:include clink-cairo.sexp)))

