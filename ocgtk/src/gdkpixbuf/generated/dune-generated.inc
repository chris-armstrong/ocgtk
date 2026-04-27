; Auto-generated library for generated C bindings
; Regenerate by running gir_gen

(rule
 (targets cflag-gdkpixbuf.sexp clink-gdkpixbuf.sexp)
 (action
  (run
   %{exe:../configurator/config_flags.exe}
   --pkg
   gdk-pixbuf-2.0
   --pkg
   gio-2.0
   --pkg-optional
   gio-unix-2.0
   --cflags-out
   cflag-gdkpixbuf.sexp
   --libs-out
   clink-gdkpixbuf.sexp)))

(library
 (name ocgtk_gdk_pixbuf_generated_stubs)
 (public_name ocgtk.gdk_pixbuf.generated_stubs)
 (wrapped false)
 (modules)  ; No OCaml modules, only C stubs
 (libraries ocgtk.gio ocgtk_common)  ; Dependencies and common for header files
 (foreign_stubs
  (language c)
  (names
   ml_gdkpixbuf_enums_gen
   ml_pixbuf_animation_gen
   ml_pixbuf_animation_iter_gen
   ml_pixbuf_format_gen
   ml_pixbuf_gen
   ml_pixbuf_loader_gen
   ml_pixbuf_simple_anim_gen
   ml_pixbuf_simple_anim_iter_gen
  )
  (flags -fPIC -Igenerated -Icore -I../common (:include cflag-gdkpixbuf.sexp) -Wno-deprecated-declarations -Wno-incompatible-pointer-types -Wno-int-conversion))
 (c_library_flags (:include clink-gdkpixbuf.sexp)))

