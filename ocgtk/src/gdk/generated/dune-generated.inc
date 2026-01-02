; Auto-generated library for generated C bindings
; Regenerate by running gir_gen

(rule
 (targets dune-modules.sexp)
 (action
  (with-stdout-to dune-modules.sexp
    (progn
      (echo "Adjustment")
      (echo "App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context")
      (echo "Box")
      (echo "Button")
      (echo "Button_event")
      (echo "Check_button")
      (echo "Content_deserializer")
      (echo "Content_formats")
      (echo "Content_formats_builder")
      (echo "Content_provider")
      (echo "Content_serializer")
      (echo "Crossing_event")
      (echo "Cursor")
      (echo "Delete_event")
      (echo "Device_pad")
      (echo "Device_tool")
      (echo "Display_manager")
      (echo "Dmabuf_formats")
      (echo "Dmabuf_texture")
      (echo "Dmabuf_texture_builder")
      (echo "Dnd_event")
      (echo "Drag")
      (echo "Drag_surface")
      (echo "Drag_surface_size")
      (echo "Drop")
      (echo "Entry")
      (echo "EventController")
      (echo "EventControllerKey")
      (echo "EventControllerMotion")
      (echo "File_list")
      (echo "Fixed")
      (echo "Focus_event")
      (echo "Frame")
      (echo "Frame_clock")
      (echo "Frame_timings")
      (echo "GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context")
      (echo "GButton_event")
      (echo "GContent_deserializer")
      (echo "GContent_formats")
      (echo "GContent_formats_builder")
      (echo "GContent_provider")
      (echo "GContent_serializer")
      (echo "GCrossing_event")
      (echo "GCursor")
      (echo "GDelete_event")
      (echo "GDevice_pad")
      (echo "GDevice_tool")
      (echo "GDisplay_manager")
      (echo "GDmabuf_formats")
      (echo "GDmabuf_texture")
      (echo "GDmabuf_texture_builder")
      (echo "GDnd_event")
      (echo "GDrag")
      (echo "GDrag_surface")
      (echo "GDrag_surface_size")
      (echo "GDrop")
      (echo "GError")
      (echo "GFile_list")
      (echo "GFocus_event")
      (echo "GFrame_clock")
      (echo "GFrame_timings")
      (echo "GGl_texture")
      (echo "GGl_texture_builder")
      (echo "GGrab_broken_event")
      (echo "GKey_event")
      (echo "GMemory_texture")
      (echo "GMotion_event")
      (echo "GPad_event")
      (echo "GPaintable")
      (echo "GPopup")
      (echo "GPopup_layout")
      (echo "GProximity_event")
      (echo "GRectangle")
      (echo "GRgb_a")
      (echo "GScroll_event")
      (echo "GSnapshot")
      (echo "GTexture")
      (echo "GTexture_downloader")
      (echo "GToplevel")
      (echo "GToplevel_layout")
      (echo "GToplevel_size")
      (echo "GTouch_event")
      (echo "GTouchpad_event")
      (echo "Gaux")
      (echo "Gdk")
      (echo "GdkClipboard")
      (echo "GdkPixbuf")
      (echo "Gdk_enums")
      (echo "GestureClick")
      (echo "Gl_texture")
      (echo "Gl_texture_builder")
      (echo "Glib")
      (echo "Gobject")
      (echo "Gpointer")
      (echo "Grab_broken_event")
      (echo "Graphene")
      (echo "Grid")
      (echo "Gtk")
      (echo "GtkButton")
      (echo "GtkCheckButton")
      (echo "GtkSnapshot")
      (echo "GtkToggleButton")
      (echo "Gtk_enums")
      (echo "Image")
      (echo "Key_event")
      (echo "Label")
      (echo "Level_bar")
      (echo "Link_button")
      (echo "Memory_texture")
      (echo "Menu_button")
      (echo "Motion_event")
      (echo "Notebook")
      (echo "Pad_event")
      (echo "Paintable")
      (echo "Paned")
      (echo "Pango")
      (echo "Pango_enums")
      (echo "Password_entry")
      (echo "Popup")
      (echo "Popup_layout")
      (echo "Progress_bar")
      (echo "Proximity_event")
      (echo "Range")
      (echo "Rectangle")
      (echo "Rgb_a")
      (echo "Scale")
      (echo "Scroll_event")
      (echo "Scrolled_window")
      (echo "Search_entry")
      (echo "Snapshot")
      (echo "Spin_button")
      (echo "Stack")
      (echo "Switch")
      (echo "Text_buffer")
      (echo "Text_tag")
      (echo "Text_tag_table")
      (echo "Text_view")
      (echo "Texture")
      (echo "Texture_downloader")
      (echo "Toggle_button")
      (echo "Toplevel")
      (echo "Toplevel_layout")
      (echo "Toplevel_size")
      (echo "Touch_event")
      (echo "Touchpad_event")
    )))
)

