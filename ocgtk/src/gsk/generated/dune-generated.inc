; Auto-generated library for generated C bindings
; Regenerate by running gir_gen

(rule
 (targets dune-modules.sexp)
 (action
  (with-stdout-to dune-modules.sexp
    (progn
      (echo "Adjustment")
      (echo "Blend_node")
      (echo "Blur_node")
      (echo "Border_node")
      (echo "Box")
      (echo "Button")
      (echo "Cairo_node")
      (echo "Cairo_renderer")
      (echo "Check_button")
      (echo "Clip_node")
      (echo "Color_matrix_node")
      (echo "Color_node")
      (echo "Color_stop")
      (echo "Conic_gradient_node")
      (echo "Container_node")
      (echo "Cross_fade_node")
      (echo "Debug_node")
      (echo "Entry")
      (echo "EventController")
      (echo "EventControllerKey")
      (echo "EventControllerMotion")
      (echo "Fill_node")
      (echo "Fixed")
      (echo "Frame")
      (echo "GBlend_node")
      (echo "GBlur_node")
      (echo "GBorder_node")
      (echo "GCairo_node")
      (echo "GCairo_renderer")
      (echo "GClip_node")
      (echo "GColor_matrix_node")
      (echo "GColor_node")
      (echo "GColor_stop")
      (echo "GConic_gradient_node")
      (echo "GContainer_node")
      (echo "GCross_fade_node")
      (echo "GDebug_node")
      (echo "GError")
      (echo "GFill_node")
      (echo "GGl_shader")
      (echo "GGl_shader_node")
      (echo "GInset_shadow_node")
      (echo "GLinear_gradient_node")
      (echo "GMask_node")
      (echo "GOpacity_node")
      (echo "GOutset_shadow_node")
      (echo "GParse_location")
      (echo "GPath")
      (echo "GPath_and__path_measure_and__path_point")
      (echo "GPath_builder")
      (echo "GPath_measure")
      (echo "GPath_point")
      (echo "GRadial_gradient_node")
      (echo "GRender_node")
      (echo "GRenderer")
      (echo "GRepeat_node")
      (echo "GRepeating_linear_gradient_node")
      (echo "GRepeating_radial_gradient_node")
      (echo "GRounded_clip_node")
      (echo "GRounded_rect")
      (echo "GShader_args_builder")
      (echo "GShadow")
      (echo "GShadow_node")
      (echo "GStroke")
      (echo "GStroke_node")
      (echo "GSubsurface_node")
      (echo "GText_node")
      (echo "GTexture_node")
      (echo "GTexture_scale_node")
      (echo "GTransform")
      (echo "GTransform_node")
      (echo "Gaux")
      (echo "Gdk")
      (echo "GdkClipboard")
      (echo "GdkPixbuf")
      (echo "Gdk_enums")
      (echo "GestureClick")
      (echo "Gl_shader")
      (echo "Gl_shader_node")
      (echo "Glib")
      (echo "Gobject")
      (echo "Gpointer")
      (echo "Graphene")
      (echo "Grid")
      (echo "Gsk")
      (echo "Gsk_enums")
      (echo "Gtk")
      (echo "GtkButton")
      (echo "GtkCheckButton")
      (echo "GtkSnapshot")
      (echo "GtkToggleButton")
      (echo "Gtk_enums")
      (echo "Image")
      (echo "Inset_shadow_node")
      (echo "Label")
      (echo "Level_bar")
      (echo "Linear_gradient_node")
      (echo "Link_button")
      (echo "Mask_node")
      (echo "Menu_button")
      (echo "Notebook")
      (echo "Ocgtk_gsk")
      (echo "Opacity_node")
      (echo "Outset_shadow_node")
      (echo "Paned")
      (echo "Pango")
      (echo "Pango_enums")
      (echo "Parse_location")
      (echo "Password_entry")
      (echo "Path_and__path_measure_and__path_point")
      (echo "Path_builder")
      (echo "Progress_bar")
      (echo "Radial_gradient_node")
      (echo "Range")
      (echo "Render_node")
      (echo "Renderer")
      (echo "Repeat_node")
      (echo "Repeating_linear_gradient_node")
      (echo "Repeating_radial_gradient_node")
      (echo "Rounded_clip_node")
      (echo "Rounded_rect")
      (echo "Scale")
      (echo "Scrolled_window")
      (echo "Search_entry")
      (echo "Shader_args_builder")
      (echo "Shadow")
      (echo "Shadow_node")
      (echo "Spin_button")
      (echo "Stack")
      (echo "Stroke")
      (echo "Stroke_node")
      (echo "Subsurface_node")
      (echo "Switch")
      (echo "Text_buffer")
      (echo "Text_node")
      (echo "Text_tag")
      (echo "Text_tag_table")
      (echo "Text_view")
      (echo "Texture_node")
      (echo "Texture_scale_node")
      (echo "Toggle_button")
      (echo "Transform")
      (echo "Transform_node")
    )))
)

