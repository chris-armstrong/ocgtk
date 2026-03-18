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
      (echo "Font")
      (echo "Font_map")
      (echo "Frame")
      (echo "GError")
      (echo "GFont")
      (echo "GFont_map")
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
      (echo "Menu_button")
      (echo "Notebook")
      (echo "Ocgtk_pangocairo")
      (echo "Paned")
      (echo "Pango")
      (echo "PangoCairo")
      (echo "Pango_enums")
      (echo "Password_entry")
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
 (targets cflag-pangocairo.sexp clink-pangocairo.sexp)
 (action (bash "\
echo '' > cflag-pangocairo.sexp.tmp && \\
echo '' > clink-pangocairo.sexp.tmp && \\
pkg-config --cflags pangocairo >> cflag-pangocairo.sexp.tmp && \\
pkg-config --libs pangocairo >> clink-pangocairo.sexp.tmp && \\
pkg-config --cflags cairo-gobject >> cflag-pangocairo.sexp.tmp && \\
pkg-config --libs cairo-gobject >> clink-pangocairo.sexp.tmp && \\
pkg-config --cflags gio-2.0 >> cflag-pangocairo.sexp.tmp && \\
pkg-config --libs gio-2.0 >> clink-pangocairo.sexp.tmp && \\
pkg-config --cflags gio-unix-2.0 >> cflag-pangocairo.sexp.tmp && \\
pkg-config --libs gio-unix-2.0 >> clink-pangocairo.sexp.tmp && \\
pkg-config --cflags pango >> cflag-pangocairo.sexp.tmp && \\
pkg-config --libs pango >> clink-pangocairo.sexp.tmp && \\
echo \"(\" > cflag-pangocairo.sexp && \\
tr ' ' '\\n' < cflag-pangocairo.sexp.tmp | sed 's/^\\(.*\\)$/\\1/' | tr '\\n' ' ' >> cflag-pangocairo.sexp && \\
echo \")\" >> cflag-pangocairo.sexp && \\
echo \"(\" > clink-pangocairo.sexp && \\
tr ' ' '\\n' < clink-pangocairo.sexp.tmp | sed 's/^\\(.*\\)$/\\1/' | tr '\\n' ' ' >> clink-pangocairo.sexp && \\
echo \")\" >> clink-pangocairo.sexp && \\
rm cflag-pangocairo.sexp.tmp clink-pangocairo.sexp.tmp\\
")))

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
