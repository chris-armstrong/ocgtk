(* GENERATED CODE - DO NOT EDIT *)
(* Top-level library module with direct references to all classes and enumerations *)

(** Layer 1 Module Wrappers *)
module Wrappers = struct
  module Action = Action
  module Action_entry = Action_entry
  module Action_group = Action_group
  module Action_map = Action_map

  module App_info =
    App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
    .App_info

  module App_info_monitor = App_info_monitor

  module App_launch_context =
    App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
    .App_launch_context

  module Application = Application
  module Application_command_line = Application_command_line
  module Async_initable = Async_initable
  module Async_result = Async_result
  module Buffered_input_stream = Buffered_input_stream
  module Buffered_output_stream = Buffered_output_stream
  module Bytes_icon = Bytes_icon
  module Cancellable = Cancellable
  module Charset_converter = Charset_converter
  module Converter = Converter
  module Converter_input_stream = Converter_input_stream
  module Converter_output_stream = Converter_output_stream
  module Credentials = Credentials
  module D_bus_action_group = D_bus_action_group
  module D_bus_annotation_info = D_bus_annotation_info
  module D_bus_arg_info = D_bus_arg_info
  module D_bus_auth_observer = D_bus_auth_observer
  module D_bus_connection = D_bus_connection
  module D_bus_error_entry = D_bus_error_entry
  module D_bus_interface = D_bus_interface_and__d_bus_object.D_bus_interface
  module D_bus_interface_info = D_bus_interface_info
  module D_bus_interface_skeleton = D_bus_interface_skeleton
  module D_bus_interface_v_table = D_bus_interface_v_table
  module D_bus_menu_model = D_bus_menu_model
  module D_bus_message = D_bus_message
  module D_bus_method_info = D_bus_method_info
  module D_bus_method_invocation = D_bus_method_invocation
  module D_bus_node_info = D_bus_node_info
  module D_bus_object = D_bus_interface_and__d_bus_object.D_bus_object
  module D_bus_object_manager = D_bus_object_manager
  module D_bus_object_manager_client = D_bus_object_manager_client
  module D_bus_object_manager_server = D_bus_object_manager_server
  module D_bus_object_proxy = D_bus_object_proxy
  module D_bus_object_skeleton = D_bus_object_skeleton
  module D_bus_property_info = D_bus_property_info
  module D_bus_proxy = D_bus_proxy
  module D_bus_server = D_bus_server
  module D_bus_signal_info = D_bus_signal_info
  module D_bus_subtree_v_table = D_bus_subtree_v_table
  module Data_input_stream = Data_input_stream
  module Data_output_stream = Data_output_stream
  module Datagram_based = Datagram_based
  module Debug_controller = Debug_controller
  module Debug_controller_d_bus = Debug_controller_d_bus
  module Desktop_app_info = Desktop_app_info
  module Desktop_app_info_lookup = Desktop_app_info_lookup

  module Drive =
    App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
    .Drive

  module Dtls_client_connection = Dtls_client_connection
  module Dtls_connection = Dtls_connection
  module Dtls_server_connection = Dtls_server_connection
  module Emblem = Emblem
  module Emblemed_icon = Emblemed_icon

  module File =
    App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
    .File

  module File_attribute_info = File_attribute_info
  module File_attribute_info_list = File_attribute_info_list
  module File_attribute_matcher = File_attribute_matcher
  module File_descriptor_based = File_descriptor_based

  module File_enumerator =
    App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
    .File_enumerator

  module File_io_stream = File_io_stream
  module File_icon = File_icon
  module File_info = File_info
  module File_input_stream = File_input_stream

  module File_monitor =
    App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
    .File_monitor

  module File_output_stream = File_output_stream
  module Filename_completer = Filename_completer
  module Filter_input_stream = Filter_input_stream
  module Filter_output_stream = Filter_output_stream
  module Io_extension = Io_extension
  module Io_extension_point = Io_extension_point
  module Io_module = Io_module
  module Io_module_scope = Io_module_scope
  module Io_scheduler_job = Io_scheduler_job
  module Io_stream = Io_stream
  module Io_stream_adapter = Io_stream_adapter
  module Icon = Icon
  module Inet_address = Inet_address
  module Inet_address_mask = Inet_address_mask
  module Inet_socket_address = Inet_socket_address
  module Initable = Initable
  module Input_message = Input_message
  module Input_stream = Input_stream
  module Input_vector = Input_vector
  module List_model = List_model
  module List_store = List_store
  module Loadable_icon = Loadable_icon
  module Memory_input_stream = Memory_input_stream
  module Memory_monitor = Memory_monitor
  module Memory_output_stream = Memory_output_stream
  module Menu = Menu
  module Menu_attribute_iter = Menu_attribute_iter
  module Menu_item = Menu_item
  module Menu_link_iter = Menu_link_iter_and__menu_model.Menu_link_iter
  module Menu_model = Menu_link_iter_and__menu_model.Menu_model

  module Mount =
    App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
    .Mount

  module Mount_operation = Mount_operation
  module Native_socket_address = Native_socket_address
  module Native_volume_monitor = Native_volume_monitor
  module Network_address = Network_address
  module Network_monitor = Network_monitor
  module Network_service = Network_service
  module Notification = Notification
  module Output_message = Output_message
  module Output_stream = Output_stream
  module Output_vector = Output_vector
  module Permission = Permission
  module Pollable_input_stream = Pollable_input_stream
  module Pollable_output_stream = Pollable_output_stream
  module Power_profile_monitor = Power_profile_monitor
  module Property_action = Property_action
  module Proxy = Proxy
  module Proxy_address = Proxy_address
  module Proxy_address_enumerator = Proxy_address_enumerator
  module Proxy_resolver = Proxy_resolver
  module Remote_action_group = Remote_action_group
  module Resolver = Resolver
  module Resource = Resource
  module Seekable = Seekable
  module Settings = Settings
  module Settings_schema = Settings_schema
  module Settings_schema_key = Settings_schema_key
  module Settings_schema_source = Settings_schema_source
  module Simple_action = Simple_action
  module Simple_action_group = Simple_action_group
  module Simple_async_result = Simple_async_result
  module Simple_io_stream = Simple_io_stream
  module Simple_permission = Simple_permission
  module Simple_proxy_resolver = Simple_proxy_resolver
  module Socket = Socket_and__socket_connection.Socket

  module Socket_address =
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .Socket_address

  module Socket_address_enumerator =
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .Socket_address_enumerator

  module Socket_client = Socket_client

  module Socket_connectable =
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .Socket_connectable

  module Socket_connection = Socket_and__socket_connection.Socket_connection
  module Socket_control_message = Socket_control_message
  module Socket_listener = Socket_listener
  module Socket_service = Socket_service
  module Srv_target = Srv_target
  module Static_resource = Static_resource
  module Subprocess = Subprocess
  module Subprocess_launcher = Subprocess_launcher
  module Task = Task
  module Tcp_connection = Tcp_connection
  module Tcp_wrapper_connection = Tcp_wrapper_connection
  module Test_d_bus = Test_d_bus
  module Themed_icon = Themed_icon
  module Threaded_resolver = Threaded_resolver
  module Threaded_socket_service = Threaded_socket_service
  module Tls_backend = Tls_backend
  module Tls_certificate = Tls_certificate
  module Tls_client_connection = Tls_client_connection

  module Tls_connection =
    Tls_connection_and__tls_database_and__tls_interaction.Tls_connection

  module Tls_database =
    Tls_connection_and__tls_database_and__tls_interaction.Tls_database

  module Tls_file_database = Tls_file_database

  module Tls_interaction =
    Tls_connection_and__tls_database_and__tls_interaction.Tls_interaction

  module Tls_password = Tls_password
  module Tls_server_connection = Tls_server_connection
  module Unix_connection = Unix_connection
  module Unix_credentials_message = Unix_credentials_message
  module Unix_fd_list = Unix_fd_list
  module Unix_fd_message = Unix_fd_message
  module Unix_input_stream = Unix_input_stream
  module Unix_mount_entry = Unix_mount_entry
  module Unix_mount_monitor = Unix_mount_monitor
  module Unix_mount_point = Unix_mount_point
  module Unix_output_stream = Unix_output_stream
  module Unix_socket_address = Unix_socket_address
  module Vfs = Vfs

  module Volume =
    App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
    .Volume

  module Volume_monitor = Volume_monitor
  module Zlib_compressor = Zlib_compressor
  module Zlib_decompressor = Zlib_decompressor
