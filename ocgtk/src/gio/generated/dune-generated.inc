; Auto-generated library for generated C bindings
; Regenerate by running gir_gen

(rule
 (targets dune-modules.sexp)
 (action
  (with-stdout-to dune-modules.sexp
    (progn
      (echo "Action")
      (echo "Action_entry")
      (echo "Action_group")
      (echo "Action_map")
      (echo "Adjustment")
      (echo "App_info_and__app_launch_context")
      (echo "App_info_monitor")
      (echo "Application")
      (echo "Application_command_line")
      (echo "Async_initable")
      (echo "Async_result")
      (echo "Box")
      (echo "Buffered_input_stream")
      (echo "Buffered_output_stream")
      (echo "Button")
      (echo "Bytes_icon")
      (echo "Cancellable")
      (echo "Charset_converter")
      (echo "Check_button")
      (echo "Converter")
      (echo "Converter_input_stream")
      (echo "Converter_output_stream")
      (echo "Credentials")
      (echo "D_bus_action_group")
      (echo "D_bus_annotation_info")
      (echo "D_bus_arg_info")
      (echo "D_bus_auth_observer")
      (echo "D_bus_connection")
      (echo "D_bus_error_entry")
      (echo "D_bus_interface_and__d_bus_object")
      (echo "D_bus_interface_info")
      (echo "D_bus_interface_skeleton")
      (echo "D_bus_interface_v_table")
      (echo "D_bus_menu_model")
      (echo "D_bus_message")
      (echo "D_bus_method_info")
      (echo "D_bus_method_invocation")
      (echo "D_bus_node_info")
      (echo "D_bus_object_manager")
      (echo "D_bus_object_manager_client")
      (echo "D_bus_object_manager_server")
      (echo "D_bus_object_proxy")
      (echo "D_bus_object_skeleton")
      (echo "D_bus_property_info")
      (echo "D_bus_proxy")
      (echo "D_bus_server")
      (echo "D_bus_signal_info")
      (echo "D_bus_subtree_v_table")
      (echo "Data_input_stream")
      (echo "Data_output_stream")
      (echo "Datagram_based")
      (echo "Debug_controller")
      (echo "Debug_controller_d_bus")
      (echo "Desktop_app_info")
      (echo "Desktop_app_info_lookup")
      (echo "Drive")
      (echo "Dtls_client_connection")
      (echo "Dtls_connection")
      (echo "Dtls_server_connection")
      (echo "Emblem")
      (echo "Emblemed_icon")
      (echo "Entry")
      (echo "EventController")
      (echo "EventControllerKey")
      (echo "EventControllerMotion")
      (echo "File_and__file_enumerator_and__file_monitor_and__mount_and__volume")
      (echo "File_attribute_info")
      (echo "File_attribute_info_list")
      (echo "File_attribute_matcher")
      (echo "File_descriptor_based")
      (echo "File_icon")
      (echo "File_info")
      (echo "File_input_stream")
      (echo "File_io_stream")
      (echo "File_output_stream")
      (echo "Filename_completer")
      (echo "Filter_input_stream")
      (echo "Filter_output_stream")
      (echo "Fixed")
      (echo "Frame")
      (echo "GAction")
      (echo "GAction_entry")
      (echo "GAction_group")
      (echo "GAction_map")
      (echo "GApp_info_and__app_launch_context")
      (echo "GApp_info_monitor")
      (echo "GApplication")
      (echo "GApplication_command_line")
      (echo "GAsync_initable")
      (echo "GAsync_result")
      (echo "GBuffered_input_stream")
      (echo "GBuffered_output_stream")
      (echo "GBytes_icon")
      (echo "GCancellable")
      (echo "GCharset_converter")
      (echo "GConverter")
      (echo "GConverter_input_stream")
      (echo "GConverter_output_stream")
      (echo "GCredentials")
      (echo "GD_bus_action_group")
      (echo "GD_bus_annotation_info")
      (echo "GD_bus_arg_info")
      (echo "GD_bus_auth_observer")
      (echo "GD_bus_connection")
      (echo "GD_bus_error_entry")
      (echo "GD_bus_interface_and__d_bus_object")
      (echo "GD_bus_interface_info")
      (echo "GD_bus_interface_skeleton")
      (echo "GD_bus_interface_v_table")
      (echo "GD_bus_menu_model")
      (echo "GD_bus_message")
      (echo "GD_bus_method_info")
      (echo "GD_bus_method_invocation")
      (echo "GD_bus_node_info")
      (echo "GD_bus_object_manager")
      (echo "GD_bus_object_manager_client")
      (echo "GD_bus_object_manager_server")
      (echo "GD_bus_object_proxy")
      (echo "GD_bus_object_skeleton")
      (echo "GD_bus_property_info")
      (echo "GD_bus_proxy")
      (echo "GD_bus_server")
      (echo "GD_bus_signal_info")
      (echo "GD_bus_subtree_v_table")
      (echo "GData_input_stream")
      (echo "GData_output_stream")
      (echo "GDatagram_based")
      (echo "GDebug_controller")
      (echo "GDebug_controller_d_bus")
      (echo "GDesktop_app_info")
      (echo "GDesktop_app_info_lookup")
      (echo "GDrive")
      (echo "GDtls_client_connection")
      (echo "GDtls_connection")
      (echo "GDtls_server_connection")
      (echo "GEmblem")
      (echo "GEmblemed_icon")
      (echo "GError")
      (echo "GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume")
      (echo "GFile_attribute_info")
      (echo "GFile_attribute_info_list")
      (echo "GFile_attribute_matcher")
      (echo "GFile_descriptor_based")
      (echo "GFile_icon")
      (echo "GFile_info")
      (echo "GFile_input_stream")
      (echo "GFile_io_stream")
      (echo "GFile_output_stream")
      (echo "GFilename_completer")
      (echo "GFilter_input_stream")
      (echo "GFilter_output_stream")
      (echo "GIcon")
      (echo "GInet_address")
      (echo "GInet_address_mask")
      (echo "GInet_socket_address")
      (echo "GInitable")
      (echo "GInput_message")
      (echo "GInput_stream")
      (echo "GInput_vector")
      (echo "GIo_extension")
      (echo "GIo_extension_point")
      (echo "GIo_module")
      (echo "GIo_module_scope")
      (echo "GIo_scheduler_job")
      (echo "GIo_stream")
      (echo "GIo_stream_adapter")
      (echo "GList_model")
      (echo "GList_store")
      (echo "GLoadable_icon")
      (echo "GMemory_input_stream")
      (echo "GMemory_monitor")
      (echo "GMemory_output_stream")
      (echo "GMenu")
      (echo "GMenu_attribute_iter")
      (echo "GMenu_item")
      (echo "GMenu_link_iter_and__menu_model")
      (echo "GMount_operation")
      (echo "GNative_socket_address")
      (echo "GNative_volume_monitor")
      (echo "GNetwork_address")
      (echo "GNetwork_monitor")
      (echo "GNetwork_service")
      (echo "GNotification")
      (echo "GOutput_message")
      (echo "GOutput_stream")
      (echo "GOutput_vector")
      (echo "GPermission")
      (echo "GPollable_input_stream")
      (echo "GPollable_output_stream")
      (echo "GPower_profile_monitor")
      (echo "GProperty_action")
      (echo "GProxy")
      (echo "GProxy_address")
      (echo "GProxy_address_enumerator")
      (echo "GProxy_resolver")
      (echo "GRemote_action_group")
      (echo "GResolver")
      (echo "GResource")
      (echo "GSeekable")
      (echo "GSettings")
      (echo "GSettings_backend")
      (echo "GSettings_schema")
      (echo "GSettings_schema_key")
      (echo "GSettings_schema_source")
      (echo "GSimple_action")
      (echo "GSimple_action_group")
      (echo "GSimple_async_result")
      (echo "GSimple_io_stream")
      (echo "GSimple_permission")
      (echo "GSimple_proxy_resolver")
      (echo "GSocket_address")
      (echo "GSocket_address_enumerator")
      (echo "GSocket_and__socket_connection")
      (echo "GSocket_client")
      (echo "GSocket_connectable")
      (echo "GSocket_control_message")
      (echo "GSocket_listener")
      (echo "GSocket_service")
      (echo "GSrv_target")
      (echo "GStatic_resource")
      (echo "GSubprocess")
      (echo "GSubprocess_launcher")
      (echo "GTask")
      (echo "GTcp_connection")
      (echo "GTcp_wrapper_connection")
      (echo "GTest_d_bus")
      (echo "GThemed_icon")
      (echo "GThreaded_resolver")
      (echo "GThreaded_socket_service")
      (echo "GTls_backend")
      (echo "GTls_certificate")
      (echo "GTls_client_connection")
      (echo "GTls_connection_and__tls_database_and__tls_interaction")
      (echo "GTls_file_database")
      (echo "GTls_password")
      (echo "GTls_server_connection")
      (echo "GUnix_connection")
      (echo "GUnix_credentials_message")
      (echo "GUnix_fd_list")
      (echo "GUnix_fd_message")
      (echo "GUnix_input_stream")
      (echo "GUnix_mount_entry")
      (echo "GUnix_mount_monitor")
      (echo "GUnix_mount_point")
      (echo "GUnix_output_stream")
      (echo "GUnix_socket_address")
      (echo "GVfs")
      (echo "GVolume_monitor")
      (echo "GZlib_compressor")
      (echo "GZlib_decompressor")
      (echo "Gaux")
      (echo "Gdk")
      (echo "GdkClipboard")
      (echo "GdkPixbuf")
      (echo "Gdk_enums")
      (echo "GestureClick")
      (echo "Gio")
      (echo "Gio_enums")
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
      (echo "Icon")
      (echo "Image")
      (echo "Inet_address")
      (echo "Inet_address_mask")
      (echo "Inet_socket_address")
      (echo "Initable")
      (echo "Input_message")
      (echo "Input_stream")
      (echo "Input_vector")
      (echo "Io_extension")
      (echo "Io_extension_point")
      (echo "Io_module")
      (echo "Io_module_scope")
      (echo "Io_scheduler_job")
      (echo "Io_stream")
      (echo "Io_stream_adapter")
      (echo "Label")
      (echo "Level_bar")
      (echo "Link_button")
      (echo "List_model")
      (echo "List_store")
      (echo "Loadable_icon")
      (echo "Memory_input_stream")
      (echo "Memory_monitor")
      (echo "Memory_output_stream")
      (echo "Menu")
      (echo "Menu_attribute_iter")
      (echo "Menu_button")
      (echo "Menu_item")
      (echo "Menu_link_iter_and__menu_model")
      (echo "Mount_operation")
      (echo "Native_socket_address")
      (echo "Native_volume_monitor")
      (echo "Network_address")
      (echo "Network_monitor")
      (echo "Network_service")
      (echo "Notebook")
      (echo "Notification")
      (echo "Output_message")
      (echo "Output_stream")
      (echo "Output_vector")
      (echo "Paned")
      (echo "Pango")
      (echo "Pango_enums")
      (echo "Password_entry")
      (echo "Permission")
      (echo "Pollable_input_stream")
      (echo "Pollable_output_stream")
      (echo "Power_profile_monitor")
      (echo "Progress_bar")
      (echo "Property_action")
      (echo "Proxy")
      (echo "Proxy_address")
      (echo "Proxy_address_enumerator")
      (echo "Proxy_resolver")
      (echo "Range")
      (echo "Remote_action_group")
      (echo "Resolver")
      (echo "Resource")
      (echo "Scale")
      (echo "Scrolled_window")
      (echo "Search_entry")
      (echo "Seekable")
      (echo "Settings")
      (echo "Settings_backend")
      (echo "Settings_schema")
      (echo "Settings_schema_key")
      (echo "Settings_schema_source")
      (echo "Simple_action")
      (echo "Simple_action_group")
      (echo "Simple_async_result")
      (echo "Simple_io_stream")
      (echo "Simple_permission")
      (echo "Simple_proxy_resolver")
      (echo "Socket_address")
      (echo "Socket_address_enumerator")
      (echo "Socket_and__socket_connection")
      (echo "Socket_client")
      (echo "Socket_connectable")
      (echo "Socket_control_message")
      (echo "Socket_listener")
      (echo "Socket_service")
      (echo "Spin_button")
      (echo "Srv_target")
      (echo "Stack")
      (echo "Static_resource")
      (echo "Subprocess")
      (echo "Subprocess_launcher")
      (echo "Switch")
      (echo "Task")
      (echo "Tcp_connection")
      (echo "Tcp_wrapper_connection")
      (echo "Test_d_bus")
      (echo "Text_buffer")
      (echo "Text_tag")
      (echo "Text_tag_table")
      (echo "Text_view")
      (echo "Themed_icon")
      (echo "Threaded_resolver")
      (echo "Threaded_socket_service")
      (echo "Tls_backend")
      (echo "Tls_certificate")
      (echo "Tls_client_connection")
      (echo "Tls_connection_and__tls_database_and__tls_interaction")
      (echo "Tls_file_database")
      (echo "Tls_password")
      (echo "Tls_server_connection")
      (echo "Toggle_button")
      (echo "Unix_connection")
      (echo "Unix_credentials_message")
      (echo "Unix_fd_list")
      (echo "Unix_fd_message")
      (echo "Unix_input_stream")
      (echo "Unix_mount_entry")
      (echo "Unix_mount_monitor")
      (echo "Unix_mount_point")
      (echo "Unix_output_stream")
      (echo "Unix_socket_address")
      (echo "Vfs")
      (echo "Volume_monitor")
      (echo "Zlib_compressor")
      (echo "Zlib_decompressor")
    )))
)

