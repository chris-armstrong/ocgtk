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