(rule
 (targets cflag-gsk.sexp clink-gsk.sexp)
 (action (bash "\
echo '' > cflag-gsk.sexp.tmp && \\
echo '' > clink-gsk.sexp.tmp && \\
pkg-config --cflags gtk4 >> cflag-gsk.sexp.tmp && \\
pkg-config --libs gtk4 >> clink-gsk.sexp.tmp && \\
pkg-config --cflags cairo-gobject >> cflag-gsk.sexp.tmp && \\
pkg-config --libs cairo-gobject >> clink-gsk.sexp.tmp && \\
pkg-config --cflags gdk-pixbuf-2.0 >> cflag-gsk.sexp.tmp && \\
pkg-config --libs gdk-pixbuf-2.0 >> clink-gsk.sexp.tmp && \\
pkg-config --cflags gio-2.0 >> cflag-gsk.sexp.tmp && \\
pkg-config --libs gio-2.0 >> clink-gsk.sexp.tmp && \\
pkg-config --cflags gio-unix-2.0 >> cflag-gsk.sexp.tmp && \\
pkg-config --libs gio-unix-2.0 >> clink-gsk.sexp.tmp && \\
pkg-config --cflags graphene-gobject-1.0 >> cflag-gsk.sexp.tmp && \\
pkg-config --libs graphene-gobject-1.0 >> clink-gsk.sexp.tmp && \\
pkg-config --cflags gtk4 >> cflag-gsk.sexp.tmp && \\
pkg-config --libs gtk4 >> clink-gsk.sexp.tmp && \\
pkg-config --cflags pango >> cflag-gsk.sexp.tmp && \\
pkg-config --libs pango >> clink-gsk.sexp.tmp && \\
pkg-config --cflags pangocairo >> cflag-gsk.sexp.tmp && \\
pkg-config --libs pangocairo >> clink-gsk.sexp.tmp && \\
echo \"(\" > cflag-gsk.sexp && \\
tr ' ' '\\n' < cflag-gsk.sexp.tmp | sed 's/^\\(.*\\)$/\\1/' | tr '\\n' ' ' >> cflag-gsk.sexp && \\
echo \")\" >> cflag-gsk.sexp && \\
echo \"(\" > clink-gsk.sexp && \\
tr ' ' '\\n' < clink-gsk.sexp.tmp | sed 's/^\\(.*\\)$/\\1/' | tr '\\n' ' ' >> clink-gsk.sexp && \\
echo \")\" >> clink-gsk.sexp && \\
rm cflag-gsk.sexp.tmp clink-gsk.sexp.tmp\\
")))

(library
 (name ocgtk_gsk_generated_stubs)
 (public_name ocgtk.gsk.generated_stubs)
 (wrapped false)
 (modules)  ; No OCaml modules, only C stubs
 (libraries ocgtk.gdk ocgtk.gdkpixbuf ocgtk.gio ocgtk.graphene ocgtk.pango ocgtk.pangocairo ocgtk.cairo ocgtk_common)  ; Dependencies and common for header files
 (foreign_stubs
  (language c)
  (names
   ml_blend_node_gen
   ml_blur_node_gen
   ml_border_node_gen
   ml_cairo_node_gen
   ml_cairo_renderer_gen
   ml_clip_node_gen
   ml_color_matrix_node_gen
   ml_color_node_gen
   ml_color_stop_gen
   ml_conic_gradient_node_gen
   ml_container_node_gen
   ml_cross_fade_node_gen
   ml_debug_node_gen
   ml_fill_node_gen
   ml_gl_shader_gen
   ml_gl_shader_node_gen
   ml_gsk_enums_gen
   ml_inset_shadow_node_gen
   ml_linear_gradient_node_gen
   ml_mask_node_gen
   ml_opacity_node_gen
   ml_outset_shadow_node_gen
   ml_parse_location_gen
   ml_path_builder_gen
   ml_path_gen
   ml_path_measure_gen
   ml_path_point_gen
   ml_radial_gradient_node_gen
   ml_render_node_gen
   ml_renderer_gen
   ml_repeat_node_gen
   ml_repeating_linear_gradient_node_gen
   ml_repeating_radial_gradient_node_gen
   ml_rounded_clip_node_gen
   ml_rounded_rect_gen
   ml_shader_args_builder_gen
   ml_shadow_gen
   ml_shadow_node_gen
   ml_stroke_gen
   ml_stroke_node_gen
   ml_subsurface_node_gen
   ml_text_node_gen
   ml_texture_node_gen
   ml_texture_scale_node_gen
   ml_transform_gen
   ml_transform_node_gen
  )
  (flags -fPIC -Igenerated -Icore -I../common (:include cflag-gsk.sexp) -Wno-deprecated-declarations -Wno-incompatible-pointer-types -Wno-int-conversion))
 (c_library_flags (:include clink-gsk.sexp)))