end

(** Classes and Interfaces *)

module Action = GAction
module Action_entry = GAction_entry
module Action_group = GAction_group
module Action_map = GAction_map
module App_info = GApp_info
module App_info_monitor = GApp_info_monitor
module App_launch_context = GApp_launch_context
module Application = GApplication
module Application_command_line = GApplication_command_line
module Async_initable = GAsync_initable
module Async_result = GAsync_result
module Buffered_input_stream = GBuffered_input_stream
module Buffered_output_stream = GBuffered_output_stream
module Bytes_icon = GBytes_icon
module Cancellable = GCancellable
module Charset_converter = GCharset_converter
module Converter = GConverter
module Converter_input_stream = GConverter_input_stream
module Converter_output_stream = GConverter_output_stream
module Credentials = GCredentials
module D_bus_action_group = GD_bus_action_group
module D_bus_annotation_info = GD_bus_annotation_info
module D_bus_arg_info = GD_bus_arg_info
module D_bus_auth_observer = GD_bus_auth_observer
module D_bus_connection = GD_bus_connection
module D_bus_error_entry = GD_bus_error_entry
module D_bus_interface = GD_bus_interface
module D_bus_interface_info = GD_bus_interface_info
module D_bus_interface_skeleton = GD_bus_interface_skeleton
module D_bus_interface_v_table = GD_bus_interface_v_table
module D_bus_menu_model = GD_bus_menu_model
module D_bus_message = GD_bus_message
module D_bus_method_info = GD_bus_method_info
module D_bus_method_invocation = GD_bus_method_invocation
module D_bus_node_info = GD_bus_node_info
module D_bus_object = GD_bus_object
module D_bus_object_manager = GD_bus_object_manager
module D_bus_object_manager_client = GD_bus_object_manager_client
module D_bus_object_manager_server = GD_bus_object_manager_server
module D_bus_object_proxy = GD_bus_object_proxy
module D_bus_object_skeleton = GD_bus_object_skeleton
module D_bus_property_info = GD_bus_property_info
module D_bus_proxy = GD_bus_proxy
module D_bus_server = GD_bus_server
module D_bus_signal_info = GD_bus_signal_info
module D_bus_subtree_v_table = GD_bus_subtree_v_table
module Data_input_stream = GData_input_stream
module Data_output_stream = GData_output_stream
module Datagram_based = GDatagram_based
module Debug_controller = GDebug_controller
module Debug_controller_d_bus = GDebug_controller_d_bus
module Desktop_app_info = GDesktop_app_info
module Desktop_app_info_lookup = GDesktop_app_info_lookup
module Drive = GDrive
module Dtls_client_connection = GDtls_client_connection
module Dtls_connection = GDtls_connection
module Dtls_server_connection = GDtls_server_connection
module Emblem = GEmblem
module Emblemed_icon = GEmblemed_icon
module File = GFile
module File_attribute_info = GFile_attribute_info
module File_attribute_info_list = GFile_attribute_info_list
module File_attribute_matcher = GFile_attribute_matcher
module File_descriptor_based = GFile_descriptor_based
module File_enumerator = GFile_enumerator
module File_io_stream = GFile_io_stream
module File_icon = GFile_icon
module File_info = GFile_info
module File_input_stream = GFile_input_stream
module File_monitor = GFile_monitor
module File_output_stream = GFile_output_stream
module Filename_completer = GFilename_completer
module Filter_input_stream = GFilter_input_stream
module Filter_output_stream = GFilter_output_stream
module Io_extension = GIo_extension
module Io_extension_point = GIo_extension_point
module Io_module = GIo_module
module Io_module_scope = GIo_module_scope
module Io_scheduler_job = GIo_scheduler_job
module Io_stream = GIo_stream
module Io_stream_adapter = GIo_stream_adapter
module Icon = GIcon
module Inet_address = GInet_address
module Inet_address_mask = GInet_address_mask
module Inet_socket_address = GInet_socket_address
module Initable = GInitable
module Input_message = GInput_message
module Input_stream = GInput_stream
module Input_vector = GInput_vector
module List_model = GList_model
module List_store = GList_store
module Loadable_icon = GLoadable_icon
module Memory_input_stream = GMemory_input_stream
module Memory_monitor = GMemory_monitor
module Memory_output_stream = GMemory_output_stream
module Menu = GMenu
module Menu_attribute_iter = GMenu_attribute_iter
module Menu_item = GMenu_item
module Menu_link_iter = GMenu_link_iter
module Menu_model = GMenu_model
module Mount = GMount
module Mount_operation = GMount_operation
module Native_socket_address = GNative_socket_address
module Native_volume_monitor = GNative_volume_monitor
module Network_address = GNetwork_address
module Network_monitor = GNetwork_monitor
module Network_service = GNetwork_service
module Notification = GNotification
module Output_message = GOutput_message
module Output_stream = GOutput_stream
module Output_vector = GOutput_vector
module Permission = GPermission
module Pollable_input_stream = GPollable_input_stream
module Pollable_output_stream = GPollable_output_stream
module Power_profile_monitor = GPower_profile_monitor
module Property_action = GProperty_action
module Proxy = GProxy
module Proxy_address = GProxy_address
module Proxy_address_enumerator = GProxy_address_enumerator
module Proxy_resolver = GProxy_resolver
module Remote_action_group = GRemote_action_group
module Resolver = GResolver
module Resource = GResource
module Seekable = GSeekable
module Settings = GSettings
module Settings_schema = GSettings_schema
module Settings_schema_key = GSettings_schema_key
module Settings_schema_source = GSettings_schema_source
module Simple_action = GSimple_action
module Simple_action_group = GSimple_action_group
module Simple_async_result = GSimple_async_result
module Simple_io_stream = GSimple_io_stream
module Simple_permission = GSimple_permission
module Simple_proxy_resolver = GSimple_proxy_resolver
module Socket = GSocket
module Socket_address = GSocket_address
module Socket_address_enumerator = GSocket_address_enumerator
module Socket_client = GSocket_client
module Socket_connectable = GSocket_connectable
module Socket_connection = GSocket_connection
module Socket_control_message = GSocket_control_message
module Socket_listener = GSocket_listener
module Socket_service = GSocket_service
module Srv_target = GSrv_target
module Static_resource = GStatic_resource
module Subprocess = GSubprocess
module Subprocess_launcher = GSubprocess_launcher
module Task = GTask
module Tcp_connection = GTcp_connection
module Tcp_wrapper_connection = GTcp_wrapper_connection
module Test_d_bus = GTest_d_bus
module Themed_icon = GThemed_icon
module Threaded_resolver = GThreaded_resolver
module Threaded_socket_service = GThreaded_socket_service
module Tls_backend = GTls_backend
module Tls_certificate = GTls_certificate
module Tls_client_connection = GTls_client_connection
module Tls_connection = GTls_connection
module Tls_database = GTls_database
module Tls_file_database = GTls_file_database
module Tls_interaction = GTls_interaction
module Tls_password = GTls_password
module Tls_server_connection = GTls_server_connection
module Unix_connection = GUnix_connection
module Unix_credentials_message = GUnix_credentials_message
module Unix_fd_list = GUnix_fd_list
module Unix_fd_message = GUnix_fd_message
module Unix_input_stream = GUnix_input_stream
module Unix_mount_entry = GUnix_mount_entry
module Unix_mount_monitor = GUnix_mount_monitor
module Unix_mount_point = GUnix_mount_point
module Unix_output_stream = GUnix_output_stream
module Unix_socket_address = GUnix_socket_address
module Vfs = GVfs
module Volume = GVolume
module Volume_monitor = GVolume_monitor
module Zlib_compressor = GZlib_compressor
module Zlib_decompressor = GZlib_decompressor

