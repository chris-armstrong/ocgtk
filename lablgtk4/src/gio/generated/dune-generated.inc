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
      (echo "Action_group_interface")
      (echo "Action_interface")
      (echo "Action_map")
      (echo "Action_map_interface")
      (echo "Adjustment")
      (echo "App_info_and__app_launch_context")
      (echo "App_info_iface")
      (echo "App_info_monitor")
      (echo "App_launch_context_class")
      (echo "App_launch_context_private")
      (echo "Application")
      (echo "Application_class")
      (echo "Application_command_line")
      (echo "Application_command_line_class")
      (echo "Application_command_line_private")
      (echo "Application_private")
      (echo "Async_initable")
      (echo "Async_initable_iface")
      (echo "Async_result")
      (echo "Async_result_iface")
      (echo "Box")
      (echo "Buffered_input_stream")
      (echo "Buffered_input_stream_class")
      (echo "Buffered_input_stream_private")
      (echo "Buffered_output_stream")
      (echo "Buffered_output_stream_class")
      (echo "Buffered_output_stream_private")
      (echo "Button")
      (echo "Bytes_icon")
      (echo "Cancellable")
      (echo "Cancellable_class")
      (echo "Cancellable_private")
      (echo "Charset_converter")
      (echo "Charset_converter_class")
      (echo "Check_button")
      (echo "Converter")
      (echo "Converter_iface")
      (echo "Converter_input_stream")
      (echo "Converter_input_stream_class")
      (echo "Converter_input_stream_private")
      (echo "Converter_output_stream")
      (echo "Converter_output_stream_class")
      (echo "Converter_output_stream_private")
      (echo "Credentials")
      (echo "Credentials_class")
      (echo "D_bus_action_group")
      (echo "D_bus_annotation_info")
      (echo "D_bus_arg_info")
      (echo "D_bus_auth_observer")
      (echo "D_bus_connection")
      (echo "D_bus_error_entry")
      (echo "D_bus_interface_and__d_bus_object")
      (echo "D_bus_interface_iface")
      (echo "D_bus_interface_info")
      (echo "D_bus_interface_skeleton")
      (echo "D_bus_interface_skeleton_class")
      (echo "D_bus_interface_skeleton_private")
      (echo "D_bus_interface_v_table")
      (echo "D_bus_menu_model")
      (echo "D_bus_message")
      (echo "D_bus_method_info")
      (echo "D_bus_method_invocation")
      (echo "D_bus_node_info")
      (echo "D_bus_object_iface")
      (echo "D_bus_object_manager")
      (echo "D_bus_object_manager_client")
      (echo "D_bus_object_manager_client_class")
      (echo "D_bus_object_manager_client_private")
      (echo "D_bus_object_manager_iface")
      (echo "D_bus_object_manager_server")
      (echo "D_bus_object_manager_server_class")
      (echo "D_bus_object_manager_server_private")
      (echo "D_bus_object_proxy")
      (echo "D_bus_object_proxy_class")
      (echo "D_bus_object_proxy_private")
      (echo "D_bus_object_skeleton")
      (echo "D_bus_object_skeleton_class")
      (echo "D_bus_object_skeleton_private")
      (echo "D_bus_property_info")
      (echo "D_bus_proxy")
      (echo "D_bus_proxy_class")
      (echo "D_bus_proxy_private")
      (echo "D_bus_server")
      (echo "D_bus_signal_info")
      (echo "D_bus_subtree_v_table")
      (echo "Data_input_stream")
      (echo "Data_input_stream_class")
      (echo "Data_input_stream_private")
      (echo "Data_output_stream")
      (echo "Data_output_stream_class")
      (echo "Data_output_stream_private")
      (echo "Datagram_based")
      (echo "Datagram_based_interface")
      (echo "Debug_controller")
      (echo "Debug_controller_d_bus")
      (echo "Debug_controller_d_bus_class")
      (echo "Debug_controller_interface")
      (echo "Desktop_app_info")
      (echo "Desktop_app_info_class")
      (echo "Desktop_app_info_lookup")
      (echo "Desktop_app_info_lookup_iface")
      (echo "Drive")
      (echo "Drive_iface")
      (echo "Dtls_client_connection")
      (echo "Dtls_client_connection_interface")
      (echo "Dtls_connection")
      (echo "Dtls_connection_interface")
      (echo "Dtls_server_connection")
      (echo "Dtls_server_connection_interface")
      (echo "Emblem")
      (echo "Emblem_class")
      (echo "Emblemed_icon")
      (echo "Emblemed_icon_class")
      (echo "Emblemed_icon_private")
      (echo "Entry")
      (echo "EventController")
      (echo "EventControllerKey")
      (echo "EventControllerMotion")
      (echo "File_and__file_enumerator_and__file_monitor_and__mount_and__volume")
      (echo "File_attribute_info")
      (echo "File_attribute_info_list")
      (echo "File_attribute_matcher")
      (echo "File_descriptor_based")
      (echo "File_descriptor_based_iface")
      (echo "File_enumerator_class")
      (echo "File_enumerator_private")
      (echo "File_icon")
      (echo "File_icon_class")
      (echo "File_iface")
      (echo "File_info")
      (echo "File_info_class")
      (echo "File_input_stream")
      (echo "File_input_stream_class")
      (echo "File_input_stream_private")
      (echo "File_io_stream")
      (echo "File_io_stream_class")
      (echo "File_io_stream_private")
      (echo "File_monitor_class")
      (echo "File_monitor_private")
      (echo "File_output_stream")
      (echo "File_output_stream_class")
      (echo "File_output_stream_private")
      (echo "Filename_completer")
      (echo "Filename_completer_class")
      (echo "Filter_input_stream")
      (echo "Filter_input_stream_class")
      (echo "Filter_output_stream")
      (echo "Filter_output_stream_class")
      (echo "Fixed")
      (echo "Frame")
      (echo "GAction")
      (echo "GAction_entry")
      (echo "GAction_group")
      (echo "GAction_group_interface")
      (echo "GAction_interface")
      (echo "GAction_map")
      (echo "GAction_map_interface")
      (echo "GApp_info_and__app_launch_context")
      (echo "GApp_info_iface")
      (echo "GApp_info_monitor")
      (echo "GApp_launch_context_class")
      (echo "GApp_launch_context_private")
      (echo "GApplication")
      (echo "GApplication_class")
      (echo "GApplication_command_line")
      (echo "GApplication_command_line_class")
      (echo "GApplication_command_line_private")
      (echo "GApplication_private")
      (echo "GAsync_initable")
      (echo "GAsync_initable_iface")
      (echo "GAsync_result")
      (echo "GAsync_result_iface")
      (echo "GBuffered_input_stream")
      (echo "GBuffered_input_stream_class")
      (echo "GBuffered_input_stream_private")
      (echo "GBuffered_output_stream")
      (echo "GBuffered_output_stream_class")
      (echo "GBuffered_output_stream_private")
      (echo "GBytes_icon")
      (echo "GCancellable")
      (echo "GCancellable_class")
      (echo "GCancellable_private")
      (echo "GCharset_converter")
      (echo "GCharset_converter_class")
      (echo "GConverter")
      (echo "GConverter_iface")
      (echo "GConverter_input_stream")
      (echo "GConverter_input_stream_class")
      (echo "GConverter_input_stream_private")
      (echo "GConverter_output_stream")
      (echo "GConverter_output_stream_class")
      (echo "GConverter_output_stream_private")
      (echo "GCredentials")
      (echo "GCredentials_class")
      (echo "GD_bus_action_group")
      (echo "GD_bus_annotation_info")
      (echo "GD_bus_arg_info")
      (echo "GD_bus_auth_observer")
      (echo "GD_bus_connection")
      (echo "GD_bus_error_entry")
      (echo "GD_bus_interface_and__d_bus_object")
      (echo "GD_bus_interface_iface")
      (echo "GD_bus_interface_info")
      (echo "GD_bus_interface_skeleton")
      (echo "GD_bus_interface_skeleton_class")
      (echo "GD_bus_interface_skeleton_private")
      (echo "GD_bus_interface_v_table")
      (echo "GD_bus_menu_model")
      (echo "GD_bus_message")
      (echo "GD_bus_method_info")
      (echo "GD_bus_method_invocation")
      (echo "GD_bus_node_info")
      (echo "GD_bus_object_iface")
      (echo "GD_bus_object_manager")
      (echo "GD_bus_object_manager_client")
      (echo "GD_bus_object_manager_client_class")
      (echo "GD_bus_object_manager_client_private")
      (echo "GD_bus_object_manager_iface")
      (echo "GD_bus_object_manager_server")
      (echo "GD_bus_object_manager_server_class")
      (echo "GD_bus_object_manager_server_private")
      (echo "GD_bus_object_proxy")
      (echo "GD_bus_object_proxy_class")
      (echo "GD_bus_object_proxy_private")
      (echo "GD_bus_object_skeleton")
      (echo "GD_bus_object_skeleton_class")
      (echo "GD_bus_object_skeleton_private")
      (echo "GD_bus_property_info")
      (echo "GD_bus_proxy")
      (echo "GD_bus_proxy_class")
      (echo "GD_bus_proxy_private")
      (echo "GD_bus_server")
      (echo "GD_bus_signal_info")
      (echo "GD_bus_subtree_v_table")
      (echo "GData_input_stream")
      (echo "GData_input_stream_class")
      (echo "GData_input_stream_private")
      (echo "GData_output_stream")
      (echo "GData_output_stream_class")
      (echo "GData_output_stream_private")
      (echo "GDatagram_based")
      (echo "GDatagram_based_interface")
      (echo "GDebug_controller")
      (echo "GDebug_controller_d_bus")
      (echo "GDebug_controller_d_bus_class")
      (echo "GDebug_controller_interface")
      (echo "GDesktop_app_info")
      (echo "GDesktop_app_info_class")
      (echo "GDesktop_app_info_lookup")
      (echo "GDesktop_app_info_lookup_iface")
      (echo "GDrive")
      (echo "GDrive_iface")
      (echo "GDtls_client_connection")
      (echo "GDtls_client_connection_interface")
      (echo "GDtls_connection")
      (echo "GDtls_connection_interface")
      (echo "GDtls_server_connection")
      (echo "GDtls_server_connection_interface")
      (echo "GEmblem")
      (echo "GEmblem_class")
      (echo "GEmblemed_icon")
      (echo "GEmblemed_icon_class")
      (echo "GEmblemed_icon_private")
      (echo "GError")
      (echo "GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume")
      (echo "GFile_attribute_info")
      (echo "GFile_attribute_info_list")
      (echo "GFile_attribute_matcher")
      (echo "GFile_descriptor_based")
      (echo "GFile_descriptor_based_iface")
      (echo "GFile_enumerator_class")
      (echo "GFile_enumerator_private")
      (echo "GFile_icon")
      (echo "GFile_icon_class")
      (echo "GFile_iface")
      (echo "GFile_info")
      (echo "GFile_info_class")
      (echo "GFile_input_stream")
      (echo "GFile_input_stream_class")
      (echo "GFile_input_stream_private")
      (echo "GFile_io_stream")
      (echo "GFile_io_stream_class")
      (echo "GFile_io_stream_private")
      (echo "GFile_monitor_class")
      (echo "GFile_monitor_private")
      (echo "GFile_output_stream")
      (echo "GFile_output_stream_class")
      (echo "GFile_output_stream_private")
      (echo "GFilename_completer")
      (echo "GFilename_completer_class")
      (echo "GFilter_input_stream")
      (echo "GFilter_input_stream_class")
      (echo "GFilter_output_stream")
      (echo "GFilter_output_stream_class")
      (echo "GIcon")
      (echo "GIcon_iface")
      (echo "GInet_address")
      (echo "GInet_address_class")
      (echo "GInet_address_mask")
      (echo "GInet_address_mask_class")
      (echo "GInet_address_mask_private")
      (echo "GInet_address_private")
      (echo "GInet_socket_address")
      (echo "GInet_socket_address_class")
      (echo "GInet_socket_address_private")
      (echo "GInitable")
      (echo "GInitable_iface")
      (echo "GInput_message")
      (echo "GInput_stream")
      (echo "GInput_stream_class")
      (echo "GInput_stream_private")
      (echo "GInput_vector")
      (echo "GIo_extension")
      (echo "GIo_extension_point")
      (echo "GIo_module")
      (echo "GIo_module_class")
      (echo "GIo_module_scope")
      (echo "GIo_scheduler_job")
      (echo "GIo_stream")
      (echo "GIo_stream_adapter")
      (echo "GIo_stream_class")
      (echo "GIo_stream_private")
      (echo "GList_model")
      (echo "GList_model_interface")
      (echo "GList_store")
      (echo "GList_store_class")
      (echo "GLoadable_icon")
      (echo "GLoadable_icon_iface")
      (echo "GMemory_input_stream")
      (echo "GMemory_input_stream_class")
      (echo "GMemory_input_stream_private")
      (echo "GMemory_monitor")
      (echo "GMemory_monitor_interface")
      (echo "GMemory_output_stream")
      (echo "GMemory_output_stream_class")
      (echo "GMemory_output_stream_private")
      (echo "GMenu")
      (echo "GMenu_attribute_iter")
      (echo "GMenu_attribute_iter_class")
      (echo "GMenu_attribute_iter_private")
      (echo "GMenu_item")
      (echo "GMenu_link_iter_and__menu_model")
      (echo "GMenu_link_iter_class")
      (echo "GMenu_link_iter_private")
      (echo "GMenu_model_class")
      (echo "GMenu_model_private")
      (echo "GMount_iface")
      (echo "GMount_operation")
      (echo "GMount_operation_class")
      (echo "GMount_operation_private")
      (echo "GNative_socket_address")
      (echo "GNative_socket_address_class")
      (echo "GNative_socket_address_private")
      (echo "GNative_volume_monitor")
      (echo "GNative_volume_monitor_class")
      (echo "GNetwork_address")
      (echo "GNetwork_address_class")
      (echo "GNetwork_address_private")
      (echo "GNetwork_monitor")
      (echo "GNetwork_monitor_interface")
      (echo "GNetwork_service")
      (echo "GNetwork_service_class")
      (echo "GNetwork_service_private")
      (echo "GNotification")
      (echo "GOutput_message")
      (echo "GOutput_stream")
      (echo "GOutput_stream_class")
      (echo "GOutput_stream_private")
      (echo "GOutput_vector")
      (echo "GPermission")
      (echo "GPermission_class")
      (echo "GPermission_private")
      (echo "GPollable_input_stream")
      (echo "GPollable_input_stream_interface")
      (echo "GPollable_output_stream")
      (echo "GPollable_output_stream_interface")
      (echo "GPower_profile_monitor")
      (echo "GPower_profile_monitor_interface")
      (echo "GProperty_action")
      (echo "GProxy")
      (echo "GProxy_address")
      (echo "GProxy_address_class")
      (echo "GProxy_address_enumerator")
      (echo "GProxy_address_enumerator_class")
      (echo "GProxy_address_enumerator_private")
      (echo "GProxy_address_private")
      (echo "GProxy_interface")
      (echo "GProxy_resolver")
      (echo "GProxy_resolver_interface")
      (echo "GRemote_action_group")
      (echo "GRemote_action_group_interface")
      (echo "GResolver")
      (echo "GResolver_class")
      (echo "GResolver_private")
      (echo "GResource")
      (echo "GSeekable")
      (echo "GSeekable_iface")
      (echo "GSettings")
      (echo "GSettings_backend")
      (echo "GSettings_backend_class")
      (echo "GSettings_backend_private")
      (echo "GSettings_class")
      (echo "GSettings_private")
      (echo "GSettings_schema")
      (echo "GSettings_schema_key")
      (echo "GSettings_schema_source")
      (echo "GSimple_action")
      (echo "GSimple_action_group")
      (echo "GSimple_action_group_class")
      (echo "GSimple_action_group_private")
      (echo "GSimple_async_result")
      (echo "GSimple_async_result_class")
      (echo "GSimple_io_stream")
      (echo "GSimple_permission")
      (echo "GSimple_proxy_resolver")
      (echo "GSimple_proxy_resolver_class")
      (echo "GSimple_proxy_resolver_private")
      (echo "GSocket_address")
      (echo "GSocket_address_class")
      (echo "GSocket_address_enumerator")
      (echo "GSocket_address_enumerator_class")
      (echo "GSocket_and__socket_connection")
      (echo "GSocket_class")
      (echo "GSocket_client")
      (echo "GSocket_client_class")
      (echo "GSocket_client_private")
      (echo "GSocket_connectable")
      (echo "GSocket_connectable_iface")
      (echo "GSocket_connection_class")
      (echo "GSocket_connection_private")
      (echo "GSocket_control_message")
      (echo "GSocket_control_message_class")
      (echo "GSocket_control_message_private")
      (echo "GSocket_listener")
      (echo "GSocket_listener_class")
      (echo "GSocket_listener_private")
      (echo "GSocket_private")
      (echo "GSocket_service")
      (echo "GSocket_service_class")
      (echo "GSocket_service_private")
      (echo "GSrv_target")
      (echo "GStatic_resource")
      (echo "GSubprocess")
      (echo "GSubprocess_launcher")
      (echo "GTask")
      (echo "GTask_class")
      (echo "GTcp_connection")
      (echo "GTcp_connection_class")
      (echo "GTcp_connection_private")
      (echo "GTcp_wrapper_connection")
      (echo "GTcp_wrapper_connection_class")
      (echo "GTcp_wrapper_connection_private")
      (echo "GTest_d_bus")
      (echo "GThemed_icon")
      (echo "GThemed_icon_class")
      (echo "GThreaded_resolver")
      (echo "GThreaded_resolver_class")
      (echo "GThreaded_socket_service")
      (echo "GThreaded_socket_service_class")
      (echo "GThreaded_socket_service_private")
      (echo "GTls_backend")
      (echo "GTls_backend_interface")
      (echo "GTls_certificate")
      (echo "GTls_certificate_class")
      (echo "GTls_certificate_private")
      (echo "GTls_client_connection")
      (echo "GTls_client_connection_interface")
      (echo "GTls_connection_and__tls_database_and__tls_interaction")
      (echo "GTls_connection_class")
      (echo "GTls_connection_private")
      (echo "GTls_database_class")
      (echo "GTls_database_private")
      (echo "GTls_file_database")
      (echo "GTls_file_database_interface")
      (echo "GTls_interaction_class")
      (echo "GTls_interaction_private")
      (echo "GTls_password")
      (echo "GTls_password_class")
      (echo "GTls_password_private")
      (echo "GTls_server_connection")
      (echo "GTls_server_connection_interface")
      (echo "GUnix_connection")
      (echo "GUnix_connection_class")
      (echo "GUnix_connection_private")
      (echo "GUnix_credentials_message")
      (echo "GUnix_credentials_message_class")
      (echo "GUnix_credentials_message_private")
      (echo "GUnix_fd_list")
      (echo "GUnix_fd_list_class")
      (echo "GUnix_fd_list_private")
      (echo "GUnix_fd_message")
      (echo "GUnix_fd_message_class")
      (echo "GUnix_fd_message_private")
      (echo "GUnix_input_stream")
      (echo "GUnix_input_stream_class")
      (echo "GUnix_input_stream_private")
      (echo "GUnix_mount_entry")
      (echo "GUnix_mount_monitor")
      (echo "GUnix_mount_monitor_class")
      (echo "GUnix_mount_point")
      (echo "GUnix_output_stream")
      (echo "GUnix_output_stream_class")
      (echo "GUnix_output_stream_private")
      (echo "GUnix_socket_address")
      (echo "GUnix_socket_address_class")
      (echo "GUnix_socket_address_private")
      (echo "GVfs")
      (echo "GVfs_class")
      (echo "GVolume_iface")
      (echo "GVolume_monitor")
      (echo "GVolume_monitor_class")
      (echo "GZlib_compressor")
      (echo "GZlib_compressor_class")
      (echo "GZlib_decompressor")
      (echo "GZlib_decompressor_class")
      (echo "Gaux")
      (echo "Gdk")
      (echo "GdkClipboard")
      (echo "GdkPixbuf")
      (echo "Gdk_enums")
      (echo "GestureClick")
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
      (echo "Icon_iface")
      (echo "Image")
      (echo "Inet_address")
      (echo "Inet_address_class")
      (echo "Inet_address_mask")
      (echo "Inet_address_mask_class")
      (echo "Inet_address_mask_private")
      (echo "Inet_address_private")
      (echo "Inet_socket_address")
      (echo "Inet_socket_address_class")
      (echo "Inet_socket_address_private")
      (echo "Initable")
      (echo "Initable_iface")
      (echo "Input_message")
      (echo "Input_stream")
      (echo "Input_stream_class")
      (echo "Input_stream_private")
      (echo "Input_vector")
      (echo "Io_extension")
      (echo "Io_extension_point")
      (echo "Io_module")
      (echo "Io_module_class")
      (echo "Io_module_scope")
      (echo "Io_scheduler_job")
      (echo "Io_stream")
      (echo "Io_stream_adapter")
      (echo "Io_stream_class")
      (echo "Io_stream_private")
      (echo "Label")
      (echo "Level_bar")
      (echo "Link_button")
      (echo "List_model")
      (echo "List_model_interface")
      (echo "List_store")
      (echo "List_store_class")
      (echo "Loadable_icon")
      (echo "Loadable_icon_iface")
      (echo "Memory_input_stream")
      (echo "Memory_input_stream_class")
      (echo "Memory_input_stream_private")
      (echo "Memory_monitor")
      (echo "Memory_monitor_interface")
      (echo "Memory_output_stream")
      (echo "Memory_output_stream_class")
      (echo "Memory_output_stream_private")
      (echo "Menu")
      (echo "Menu_attribute_iter")
      (echo "Menu_attribute_iter_class")
      (echo "Menu_attribute_iter_private")
      (echo "Menu_button")
      (echo "Menu_item")
      (echo "Menu_link_iter_and__menu_model")
      (echo "Menu_link_iter_class")
      (echo "Menu_link_iter_private")
      (echo "Menu_model_class")
      (echo "Menu_model_private")
      (echo "Mount_iface")
      (echo "Mount_operation")
      (echo "Mount_operation_class")
      (echo "Mount_operation_private")
      (echo "Native_socket_address")
      (echo "Native_socket_address_class")
      (echo "Native_socket_address_private")
      (echo "Native_volume_monitor")
      (echo "Native_volume_monitor_class")
      (echo "Network_address")
      (echo "Network_address_class")
      (echo "Network_address_private")
      (echo "Network_monitor")
      (echo "Network_monitor_interface")
      (echo "Network_service")
      (echo "Network_service_class")
      (echo "Network_service_private")
      (echo "Notebook")
      (echo "Notification")
      (echo "Output_message")
      (echo "Output_stream")
      (echo "Output_stream_class")
      (echo "Output_stream_private")
      (echo "Output_vector")
      (echo "Paned")
      (echo "Pango")
      (echo "Pango_enums")
      (echo "Password_entry")
      (echo "Permission")
      (echo "Permission_class")
      (echo "Permission_private")
      (echo "Pollable_input_stream")
      (echo "Pollable_input_stream_interface")
      (echo "Pollable_output_stream")
      (echo "Pollable_output_stream_interface")
      (echo "Power_profile_monitor")
      (echo "Power_profile_monitor_interface")
      (echo "Progress_bar")
      (echo "Property_action")
      (echo "Proxy")
      (echo "Proxy_address")
      (echo "Proxy_address_class")
      (echo "Proxy_address_enumerator")
      (echo "Proxy_address_enumerator_class")
      (echo "Proxy_address_enumerator_private")
      (echo "Proxy_address_private")
      (echo "Proxy_interface")
      (echo "Proxy_resolver")
      (echo "Proxy_resolver_interface")
      (echo "Range")
      (echo "Remote_action_group")
      (echo "Remote_action_group_interface")
      (echo "Resolver")
      (echo "Resolver_class")
      (echo "Resolver_private")
      (echo "Resource")
      (echo "Scale")
      (echo "Scrolled_window")
      (echo "Search_entry")
      (echo "Seekable")
      (echo "Seekable_iface")
      (echo "Settings")
      (echo "Settings_backend")
      (echo "Settings_backend_class")
      (echo "Settings_backend_private")
      (echo "Settings_class")
      (echo "Settings_private")
      (echo "Settings_schema")
      (echo "Settings_schema_key")
      (echo "Settings_schema_source")
      (echo "Simple_action")
      (echo "Simple_action_group")
      (echo "Simple_action_group_class")
      (echo "Simple_action_group_private")
      (echo "Simple_async_result")
      (echo "Simple_async_result_class")
      (echo "Simple_io_stream")
      (echo "Simple_permission")
      (echo "Simple_proxy_resolver")
      (echo "Simple_proxy_resolver_class")
      (echo "Simple_proxy_resolver_private")
      (echo "Socket_address")
      (echo "Socket_address_class")
      (echo "Socket_address_enumerator")
      (echo "Socket_address_enumerator_class")
      (echo "Socket_and__socket_connection")
      (echo "Socket_class")
      (echo "Socket_client")
      (echo "Socket_client_class")
      (echo "Socket_client_private")
      (echo "Socket_connectable")
      (echo "Socket_connectable_iface")
      (echo "Socket_connection_class")
      (echo "Socket_connection_private")
      (echo "Socket_control_message")
      (echo "Socket_control_message_class")
      (echo "Socket_control_message_private")
      (echo "Socket_listener")
      (echo "Socket_listener_class")
      (echo "Socket_listener_private")
      (echo "Socket_private")
      (echo "Socket_service")
      (echo "Socket_service_class")
      (echo "Socket_service_private")
      (echo "Spin_button")
      (echo "Srv_target")
      (echo "Stack")
      (echo "Static_resource")
      (echo "Subprocess")
      (echo "Subprocess_launcher")
      (echo "Switch")
      (echo "Task")
      (echo "Task_class")
      (echo "Tcp_connection")
      (echo "Tcp_connection_class")
      (echo "Tcp_connection_private")
      (echo "Tcp_wrapper_connection")
      (echo "Tcp_wrapper_connection_class")
      (echo "Tcp_wrapper_connection_private")
      (echo "Test_d_bus")
      (echo "Text_buffer")
      (echo "Text_tag")
      (echo "Text_tag_table")
      (echo "Text_view")
      (echo "Themed_icon")
      (echo "Themed_icon_class")
      (echo "Threaded_resolver")
      (echo "Threaded_resolver_class")
      (echo "Threaded_socket_service")
      (echo "Threaded_socket_service_class")
      (echo "Threaded_socket_service_private")
      (echo "Tls_backend")
      (echo "Tls_backend_interface")
      (echo "Tls_certificate")
      (echo "Tls_certificate_class")
      (echo "Tls_certificate_private")
      (echo "Tls_client_connection")
      (echo "Tls_client_connection_interface")
      (echo "Tls_connection_and__tls_database_and__tls_interaction")
      (echo "Tls_connection_class")
      (echo "Tls_connection_private")
      (echo "Tls_database_class")
      (echo "Tls_database_private")
      (echo "Tls_file_database")
      (echo "Tls_file_database_interface")
      (echo "Tls_interaction_class")
      (echo "Tls_interaction_private")
      (echo "Tls_password")
      (echo "Tls_password_class")
      (echo "Tls_password_private")
      (echo "Tls_server_connection")
      (echo "Tls_server_connection_interface")
      (echo "Toggle_button")
      (echo "Unix_connection")
      (echo "Unix_connection_class")
      (echo "Unix_connection_private")
      (echo "Unix_credentials_message")
      (echo "Unix_credentials_message_class")
      (echo "Unix_credentials_message_private")
      (echo "Unix_fd_list")
      (echo "Unix_fd_list_class")
      (echo "Unix_fd_list_private")
      (echo "Unix_fd_message")
      (echo "Unix_fd_message_class")
      (echo "Unix_fd_message_private")
      (echo "Unix_input_stream")
      (echo "Unix_input_stream_class")
      (echo "Unix_input_stream_private")
      (echo "Unix_mount_entry")
      (echo "Unix_mount_monitor")
      (echo "Unix_mount_monitor_class")
      (echo "Unix_mount_point")
      (echo "Unix_output_stream")
      (echo "Unix_output_stream_class")
      (echo "Unix_output_stream_private")
      (echo "Unix_socket_address")
      (echo "Unix_socket_address_class")
      (echo "Unix_socket_address_private")
      (echo "Vfs")
      (echo "Vfs_class")
      (echo "Volume_iface")
      (echo "Volume_monitor")
      (echo "Volume_monitor_class")
      (echo "Zlib_compressor")
      (echo "Zlib_compressor_class")
      (echo "Zlib_decompressor")
      (echo "Zlib_decompressor_class")
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
 (name lablgtk4_gio_generated_stubs)
 (public_name lablgtk4.gio.generated_stubs)
 (wrapped false)
 (modules)  ; No OCaml modules, only C stubs
 (libraries lablgtk4_common)  ; Depend on common for header files
 (foreign_stubs
  (language c)
  (names
   ml_action_entry_gen
   ml_action_gen
   ml_action_group_gen
   ml_action_group_interface_gen
   ml_action_interface_gen
   ml_action_map_gen
   ml_action_map_interface_gen
   ml_app_info_gen
   ml_app_info_iface_gen
   ml_app_info_monitor_gen
   ml_app_launch_context_class_gen
   ml_app_launch_context_gen
   ml_app_launch_context_private_gen
   ml_application_class_gen
   ml_application_command_line_class_gen
   ml_application_command_line_gen
   ml_application_command_line_private_gen
   ml_application_gen
   ml_application_private_gen
   ml_async_initable_gen
   ml_async_initable_iface_gen
   ml_async_result_gen
   ml_async_result_iface_gen
   ml_buffered_input_stream_class_gen
   ml_buffered_input_stream_gen
   ml_buffered_input_stream_private_gen
   ml_buffered_output_stream_class_gen
   ml_buffered_output_stream_gen
   ml_buffered_output_stream_private_gen
   ml_bytes_icon_gen
   ml_cancellable_class_gen
   ml_cancellable_gen
   ml_cancellable_private_gen
   ml_charset_converter_class_gen
   ml_charset_converter_gen
   ml_converter_gen
   ml_converter_iface_gen
   ml_converter_input_stream_class_gen
   ml_converter_input_stream_gen
   ml_converter_input_stream_private_gen
   ml_converter_output_stream_class_gen
   ml_converter_output_stream_gen
   ml_converter_output_stream_private_gen
   ml_credentials_class_gen
   ml_credentials_gen
   ml_d_bus_action_group_gen
   ml_d_bus_annotation_info_gen
   ml_d_bus_arg_info_gen
   ml_d_bus_auth_observer_gen
   ml_d_bus_connection_gen
   ml_d_bus_error_entry_gen
   ml_d_bus_interface_gen
   ml_d_bus_interface_iface_gen
   ml_d_bus_interface_info_gen
   ml_d_bus_interface_skeleton_class_gen
   ml_d_bus_interface_skeleton_gen
   ml_d_bus_interface_skeleton_private_gen
   ml_d_bus_interface_v_table_gen
   ml_d_bus_menu_model_gen
   ml_d_bus_message_gen
   ml_d_bus_method_info_gen
   ml_d_bus_method_invocation_gen
   ml_d_bus_node_info_gen
   ml_d_bus_object_gen
   ml_d_bus_object_iface_gen
   ml_d_bus_object_manager_client_class_gen
   ml_d_bus_object_manager_client_gen
   ml_d_bus_object_manager_client_private_gen
   ml_d_bus_object_manager_gen
   ml_d_bus_object_manager_iface_gen
   ml_d_bus_object_manager_server_class_gen
   ml_d_bus_object_manager_server_gen
   ml_d_bus_object_manager_server_private_gen
   ml_d_bus_object_proxy_class_gen
   ml_d_bus_object_proxy_gen
   ml_d_bus_object_proxy_private_gen
   ml_d_bus_object_skeleton_class_gen
   ml_d_bus_object_skeleton_gen
   ml_d_bus_object_skeleton_private_gen
   ml_d_bus_property_info_gen
   ml_d_bus_proxy_class_gen
   ml_d_bus_proxy_gen
   ml_d_bus_proxy_private_gen
   ml_d_bus_server_gen
   ml_d_bus_signal_info_gen
   ml_d_bus_subtree_v_table_gen
   ml_data_input_stream_class_gen
   ml_data_input_stream_gen
   ml_data_input_stream_private_gen
   ml_data_output_stream_class_gen
   ml_data_output_stream_gen
   ml_data_output_stream_private_gen
   ml_datagram_based_gen
   ml_datagram_based_interface_gen
   ml_debug_controller_d_bus_class_gen
   ml_debug_controller_d_bus_gen
   ml_debug_controller_gen
   ml_debug_controller_interface_gen
   ml_desktop_app_info_class_gen
   ml_desktop_app_info_gen
   ml_desktop_app_info_lookup_gen
   ml_desktop_app_info_lookup_iface_gen
   ml_drive_gen
   ml_drive_iface_gen
   ml_dtls_client_connection_gen
   ml_dtls_client_connection_interface_gen
   ml_dtls_connection_gen
   ml_dtls_connection_interface_gen
   ml_dtls_server_connection_gen
   ml_dtls_server_connection_interface_gen
   ml_emblem_class_gen
   ml_emblem_gen
   ml_emblemed_icon_class_gen
   ml_emblemed_icon_gen
   ml_emblemed_icon_private_gen
   ml_file_attribute_info_gen
   ml_file_attribute_info_list_gen
   ml_file_attribute_matcher_gen
   ml_file_descriptor_based_gen
   ml_file_descriptor_based_iface_gen
   ml_file_enumerator_class_gen
   ml_file_enumerator_gen
   ml_file_enumerator_private_gen
   ml_file_gen
   ml_file_icon_class_gen
   ml_file_icon_gen
   ml_file_iface_gen
   ml_file_info_class_gen
   ml_file_info_gen
   ml_file_input_stream_class_gen
   ml_file_input_stream_gen
   ml_file_input_stream_private_gen
   ml_file_io_stream_class_gen
   ml_file_io_stream_gen
   ml_file_io_stream_private_gen
   ml_file_monitor_class_gen
   ml_file_monitor_gen
   ml_file_monitor_private_gen
   ml_file_output_stream_class_gen
   ml_file_output_stream_gen
   ml_file_output_stream_private_gen
   ml_filename_completer_class_gen
   ml_filename_completer_gen
   ml_filter_input_stream_class_gen
   ml_filter_input_stream_gen
   ml_filter_output_stream_class_gen
   ml_filter_output_stream_gen
   ml_gio_enums_gen
   ml_icon_gen
   ml_icon_iface_gen
   ml_inet_address_class_gen
   ml_inet_address_gen
   ml_inet_address_mask_class_gen
   ml_inet_address_mask_gen
   ml_inet_address_mask_private_gen
   ml_inet_address_private_gen
   ml_inet_socket_address_class_gen
   ml_inet_socket_address_gen
   ml_inet_socket_address_private_gen
   ml_initable_gen
   ml_initable_iface_gen
   ml_input_message_gen
   ml_input_stream_class_gen
   ml_input_stream_gen
   ml_input_stream_private_gen
   ml_input_vector_gen
   ml_io_extension_gen
   ml_io_extension_point_gen
   ml_io_module_class_gen
   ml_io_module_gen
   ml_io_module_scope_gen
   ml_io_scheduler_job_gen
   ml_io_stream_adapter_gen
   ml_io_stream_class_gen
   ml_io_stream_gen
   ml_io_stream_private_gen
   ml_list_model_gen
   ml_list_model_interface_gen
   ml_list_store_class_gen
   ml_list_store_gen
   ml_loadable_icon_gen
   ml_loadable_icon_iface_gen
   ml_memory_input_stream_class_gen
   ml_memory_input_stream_gen
   ml_memory_input_stream_private_gen
   ml_memory_monitor_gen
   ml_memory_monitor_interface_gen
   ml_memory_output_stream_class_gen
   ml_memory_output_stream_gen
   ml_memory_output_stream_private_gen
   ml_menu_attribute_iter_class_gen
   ml_menu_attribute_iter_gen
   ml_menu_attribute_iter_private_gen
   ml_menu_gen
   ml_menu_item_gen
   ml_menu_link_iter_class_gen
   ml_menu_link_iter_gen
   ml_menu_link_iter_private_gen
   ml_menu_model_class_gen
   ml_menu_model_gen
   ml_menu_model_private_gen
   ml_mount_gen
   ml_mount_iface_gen
   ml_mount_operation_class_gen
   ml_mount_operation_gen
   ml_mount_operation_private_gen
   ml_native_socket_address_class_gen
   ml_native_socket_address_gen
   ml_native_socket_address_private_gen
   ml_native_volume_monitor_class_gen
   ml_native_volume_monitor_gen
   ml_network_address_class_gen
   ml_network_address_gen
   ml_network_address_private_gen
   ml_network_monitor_gen
   ml_network_monitor_interface_gen
   ml_network_service_class_gen
   ml_network_service_gen
   ml_network_service_private_gen
   ml_notification_gen
   ml_output_message_gen
   ml_output_stream_class_gen
   ml_output_stream_gen
   ml_output_stream_private_gen
   ml_output_vector_gen
   ml_permission_class_gen
   ml_permission_gen
   ml_permission_private_gen
   ml_pollable_input_stream_gen
   ml_pollable_input_stream_interface_gen
   ml_pollable_output_stream_gen
   ml_pollable_output_stream_interface_gen
   ml_power_profile_monitor_gen
   ml_power_profile_monitor_interface_gen
   ml_property_action_gen
   ml_proxy_address_class_gen
   ml_proxy_address_enumerator_class_gen
   ml_proxy_address_enumerator_gen
   ml_proxy_address_enumerator_private_gen
   ml_proxy_address_gen
   ml_proxy_address_private_gen
   ml_proxy_gen
   ml_proxy_interface_gen
   ml_proxy_resolver_gen
   ml_proxy_resolver_interface_gen
   ml_remote_action_group_gen
   ml_remote_action_group_interface_gen
   ml_resolver_class_gen
   ml_resolver_gen
   ml_resolver_private_gen
   ml_resource_gen
   ml_seekable_gen
   ml_seekable_iface_gen
   ml_settings_backend_class_gen
   ml_settings_backend_gen
   ml_settings_backend_private_gen
   ml_settings_class_gen
   ml_settings_gen
   ml_settings_private_gen
   ml_settings_schema_gen
   ml_settings_schema_key_gen
   ml_settings_schema_source_gen
   ml_simple_action_gen
   ml_simple_action_group_class_gen
   ml_simple_action_group_gen
   ml_simple_action_group_private_gen
   ml_simple_async_result_class_gen
   ml_simple_async_result_gen
   ml_simple_io_stream_gen
   ml_simple_permission_gen
   ml_simple_proxy_resolver_class_gen
   ml_simple_proxy_resolver_gen
   ml_simple_proxy_resolver_private_gen
   ml_socket_address_class_gen
   ml_socket_address_enumerator_class_gen
   ml_socket_address_enumerator_gen
   ml_socket_address_gen
   ml_socket_class_gen
   ml_socket_client_class_gen
   ml_socket_client_gen
   ml_socket_client_private_gen
   ml_socket_connectable_gen
   ml_socket_connectable_iface_gen
   ml_socket_connection_class_gen
   ml_socket_connection_gen
   ml_socket_connection_private_gen
   ml_socket_control_message_class_gen
   ml_socket_control_message_gen
   ml_socket_control_message_private_gen
   ml_socket_gen
   ml_socket_listener_class_gen
   ml_socket_listener_gen
   ml_socket_listener_private_gen
   ml_socket_private_gen
   ml_socket_service_class_gen
   ml_socket_service_gen
   ml_socket_service_private_gen
   ml_srv_target_gen
   ml_static_resource_gen
   ml_subprocess_gen
   ml_subprocess_launcher_gen
   ml_task_class_gen
   ml_task_gen
   ml_tcp_connection_class_gen
   ml_tcp_connection_gen
   ml_tcp_connection_private_gen
   ml_tcp_wrapper_connection_class_gen
   ml_tcp_wrapper_connection_gen
   ml_tcp_wrapper_connection_private_gen
   ml_test_d_bus_gen
   ml_themed_icon_class_gen
   ml_themed_icon_gen
   ml_threaded_resolver_class_gen
   ml_threaded_resolver_gen
   ml_threaded_socket_service_class_gen
   ml_threaded_socket_service_gen
   ml_threaded_socket_service_private_gen
   ml_tls_backend_gen
   ml_tls_backend_interface_gen
   ml_tls_certificate_class_gen
   ml_tls_certificate_gen
   ml_tls_certificate_private_gen
   ml_tls_client_connection_gen
   ml_tls_client_connection_interface_gen
   ml_tls_connection_class_gen
   ml_tls_connection_gen
   ml_tls_connection_private_gen
   ml_tls_database_class_gen
   ml_tls_database_gen
   ml_tls_database_private_gen
   ml_tls_file_database_gen
   ml_tls_file_database_interface_gen
   ml_tls_interaction_class_gen
   ml_tls_interaction_gen
   ml_tls_interaction_private_gen
   ml_tls_password_class_gen
   ml_tls_password_gen
   ml_tls_password_private_gen
   ml_tls_server_connection_gen
   ml_tls_server_connection_interface_gen
   ml_unix_connection_class_gen
   ml_unix_connection_gen
   ml_unix_connection_private_gen
   ml_unix_credentials_message_class_gen
   ml_unix_credentials_message_gen
   ml_unix_credentials_message_private_gen
   ml_unix_fd_list_class_gen
   ml_unix_fd_list_gen
   ml_unix_fd_list_private_gen
   ml_unix_fd_message_class_gen
   ml_unix_fd_message_gen
   ml_unix_fd_message_private_gen
   ml_unix_input_stream_class_gen
   ml_unix_input_stream_gen
   ml_unix_input_stream_private_gen
   ml_unix_mount_entry_gen
   ml_unix_mount_monitor_class_gen
   ml_unix_mount_monitor_gen
   ml_unix_mount_point_gen
   ml_unix_output_stream_class_gen
   ml_unix_output_stream_gen
   ml_unix_output_stream_private_gen
   ml_unix_socket_address_class_gen
   ml_unix_socket_address_gen
   ml_unix_socket_address_private_gen
   ml_vfs_class_gen
   ml_vfs_gen
   ml_volume_gen
   ml_volume_iface_gen
   ml_volume_monitor_class_gen
   ml_volume_monitor_gen
   ml_zlib_compressor_class_gen
   ml_zlib_compressor_gen
   ml_zlib_decompressor_class_gen
   ml_zlib_decompressor_gen
  )
  (flags -fPIC -Igenerated -Icore -I../common (:include cflag-gio.sexp) -Wno-deprecated-declarations -Wno-incompatible-pointer-types -Wno-int-conversion))
 (c_library_flags (:include clink-gio.sexp)))