(rule
 (targets cflag-gio.sexp clink-gio.sexp)
 (action (bash "\
echo '' > cflag-gio.sexp.tmp && \\
echo '' > clink-gio.sexp.tmp && \\
pkg-config --cflags gio-unix-2.0 >> cflag-gio.sexp.tmp && \\
pkg-config --libs gio-unix-2.0 >> clink-gio.sexp.tmp && \\
pkg-config --cflags gio-2.0 >> cflag-gio.sexp.tmp && \\
pkg-config --libs gio-2.0 >> clink-gio.sexp.tmp && \\
echo \"(\" > cflag-gio.sexp && \\
tr ' ' '\\n' < cflag-gio.sexp.tmp | sed 's/^\\(.*\\)$/\\1/' | tr '\\n' ' ' >> cflag-gio.sexp && \\
echo \")\" >> cflag-gio.sexp && \\
echo \"(\" > clink-gio.sexp && \\
tr ' ' '\\n' < clink-gio.sexp.tmp | sed 's/^\\(.*\\)$/\\1/' | tr '\\n' ' ' >> clink-gio.sexp && \\
echo \")\" >> clink-gio.sexp && \\
rm cflag-gio.sexp.tmp clink-gio.sexp.tmp\\
")))

(library
 (name ocgtk_gio_generated_stubs)
 (public_name ocgtk.gio.generated_stubs)
 (wrapped false)
 (modules)  ; No OCaml modules, only C stubs
 (libraries ocgtk_common)  ; Depend on common for header files
 (foreign_stubs
  (language c)
  (names
   ml_action_entry_gen
   ml_action_gen
   ml_action_group_gen
   ml_action_map_gen
   ml_app_info_gen
   ml_app_info_monitor_gen
   ml_app_launch_context_gen
   ml_application_command_line_gen
   ml_application_gen
   ml_async_initable_gen
   ml_async_result_gen
   ml_buffered_input_stream_gen
   ml_buffered_output_stream_gen
   ml_bytes_icon_gen
   ml_cancellable_gen
   ml_charset_converter_gen
   ml_converter_gen
   ml_converter_input_stream_gen
   ml_converter_output_stream_gen
   ml_credentials_gen
   ml_d_bus_action_group_gen
   ml_d_bus_annotation_info_gen
   ml_d_bus_arg_info_gen
   ml_d_bus_auth_observer_gen
   ml_d_bus_connection_gen
   ml_d_bus_error_entry_gen
   ml_d_bus_interface_gen
   ml_d_bus_interface_info_gen
   ml_d_bus_interface_skeleton_gen
   ml_d_bus_interface_v_table_gen
   ml_d_bus_menu_model_gen
   ml_d_bus_message_gen
   ml_d_bus_method_info_gen
   ml_d_bus_method_invocation_gen
   ml_d_bus_node_info_gen
   ml_d_bus_object_gen
   ml_d_bus_object_manager_client_gen
   ml_d_bus_object_manager_gen
   ml_d_bus_object_manager_server_gen
   ml_d_bus_object_proxy_gen
   ml_d_bus_object_skeleton_gen
   ml_d_bus_property_info_gen
   ml_d_bus_proxy_gen
   ml_d_bus_server_gen
   ml_d_bus_signal_info_gen
   ml_d_bus_subtree_v_table_gen
   ml_data_input_stream_gen
   ml_data_output_stream_gen
   ml_datagram_based_gen
   ml_debug_controller_d_bus_gen
   ml_debug_controller_gen
   ml_desktop_app_info_gen
   ml_desktop_app_info_lookup_gen
   ml_drive_gen
   ml_dtls_client_connection_gen
   ml_dtls_connection_gen
   ml_dtls_server_connection_gen
   ml_emblem_gen
   ml_emblemed_icon_gen
   ml_file_attribute_info_gen
   ml_file_attribute_info_list_gen
   ml_file_attribute_matcher_gen
   ml_file_descriptor_based_gen
   ml_file_enumerator_gen
   ml_file_gen
   ml_file_icon_gen
   ml_file_info_gen
   ml_file_input_stream_gen
   ml_file_io_stream_gen
   ml_file_monitor_gen
   ml_file_output_stream_gen
   ml_filename_completer_gen
   ml_filter_input_stream_gen
   ml_filter_output_stream_gen
   ml_gio_enums_gen
   ml_icon_gen
   ml_inet_address_gen
   ml_inet_address_mask_gen
   ml_inet_socket_address_gen
   ml_initable_gen
   ml_input_message_gen
   ml_input_stream_gen
   ml_input_vector_gen
   ml_io_extension_gen
   ml_io_extension_point_gen
   ml_io_module_gen
   ml_io_module_scope_gen
   ml_io_scheduler_job_gen
   ml_io_stream_adapter_gen
   ml_io_stream_gen
   ml_list_model_gen
   ml_list_store_gen
   ml_loadable_icon_gen
   ml_memory_input_stream_gen
   ml_memory_monitor_gen
   ml_memory_output_stream_gen
   ml_menu_attribute_iter_gen
   ml_menu_gen
   ml_menu_item_gen
   ml_menu_link_iter_gen
   ml_menu_model_gen
   ml_mount_gen
   ml_mount_operation_gen
   ml_native_socket_address_gen
   ml_native_volume_monitor_gen
   ml_network_address_gen
   ml_network_monitor_gen
   ml_network_service_gen
   ml_notification_gen
   ml_output_message_gen
   ml_output_stream_gen
   ml_output_vector_gen
   ml_permission_gen
   ml_pollable_input_stream_gen
   ml_pollable_output_stream_gen
   ml_power_profile_monitor_gen
   ml_property_action_gen
   ml_proxy_address_enumerator_gen
   ml_proxy_address_gen
   ml_proxy_gen
   ml_proxy_resolver_gen
   ml_remote_action_group_gen
   ml_resolver_gen
   ml_resource_gen
   ml_seekable_gen
   ml_settings_backend_gen
   ml_settings_gen
   ml_settings_schema_gen
   ml_settings_schema_key_gen
   ml_settings_schema_source_gen
   ml_simple_action_gen
   ml_simple_action_group_gen
   ml_simple_async_result_gen
   ml_simple_io_stream_gen
   ml_simple_permission_gen
   ml_simple_proxy_resolver_gen
   ml_socket_address_enumerator_gen
   ml_socket_address_gen
   ml_socket_client_gen
   ml_socket_connectable_gen
   ml_socket_connection_gen
   ml_socket_control_message_gen
   ml_socket_gen
   ml_socket_listener_gen
   ml_socket_service_gen
   ml_srv_target_gen
   ml_static_resource_gen
   ml_subprocess_gen
   ml_subprocess_launcher_gen
   ml_task_gen
   ml_tcp_connection_gen
   ml_tcp_wrapper_connection_gen
   ml_test_d_bus_gen
   ml_themed_icon_gen
   ml_threaded_resolver_gen
   ml_threaded_socket_service_gen
   ml_tls_backend_gen
   ml_tls_certificate_gen
   ml_tls_client_connection_gen
   ml_tls_connection_gen
   ml_tls_database_gen
   ml_tls_file_database_gen
   ml_tls_interaction_gen
   ml_tls_password_gen
   ml_tls_server_connection_gen
   ml_unix_connection_gen
   ml_unix_credentials_message_gen
   ml_unix_fd_list_gen
   ml_unix_fd_message_gen
   ml_unix_input_stream_gen
   ml_unix_mount_entry_gen
   ml_unix_mount_monitor_gen
   ml_unix_mount_point_gen
   ml_unix_output_stream_gen
   ml_unix_socket_address_gen
   ml_vfs_gen
   ml_volume_gen
   ml_volume_monitor_gen
   ml_zlib_compressor_gen
   ml_zlib_decompressor_gen
  )
  (flags -fPIC -Igenerated -Icore -I../common (:include cflag-gio.sexp) -Wno-deprecated-declarations -Wno-incompatible-pointer-types -Wno-int-conversion))
 (c_library_flags (:include clink-gio.sexp)))