(** Enumerations and Bitfields *)

type bustype = Gio_enums.bustype
type converterresult = Gio_enums.converterresult
type credentialstype = Gio_enums.credentialstype
type dbuserror = Gio_enums.dbuserror
type dbusmessagebyteorder = Gio_enums.dbusmessagebyteorder
type dbusmessageheaderfield = Gio_enums.dbusmessageheaderfield
type dbusmessagetype = Gio_enums.dbusmessagetype
type datastreambyteorder = Gio_enums.datastreambyteorder
type datastreamnewlinetype = Gio_enums.datastreamnewlinetype
type drivestartstoptype = Gio_enums.drivestartstoptype
type emblemorigin = Gio_enums.emblemorigin
type fileattributestatus = Gio_enums.fileattributestatus
type fileattributetype = Gio_enums.fileattributetype
type filemonitorevent = Gio_enums.filemonitorevent
type filetype = Gio_enums.filetype
type filesystempreviewtype = Gio_enums.filesystempreviewtype
type ioerrorenum = Gio_enums.ioerrorenum
type iomodulescopeflags = Gio_enums.iomodulescopeflags
type memorymonitorwarninglevel = Gio_enums.memorymonitorwarninglevel
type mountoperationresult = Gio_enums.mountoperationresult
type networkconnectivity = Gio_enums.networkconnectivity
type notificationpriority = Gio_enums.notificationpriority
type passwordsave = Gio_enums.passwordsave
type pollablereturn = Gio_enums.pollablereturn
type resolvererror = Gio_enums.resolvererror
type resolverrecordtype = Gio_enums.resolverrecordtype
type resourceerror = Gio_enums.resourceerror
type socketclientevent = Gio_enums.socketclientevent
type socketfamily = Gio_enums.socketfamily
type socketlistenerevent = Gio_enums.socketlistenerevent
type socketprotocol = Gio_enums.socketprotocol
type sockettype = Gio_enums.sockettype
type tlsauthenticationmode = Gio_enums.tlsauthenticationmode
type tlscertificaterequestflags = Gio_enums.tlscertificaterequestflags
type tlschannelbindingerror = Gio_enums.tlschannelbindingerror
type tlschannelbindingtype = Gio_enums.tlschannelbindingtype
type tlsdatabaselookupflags = Gio_enums.tlsdatabaselookupflags
type tlserror = Gio_enums.tlserror
type tlsinteractionresult = Gio_enums.tlsinteractionresult
type tlsprotocolversion = Gio_enums.tlsprotocolversion
type tlsrehandshakemode = Gio_enums.tlsrehandshakemode
type unixsocketaddresstype = Gio_enums.unixsocketaddresstype
type zlibcompressorformat = Gio_enums.zlibcompressorformat
type appinfocreateflags = Gio_enums.appinfocreateflags
type applicationflags = Gio_enums.applicationflags
type askpasswordflags = Gio_enums.askpasswordflags
type busnameownerflags = Gio_enums.busnameownerflags
type busnamewatcherflags = Gio_enums.busnamewatcherflags
type converterflags = Gio_enums.converterflags
type dbuscallflags = Gio_enums.dbuscallflags
type dbuscapabilityflags = Gio_enums.dbuscapabilityflags
type dbusconnectionflags = Gio_enums.dbusconnectionflags
type dbusinterfaceskeletonflags = Gio_enums.dbusinterfaceskeletonflags
type dbusmessageflags = Gio_enums.dbusmessageflags
type dbusobjectmanagerclientflags = Gio_enums.dbusobjectmanagerclientflags
type dbuspropertyinfoflags = Gio_enums.dbuspropertyinfoflags
type dbusproxyflags = Gio_enums.dbusproxyflags
type dbussendmessageflags = Gio_enums.dbussendmessageflags
type dbusserverflags = Gio_enums.dbusserverflags
type dbussignalflags = Gio_enums.dbussignalflags
type dbussubtreeflags = Gio_enums.dbussubtreeflags
type drivestartflags = Gio_enums.drivestartflags
type fileattributeinfoflags = Gio_enums.fileattributeinfoflags
type filecopyflags = Gio_enums.filecopyflags
type filecreateflags = Gio_enums.filecreateflags
type filemeasureflags = Gio_enums.filemeasureflags
type filemonitorflags = Gio_enums.filemonitorflags
type filequeryinfoflags = Gio_enums.filequeryinfoflags
type iostreamspliceflags = Gio_enums.iostreamspliceflags
type mountmountflags = Gio_enums.mountmountflags
type mountunmountflags = Gio_enums.mountunmountflags
type outputstreamspliceflags = Gio_enums.outputstreamspliceflags
type resolvernamelookupflags = Gio_enums.resolvernamelookupflags
type resourceflags = Gio_enums.resourceflags
type resourcelookupflags = Gio_enums.resourcelookupflags
type settingsbindflags = Gio_enums.settingsbindflags
type socketmsgflags = Gio_enums.socketmsgflags
type subprocessflags = Gio_enums.subprocessflags
type testdbusflags = Gio_enums.testdbusflags
type tlscertificateflags = Gio_enums.tlscertificateflags
type tlsdatabaseverifyflags = Gio_enums.tlsdatabaseverifyflags
type tlspasswordflags = Gio_enums.tlspasswordflags
