; Auto-generated library for generated C bindings
; Regenerate by running gir_gen

(rule
 (targets dune-modules.sexp)
 (action
  (with-stdout-to dune-modules.sexp
    (progn
      (echo "Adjustment")
      (echo "Analysis")
      (echo "Attr_class")
      (echo "Attr_color")
      (echo "Attr_float")
      (echo "Attr_font_desc")
      (echo "Attr_font_features")
      (echo "Attr_int")
      (echo "Attr_iterator")
      (echo "Attr_language")
      (echo "Attr_list")
      (echo "Attr_shape")
      (echo "Attr_size")
      (echo "Attr_string")
      (echo "Attribute")
      (echo "Box")
      (echo "Button")
      (echo "Check_button")
      (echo "Color")
      (echo "Context_and__font_and__font_map_and__fontset")
      (echo "Coverage")
      (echo "Entry")
      (echo "EventController")
      (echo "EventControllerKey")
      (echo "EventControllerMotion")
      (echo "Fixed")
      (echo "Font_description")
      (echo "Font_face_and__font_family")
      (echo "Font_metrics")
      (echo "Fontset_simple")
      (echo "Frame")
      (echo "GAnalysis")
      (echo "GAttr_class")
      (echo "GAttr_color")
      (echo "GAttr_float")
      (echo "GAttr_font_desc")
      (echo "GAttr_font_features")
      (echo "GAttr_int")
      (echo "GAttr_iterator")
      (echo "GAttr_language")
      (echo "GAttr_list")
      (echo "GAttr_shape")
      (echo "GAttr_size")
      (echo "GAttr_string")
      (echo "GAttribute")
      (echo "GColor")
      (echo "GContext_and__font_and__font_map_and__fontset")
      (echo "GCoverage")
      (echo "GError")
      (echo "GFont_description")
      (echo "GFont_face_and__font_family")
      (echo "GFont_metrics")
      (echo "GFontset_simple")
      (echo "GGlyph_geometry")
      (echo "GGlyph_info")
      (echo "GGlyph_item")
      (echo "GGlyph_item_iter")
      (echo "GGlyph_string")
      (echo "GGlyph_vis_attr")
      (echo "GItem")
      (echo "GLanguage")
      (echo "GLayout_and__layout_iter")
      (echo "GLayout_line")
      (echo "GLog_attr")
      (echo "GMatrix")
      (echo "GRectangle")
      (echo "GRenderer")
      (echo "GScript_iter")
      (echo "GTab_array")
      (echo "Gaux")
      (echo "Gdk")
      (echo "GdkClipboard")
      (echo "GdkPixbuf")
      (echo "Gdk_enums")
      (echo "GestureClick")
      (echo "Glib")
      (echo "Glyph_geometry")
      (echo "Glyph_info")
      (echo "Glyph_item")
      (echo "Glyph_item_iter")
      (echo "Glyph_string")
      (echo "Glyph_vis_attr")
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
      (echo "Item")
      (echo "Label")
      (echo "Language")
      (echo "Layout_and__layout_iter")
      (echo "Layout_line")
      (echo "Level_bar")
      (echo "Link_button")
      (echo "Log_attr")
      (echo "Matrix")
      (echo "Menu_button")
      (echo "Notebook")
      (echo "Ocgtk_pango")
      (echo "Paned")
      (echo "Pango")
      (echo "Pango_enums")
      (echo "Password_entry")
      (echo "Progress_bar")
      (echo "Range")
      (echo "Rectangle")
      (echo "Renderer")
      (echo "Scale")
      (echo "Script_iter")
      (echo "Scrolled_window")
      (echo "Search_entry")
      (echo "Spin_button")
      (echo "Stack")
      (echo "Switch")
      (echo "Tab_array")
      (echo "Text_buffer")
      (echo "Text_tag")
      (echo "Text_tag_table")
      (echo "Text_view")
      (echo "Toggle_button")
    )))
)

(rule
 (targets cflag-pango.sexp clink-pango.sexp)
 (action (bash "\
echo '' > cflag-pango.sexp.tmp && \\
echo '' > clink-pango.sexp.tmp && \\
pkg-config --cflags pango >> cflag-pango.sexp.tmp && \\
pkg-config --libs pango >> clink-pango.sexp.tmp && \\
pkg-config --cflags cairo-gobject >> cflag-pango.sexp.tmp && \\
pkg-config --libs cairo-gobject >> clink-pango.sexp.tmp && \\
pkg-config --cflags gio-2.0 >> cflag-pango.sexp.tmp && \\
pkg-config --libs gio-2.0 >> clink-pango.sexp.tmp && \\
pkg-config --cflags gio-unix-2.0 >> cflag-pango.sexp.tmp && \\
pkg-config --libs gio-unix-2.0 >> clink-pango.sexp.tmp && \\
echo \"(\" > cflag-pango.sexp && \\
tr ' ' '\\n' < cflag-pango.sexp.tmp | sed 's/^\\(.*\\)$/\\1/' | tr '\\n' ' ' >> cflag-pango.sexp && \\
echo \")\" >> cflag-pango.sexp && \\
echo \"(\" > clink-pango.sexp && \\
tr ' ' '\\n' < clink-pango.sexp.tmp | sed 's/^\\(.*\\)$/\\1/' | tr '\\n' ' ' >> clink-pango.sexp && \\
echo \")\" >> clink-pango.sexp && \\
rm cflag-pango.sexp.tmp clink-pango.sexp.tmp\\
")))

(library
 (name ocgtk_pango_generated_stubs)
 (public_name ocgtk.pango.generated_stubs)
 (wrapped false)
 (modules)  ; No OCaml modules, only C stubs
 (libraries ocgtk.gio ocgtk.cairo ocgtk_common)  ; Dependencies and common for header files
 (foreign_stubs
  (language c)
  (names
   ml_analysis_gen
   ml_attr_class_gen
   ml_attr_color_gen
   ml_attr_float_gen
   ml_attr_font_desc_gen
   ml_attr_font_features_gen
   ml_attr_int_gen
   ml_attr_iterator_gen
   ml_attr_language_gen
   ml_attr_list_gen
   ml_attr_shape_gen
   ml_attr_size_gen
   ml_attr_string_gen
   ml_attribute_gen
   ml_color_gen
   ml_context_gen
   ml_coverage_gen
   ml_font_description_gen
   ml_font_face_gen
   ml_font_family_gen
   ml_font_gen
   ml_font_map_gen
   ml_font_metrics_gen
   ml_fontset_gen
   ml_fontset_simple_gen
   ml_glyph_geometry_gen
   ml_glyph_info_gen
   ml_glyph_item_gen
   ml_glyph_item_iter_gen
   ml_glyph_string_gen
   ml_glyph_vis_attr_gen
   ml_item_gen
   ml_language_gen
   ml_layout_gen
   ml_layout_iter_gen
   ml_layout_line_gen
   ml_log_attr_gen
   ml_matrix_gen
   ml_pango_enums_gen
   ml_rectangle_gen
   ml_renderer_gen
   ml_script_iter_gen
   ml_tab_array_gen
  )
  (flags -fPIC -Igenerated -Icore -I../common (:include cflag-pango.sexp) -Wno-deprecated-declarations -Wno-incompatible-pointer-types -Wno-int-conversion))
 (c_library_flags (:include clink-pango.sexp)))
