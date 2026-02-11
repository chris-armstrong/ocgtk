; Auto-generated library for generated C bindings
; Regenerate by running gir_gen

(rule
 (targets dune-modules.sexp)
 (action
  (with-stdout-to dune-modules.sexp
    (progn
      (echo "Adjustment")
      (echo "Box")
      (echo "Box_and__sphere")
      (echo "Button")
      (echo "Check_button")
      (echo "Entry")
      (echo "Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle")
      (echo "EventController")
      (echo "EventControllerKey")
      (echo "EventControllerMotion")
      (echo "Fixed")
      (echo "Frame")
      (echo "Frustum")
      (echo "GBox_and__sphere")
      (echo "GError")
      (echo "GEuler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle")
      (echo "GFrustum")
      (echo "GPoint")
      (echo "GPoint3_d")
      (echo "GQuad")
      (echo "GRect")
      (echo "GSimd4_f")
      (echo "GSimd4_x4_f")
      (echo "GSize")
      (echo "GVec2")
      (echo "GVec3_and__vec4")
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
      (echo "Graphene_enums")
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
      (echo "Point")
      (echo "Point3_d")
      (echo "Progress_bar")
      (echo "Quad")
      (echo "Range")
      (echo "Rect")
      (echo "Scale")
      (echo "Scrolled_window")
      (echo "Search_entry")
      (echo "Simd4_f")
      (echo "Simd4_x4_f")
      (echo "Size")
      (echo "Spin_button")
      (echo "Stack")
      (echo "Switch")
      (echo "Text_buffer")
      (echo "Text_tag")
      (echo "Text_tag_table")
      (echo "Text_view")
      (echo "Toggle_button")
      (echo "Vec2")
      (echo "Vec3_and__vec4")
    )))
)

(rule
 (targets cflag-graphene.sexp clink-graphene.sexp)
 (action (bash "\
echo '' > cflag-graphene.sexp.tmp && \\
echo '' > clink-graphene.sexp.tmp && \\
pkg-config --cflags graphene-gobject-1.0 >> cflag-graphene.sexp.tmp && \\
pkg-config --libs graphene-gobject-1.0 >> clink-graphene.sexp.tmp && \\
echo \"(\" > cflag-graphene.sexp && \\
tr ' ' '\\n' < cflag-graphene.sexp.tmp | sed 's/^\\(.*\\)$/\\1/' | tr '\\n' ' ' >> cflag-graphene.sexp && \\
echo \")\" >> cflag-graphene.sexp && \\
echo \"(\" > clink-graphene.sexp && \\
tr ' ' '\\n' < clink-graphene.sexp.tmp | sed 's/^\\(.*\\)$/\\1/' | tr '\\n' ' ' >> clink-graphene.sexp && \\
echo \")\" >> clink-graphene.sexp && \\
rm cflag-graphene.sexp.tmp clink-graphene.sexp.tmp\\
")))

(library
 (name ocgtk_graphene_generated_stubs)
 (public_name ocgtk.graphene.generated_stubs)
 (wrapped false)
 (modules)  ; No OCaml modules, only C stubs
 (libraries ocgtk_common)  ; Depend on common for header files
 (foreign_stubs
  (language c)
  (names
   ml_box_gen
   ml_euler_gen
   ml_frustum_gen
   ml_graphene_enums_gen
   ml_matrix_gen
   ml_plane_gen
   ml_point3_d_gen
   ml_point_gen
   ml_quad_gen
   ml_quaternion_gen
   ml_ray_gen
   ml_rect_gen
   ml_simd4_f_gen
   ml_simd4_x4_f_gen
   ml_size_gen
   ml_sphere_gen
   ml_triangle_gen
   ml_vec2_gen
   ml_vec3_gen
   ml_vec4_gen
  )
  (flags -fPIC -Igenerated -Icore -I../common (:include cflag-graphene.sexp) -Wno-deprecated-declarations -Wno-incompatible-pointer-types -Wno-int-conversion))
 (c_library_flags (:include clink-graphene.sexp)))