(rule
 (targets cflag-gdk.sexp clink-gdk.sexp)
 (action (bash "\
echo '' > cflag-gdk.sexp.tmp && \\
echo '' > clink-gdk.sexp.tmp && \\
pkg-config --cflags gtk4 >> cflag-gdk.sexp.tmp && \\
pkg-config --libs gtk4 >> clink-gdk.sexp.tmp && \\
echo \"(\" > cflag-gdk.sexp && \\
tr ' ' '\\n' < cflag-gdk.sexp.tmp | sed 's/^\\(.*\\)$/\\1/' | tr '\\n' ' ' >> cflag-gdk.sexp && \\
echo \")\" >> cflag-gdk.sexp && \\
echo \"(\" > clink-gdk.sexp && \\
tr ' ' '\\n' < clink-gdk.sexp.tmp | sed 's/^\\(.*\\)$/\\1/' | tr '\\n' ' ' >> clink-gdk.sexp && \\
echo \")\" >> clink-gdk.sexp && \\
rm cflag-gdk.sexp.tmp clink-gdk.sexp.tmp\\
")))

(library
 (name ocgtk_gdk_generated_stubs)
 (public_name ocgtk.gdk.generated_stubs)
 (wrapped false)
 (modules)  ; No OCaml modules, only C stubs
 (libraries ocgtk_common)  ; Depend on common for header files
 (foreign_stubs
  (language c)
  (names
   ml_app_launch_context_gen
   ml_button_event_gen
   ml_cairo_context_gen
   ml_clipboard_gen
   ml_content_deserializer_gen
   ml_content_provider_gen
   ml_content_serializer_gen
   ml_crossing_event_gen
   ml_cursor_gen
   ml_delete_event_gen
   ml_device_gen
   ml_device_pad_gen
   ml_device_tool_gen
   ml_display_gen
   ml_display_manager_gen
   ml_dmabuf_texture_builder_gen
   ml_dmabuf_texture_gen
   ml_dnd_event_gen
   ml_drag_gen
   ml_drag_surface_gen
   ml_draw_context_gen
   ml_drop_gen
   ml_event_gen
   ml_event_sequence_record_gen
   ml_focus_event_gen
   ml_frame_clock_gen
   ml_gdk_enums_gen
   ml_gl_context_gen
   ml_gl_texture_builder_gen
   ml_gl_texture_gen
   ml_grab_broken_event_gen
   ml_key_event_gen
   ml_memory_texture_gen
   ml_monitor_gen
   ml_motion_event_gen
   ml_pad_event_gen
   ml_paintable_gen
   ml_popup_gen
   ml_proximity_event_gen
   ml_rgb_a_record_gen
   ml_scroll_event_gen
   ml_seat_gen
   ml_snapshot_gen
   ml_surface_gen
   ml_texture_gen
   ml_toplevel_gen
   ml_touch_event_gen
   ml_touchpad_event_gen
   ml_vulkan_context_gen
  )
  (flags -fPIC -Igenerated -Icore -I../common (:include cflag-gdk.sexp) -Wno-deprecated-declarations -Wno-incompatible-pointer-types -Wno-int-conversion))
 (c_library_flags (:include clink-gdk.sexp)))
