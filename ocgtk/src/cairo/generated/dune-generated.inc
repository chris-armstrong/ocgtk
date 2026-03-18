; Auto-generated library for generated C bindings
; Regenerate by running gir_gen

(rule
 (targets dune-modules.sexp)
 (action
  (with-stdout-to dune-modules.sexp
    (progn
      (echo "Adjustment")
      (echo "Box")
      (echo "Button")
      (echo "Cairo")
      (echo "Cairo_enums")
      (echo "Check_button")
      (echo "Context")
      (echo "Device")
      (echo "Entry")
      (echo "EventController")
      (echo "EventControllerKey")
      (echo "EventControllerMotion")
      (echo "Fixed")
      (echo "Font_face")
      (echo "Font_options")
      (echo "Frame")
      (echo "GContext")
      (echo "GDevice")
      (echo "GError")
      (echo "GFont_face")
      (echo "GFont_options")
      (echo "GMatrix")
      (echo "GPath")
      (echo "GPattern")
      (echo "GRectangle")
      (echo "GRectangle_int")
      (echo "GRegion")
      (echo "GScaled_font")
      (echo "GSurface")
      (echo "Gaux")
      (echo "Gdk")
      (echo "GdkClipboard")
      (echo "GdkPixbuf")
      (echo "Gdk_enums")
      (echo "GestureClick")
      (echo "Glib")
      (echo "Gobject")
      (echo "Gpointer")
      (echo "Graphene")
      (echo "Grid")
      (echo "Gtk")
      (echo "GtkButton")
      (echo "GtkCheckButton")
      (echo "GtkSnapshot")
      (echo "GtkToggleButton")
      (echo "Gtk_enums")
      (echo "Image")
      (echo "Label")
      (echo "Level_bar")
      (echo "Link_button")
      (echo "Matrix")
      (echo "Menu_button")
      (echo "Notebook")
      (echo "Ocgtk_cairo")
      (echo "Paned")
      (echo "Pango")
      (echo "Pango_enums")
      (echo "Password_entry")
      (echo "Path")
      (echo "Pattern")
      (echo "Progress_bar")
      (echo "Range")
      (echo "Rectangle")
      (echo "Rectangle_int")
      (echo "Region")
      (echo "Scale")
      (echo "Scaled_font")
      (echo "Scrolled_window")
      (echo "Search_entry")
      (echo "Spin_button")
      (echo "Stack")
      (echo "Surface")
      (echo "Switch")
      (echo "Text_buffer")
      (echo "Text_tag")
      (echo "Text_tag_table")
      (echo "Text_view")
      (echo "Toggle_button")
    )))
)

(rule
 (targets cflag-cairo.sexp clink-cairo.sexp)
 (action (bash "\
echo '' > cflag-cairo.sexp.tmp && \\
echo '' > clink-cairo.sexp.tmp && \\
pkg-config --cflags cairo-gobject >> cflag-cairo.sexp.tmp && \\
pkg-config --libs cairo-gobject >> clink-cairo.sexp.tmp && \\
echo \"(\" > cflag-cairo.sexp && \\
tr ' ' '\\n' < cflag-cairo.sexp.tmp | sed 's/^\\(.*\\)$/\\1/' | tr '\\n' ' ' >> cflag-cairo.sexp && \\
echo \")\" >> cflag-cairo.sexp && \\
echo \"(\" > clink-cairo.sexp && \\
tr ' ' '\\n' < clink-cairo.sexp.tmp | sed 's/^\\(.*\\)$/\\1/' | tr '\\n' ' ' >> clink-cairo.sexp && \\
echo \")\" >> clink-cairo.sexp && \\
rm cflag-cairo.sexp.tmp clink-cairo.sexp.tmp\\
")))

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
