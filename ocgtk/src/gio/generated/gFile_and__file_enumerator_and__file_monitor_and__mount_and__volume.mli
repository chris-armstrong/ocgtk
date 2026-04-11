
class type file_t = object
    method append_to : Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_output_stream.file_output_stream_t, GError.t) result
    method append_to_finish : GAsync_result.async_result_t -> (GFile_output_stream.file_output_stream_t, GError.t) result
    method build_attribute_list_for_copy : Gio_enums.filecopyflags -> GCancellable.cancellable_t option -> (string, GError.t) result
    method copy_attributes : file_t -> Gio_enums.filecopyflags -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method copy_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method create : Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_output_stream.file_output_stream_t, GError.t) result
    method create_finish : GAsync_result.async_result_t -> (GFile_output_stream.file_output_stream_t, GError.t) result
    method create_readwrite : Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_io_stream.file_io_stream_t, GError.t) result
    method create_readwrite_finish : GAsync_result.async_result_t -> (GFile_io_stream.file_io_stream_t, GError.t) result
    method delete : GCancellable.cancellable_t option -> (bool, GError.t) result
    method delete_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method dup : unit -> file_t
    method eject_mountable_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method eject_mountable_with_operation_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method enumerate_children : string -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (file_enumerator_t, GError.t) result
    method enumerate_children_finish : GAsync_result.async_result_t -> (file_enumerator_t, GError.t) result
    method equal : file_t -> bool
    method find_enclosing_mount : GCancellable.cancellable_t option -> (mount_t, GError.t) result
    method find_enclosing_mount_finish : GAsync_result.async_result_t -> (mount_t, GError.t) result
    method get_basename : unit -> string option
    method get_child : string -> file_t
    method get_child_for_display_name : string -> (file_t, GError.t) result
    method get_parent : unit -> file_t option
    method get_parse_name : unit -> string
    method get_path : unit -> string option
    method get_relative_path : file_t -> string option
    method get_uri : unit -> string
    method get_uri_scheme : unit -> string option
    method has_parent : file_t option -> bool
    method has_prefix : file_t -> bool
    method has_uri_scheme : string -> bool
    method hash : unit -> int
    method is_native : unit -> bool
    method make_directory : GCancellable.cancellable_t option -> (bool, GError.t) result
    method make_directory_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method make_directory_with_parents : GCancellable.cancellable_t option -> (bool, GError.t) result
    method make_symbolic_link : string -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method make_symbolic_link_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method monitor : Gio_enums.filemonitorflags -> GCancellable.cancellable_t option -> (file_monitor_t, GError.t) result
    method monitor_directory : Gio_enums.filemonitorflags -> GCancellable.cancellable_t option -> (file_monitor_t, GError.t) result
    method monitor_file : Gio_enums.filemonitorflags -> GCancellable.cancellable_t option -> (file_monitor_t, GError.t) result
    method mount_enclosing_volume_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method mount_mountable_finish : GAsync_result.async_result_t -> (file_t, GError.t) result
    method move_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method open_readwrite : GCancellable.cancellable_t option -> (GFile_io_stream.file_io_stream_t, GError.t) result
    method open_readwrite_finish : GAsync_result.async_result_t -> (GFile_io_stream.file_io_stream_t, GError.t) result
    method peek_path : unit -> string option
    method poll_mountable_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method query_default_handler : GCancellable.cancellable_t option -> (GApp_info_and__app_launch_context.app_info_t, GError.t) result
    method query_default_handler_finish : GAsync_result.async_result_t -> (GApp_info_and__app_launch_context.app_info_t, GError.t) result
    method query_exists : GCancellable.cancellable_t option -> bool
    method query_file_type : Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> Gio_enums.filetype
    method query_filesystem_info : string -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result
    method query_filesystem_info_finish : GAsync_result.async_result_t -> (GFile_info.file_info_t, GError.t) result
    method query_info : string -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result
    method query_info_finish : GAsync_result.async_result_t -> (GFile_info.file_info_t, GError.t) result
    method query_settable_attributes : GCancellable.cancellable_t option -> (File_attribute_info_list.t, GError.t) result
    method query_writable_namespaces : GCancellable.cancellable_t option -> (File_attribute_info_list.t, GError.t) result
    method read : GCancellable.cancellable_t option -> (GFile_input_stream.file_input_stream_t, GError.t) result
    method read_finish : GAsync_result.async_result_t -> (GFile_input_stream.file_input_stream_t, GError.t) result
    method replace : string option -> bool -> Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_output_stream.file_output_stream_t, GError.t) result
    method replace_finish : GAsync_result.async_result_t -> (GFile_output_stream.file_output_stream_t, GError.t) result
    method replace_readwrite : string option -> bool -> Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_io_stream.file_io_stream_t, GError.t) result
    method replace_readwrite_finish : GAsync_result.async_result_t -> (GFile_io_stream.file_io_stream_t, GError.t) result
    method resolve_relative_path : string -> file_t
    method set_attribute_byte_string : string -> string -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method set_attribute_int32 : string -> Int32.t -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method set_attribute_int64 : string -> int64 -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method set_attribute_string : string -> string -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method set_attribute_uint32 : string -> UInt32.t -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method set_attribute_uint64 : string -> UInt64.t -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method set_attributes_from_info : GFile_info.file_info_t -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method set_display_name : string -> GCancellable.cancellable_t option -> (file_t, GError.t) result
    method set_display_name_finish : GAsync_result.async_result_t -> (file_t, GError.t) result
    method start_mountable_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method stop_mountable_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method supports_thread_contexts : unit -> bool
    method trash : GCancellable.cancellable_t option -> (bool, GError.t) result
    method trash_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method unmount_mountable_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method unmount_mountable_with_operation_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method as_file : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t
