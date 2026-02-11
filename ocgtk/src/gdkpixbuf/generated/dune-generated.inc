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
      (echo "Check_button")
      (echo "Entry")
      (echo "EventController")
      (echo "EventControllerKey")
      (echo "EventControllerMotion")
      (echo "Fixed")
      (echo "Frame")
      (echo "GError")
      (echo "GPixbuf")
      (echo "GPixbuf_animation")
      (echo "GPixbuf_animation_iter")
      (echo "GPixbuf_format")
      (echo "GPixbuf_loader")
      (echo "GPixbuf_module")
      (echo "GPixbuf_module_pattern")
      (echo "GPixbuf_non_anim")
      (echo "GPixbuf_simple_anim")
      (echo "GPixbuf_simple_anim_iter")
      (echo "Gaux")
      (echo "Gdk")
      (echo "GdkClipboard")
      (echo "GdkPixbuf")
      (echo "Gdk_enums")
      (echo "Gdkpixbuf_enums")
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
      (echo "Menu_button")
      (echo "Notebook")
      (echo "Paned")
      (echo "Pango")
      (echo "Pango_enums")
      (echo "Password_entry")
      (echo "Pixbuf")
      (echo "Pixbuf_animation")
      (echo "Pixbuf_animation_iter")
      (echo "Pixbuf_format")
      (echo "Pixbuf_loader")
      (echo "Pixbuf_module")
      (echo "Pixbuf_module_pattern")
      (echo "Pixbuf_non_anim")
      (echo "Pixbuf_simple_anim")
      (echo "Pixbuf_simple_anim_iter")
      (echo "Progress_bar")
      (echo "Range")
      (echo "Scale")
      (echo "Scrolled_window")
      (echo "Search_entry")
      (echo "Spin_button")
      (echo "Stack")
      (echo "Switch")
      (echo "Text_buffer")
      (echo "Text_tag")
      (echo "Text_tag_table")
      (echo "Text_view")
      (echo "Toggle_button")
    )))
)

(rule
 (targets cflag-gdkpixbuf.sexp clink-gdkpixbuf.sexp)
 (action (bash "\
echo '' > cflag-gdkpixbuf.sexp.tmp && \\
echo '' > clink-gdkpixbuf.sexp.tmp && \\
pkg-config --cflags gdk-pixbuf-2.0 >> cflag-gdkpixbuf.sexp.tmp && \\
pkg-config --libs gdk-pixbuf-2.0 >> clink-gdkpixbuf.sexp.tmp && \\
echo \"(\" > cflag-gdkpixbuf.sexp && \\
tr ' ' '\\n' < cflag-gdkpixbuf.sexp.tmp | sed 's/^\\(.*\\)$/\\1/' | tr '\\n' ' ' >> cflag-gdkpixbuf.sexp && \\
echo \")\" >> cflag-gdkpixbuf.sexp && \\
echo \"(\" > clink-gdkpixbuf.sexp && \\
tr ' ' '\\n' < clink-gdkpixbuf.sexp.tmp | sed 's/^\\(.*\\)$/\\1/' | tr '\\n' ' ' >> clink-gdkpixbuf.sexp && \\
echo \")\" >> clink-gdkpixbuf.sexp && \\
rm cflag-gdkpixbuf.sexp.tmp clink-gdkpixbuf.sexp.tmp\\
")))

(library
 (name ocgtk_gdk_pixbuf_generated_stubs)
 (public_name ocgtk.gdk_pixbuf.generated_stubs)
 (wrapped false)
 (modules)  ; No OCaml modules, only C stubs
 (libraries ocgtk_common)  ; Depend on common for header files
 (foreign_stubs
  (language c)
  (names
   ml_gdkpixbuf_enums_gen
   ml_pixbuf_animation_gen
   ml_pixbuf_animation_iter_gen
   ml_pixbuf_format_gen
   ml_pixbuf_gen
   ml_pixbuf_loader_gen
   ml_pixbuf_module_gen
   ml_pixbuf_module_pattern_gen
   ml_pixbuf_non_anim_gen
   ml_pixbuf_simple_anim_gen
   ml_pixbuf_simple_anim_iter_gen
  )
  (flags -fPIC -Igenerated -Icore -I../common (:include cflag-gdkpixbuf.sexp) -Wno-deprecated-declarations -Wno-incompatible-pointer-types -Wno-int-conversion))
 (c_library_flags (:include clink-gdkpixbuf.sexp)))