end

and file_enumerator_t = object
    method close : GCancellable.cancellable_t option -> (bool, GError.t) result
    method close_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method get_child : GFile_info.file_info_t -> file_t
    method get_container : unit -> file_t
    method has_pending : unit -> bool
    method is_closed : unit -> bool
    method next_file : GCancellable.cancellable_t option -> (GFile_info.file_info_t option, GError.t) result
    method next_files_finish : GAsync_result.async_result_t -> (File_info.t list, GError.t) result
    method set_pending : bool -> unit
    method as_file_enumerator : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.t
end

and file_monitor_t = object
    inherit Gfile_monitor_signals.file_monitor_signals
    method cancel : unit -> bool
    method emit_event : file_t -> file_t -> Gio_enums.filemonitorevent -> unit
    method is_cancelled : unit -> bool
    method set_rate_limit : int -> unit
    method cancelled : bool
    method as_file_monitor : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.t
end

and mount_t = object
    inherit Gmount_signals.mount_signals
    method can_eject : unit -> bool
    method can_unmount : unit -> bool
    method eject_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method eject_with_operation_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method get_default_location : unit -> file_t
    method get_drive : unit -> GDrive.drive_t option
    method get_icon : unit -> GIcon.icon_t
    method get_name : unit -> string
    method get_root : unit -> file_t
    method get_sort_key : unit -> string option
    method get_symbolic_icon : unit -> GIcon.icon_t
    method get_uuid : unit -> string option
    method get_volume : unit -> volume_t option
    method guess_content_type_finish : GAsync_result.async_result_t -> (string array, GError.t) result
    method guess_content_type_sync : bool -> GCancellable.cancellable_t option -> (string array, GError.t) result
    method is_shadowed : unit -> bool
    method remount_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method shadow : unit -> unit
    method unmount_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method unmount_with_operation_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method unshadow : unit -> unit
    method as_mount : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.t
end

and volume_t = object
    inherit Gvolume_signals.volume_signals
    method can_eject : unit -> bool
    method can_mount : unit -> bool
    method eject_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method eject_with_operation_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method enumerate_identifiers : unit -> string array
    method get_activation_root : unit -> file_t option
    method get_drive : unit -> GDrive.drive_t option
    method get_icon : unit -> GIcon.icon_t
    method get_identifier : string -> string option
    method get_mount : unit -> mount_t option
    method get_name : unit -> string
    method get_sort_key : unit -> string option
    method get_symbolic_icon : unit -> GIcon.icon_t
    method get_uuid : unit -> string option
    method mount_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method should_automount : unit -> bool
    method as_volume : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.t
end


class file : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t -> file_t

and file_enumerator : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.t -> file_enumerator_t

and file_monitor : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.t -> file_monitor_t

and mount : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.t -> mount_t

and volume : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.t -> volume_t
