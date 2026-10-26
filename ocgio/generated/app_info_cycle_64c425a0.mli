class type app_info_t = object
  method add_supports_type : string -> (bool, GError.t) result
  method can_delete : unit -> bool
  method can_remove_supports_type : unit -> bool
  method delete : unit -> bool
  method dup : unit -> app_info_t
  method equal : app_info_t -> bool
  method get_commandline : unit -> string option
  method get_description : unit -> string option
  method get_display_name : unit -> string
  method get_executable : unit -> string
  method get_icon : unit -> Icon.icon_t option
  method get_id : unit -> string option
  method get_name : unit -> string
  method get_supported_types : unit -> string array

  method launch :
    file_t list option -> app_launch_context_t option -> (bool, GError.t) result

  method launch_uris :
    string list option -> app_launch_context_t option -> (bool, GError.t) result

  method launch_uris_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method remove_supports_type : string -> (bool, GError.t) result
  method set_as_default_for_extension : string -> (bool, GError.t) result
  method set_as_default_for_type : string -> (bool, GError.t) result
  method set_as_last_used_for_type : string -> (bool, GError.t) result
  method should_show : unit -> bool
  method supports_files : unit -> bool
  method supports_uris : unit -> bool
  method as_app_info : Raw.App_info.t
end

and app_launch_context_t = object
  method on_launch_failed :
    ?after:bool ->
    callback:(startup_notify_id:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_launch_started :
    ?after:bool ->
    callback:(info:app_info_t -> platform_data:Gvariant.t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_launched :
    ?after:bool ->
    callback:(info:app_info_t -> platform_data:Gvariant.t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_display : app_info_t -> file_t list -> string option
  method get_environment : unit -> string array

  method get_startup_notify_id :
    app_info_t option -> file_t list option -> string option

  method launch_failed : string -> unit
  method setenv : string -> string -> unit
  method unsetenv : string -> unit
  method as_app_launch_context : Raw.App_launch_context.t
end

and drive_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_disconnected :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_eject_button :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_stop_button :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method can_eject : unit -> bool
  method can_poll_for_media : unit -> bool
  method can_start : unit -> bool
  method can_start_degraded : unit -> bool
  method can_stop : unit -> bool
  method eject_finish : Async_result.async_result_t -> (bool, GError.t) result

  method eject_with_operation_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method enumerate_identifiers : unit -> string array
  method get_icon : unit -> Icon.icon_t
  method get_identifier : string -> string option
  method get_name : unit -> string
  method get_sort_key : unit -> string option
  method get_start_stop_type : unit -> Enums.drivestartstoptype
  method get_symbolic_icon : unit -> Icon.icon_t
  method get_volumes : unit -> volume_t list
  method has_media : unit -> bool
  method has_volumes : unit -> bool
  method is_media_check_automatic : unit -> bool
  method is_media_removable : unit -> bool
  method is_removable : unit -> bool

  method poll_for_media_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method start_finish : Async_result.async_result_t -> (bool, GError.t) result
  method stop_finish : Async_result.async_result_t -> (bool, GError.t) result
  method as_drive : Raw.Drive.t
end

and file_t = object
  method append_to :
    Enums.filecreateflags ->
    Cancellable.cancellable_t option ->
    (File_output_stream.file_output_stream_t, GError.t) result

  method append_to_finish :
    Async_result.async_result_t ->
    (File_output_stream.file_output_stream_t, GError.t) result

  method build_attribute_list_for_copy :
    Enums.filecopyflags ->
    Cancellable.cancellable_t option ->
    (string, GError.t) result

  method copy_attributes :
    file_t ->
    Enums.filecopyflags ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result

  method copy_finish : Async_result.async_result_t -> (bool, GError.t) result

  method create :
    Enums.filecreateflags ->
    Cancellable.cancellable_t option ->
    (File_output_stream.file_output_stream_t, GError.t) result

  method create_finish :
    Async_result.async_result_t ->
    (File_output_stream.file_output_stream_t, GError.t) result

  method create_readwrite :
    Enums.filecreateflags ->
    Cancellable.cancellable_t option ->
    (File_io_stream.file_io_stream_t, GError.t) result

  method create_readwrite_finish :
    Async_result.async_result_t ->
    (File_io_stream.file_io_stream_t, GError.t) result

  method delete : Cancellable.cancellable_t option -> (bool, GError.t) result
  method delete_finish : Async_result.async_result_t -> (bool, GError.t) result
  method dup : unit -> file_t

  method eject_mountable_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method eject_mountable_with_operation_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method enumerate_children :
    string ->
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    (file_enumerator_t, GError.t) result

  method enumerate_children_finish :
    Async_result.async_result_t -> (file_enumerator_t, GError.t) result

  method equal : file_t -> bool

  method find_enclosing_mount :
    Cancellable.cancellable_t option -> (mount_t, GError.t) result

  method find_enclosing_mount_finish :
    Async_result.async_result_t -> (mount_t, GError.t) result

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

  method make_directory :
    Cancellable.cancellable_t option -> (bool, GError.t) result

  method make_directory_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method make_directory_with_parents :
    Cancellable.cancellable_t option -> (bool, GError.t) result

  method make_symbolic_link :
    string -> Cancellable.cancellable_t option -> (bool, GError.t) result

  method make_symbolic_link_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method monitor :
    Enums.filemonitorflags ->
    Cancellable.cancellable_t option ->
    (file_monitor_t, GError.t) result

  method monitor_directory :
    Enums.filemonitorflags ->
    Cancellable.cancellable_t option ->
    (file_monitor_t, GError.t) result

  method monitor_file :
    Enums.filemonitorflags ->
    Cancellable.cancellable_t option ->
    (file_monitor_t, GError.t) result

  method mount_enclosing_volume_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method mount_mountable_finish :
    Async_result.async_result_t -> (file_t, GError.t) result

  method move_finish : Async_result.async_result_t -> (bool, GError.t) result

  method open_readwrite :
    Cancellable.cancellable_t option ->
    (File_io_stream.file_io_stream_t, GError.t) result

  method open_readwrite_finish :
    Async_result.async_result_t ->
    (File_io_stream.file_io_stream_t, GError.t) result

  method peek_path : unit -> string option

  method poll_mountable_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method query_default_handler :
    Cancellable.cancellable_t option -> (app_info_t, GError.t) result

  method query_default_handler_finish :
    Async_result.async_result_t -> (app_info_t, GError.t) result

  method query_exists : Cancellable.cancellable_t option -> bool

  method query_file_type :
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    Enums.filetype

  method query_filesystem_info :
    string ->
    Cancellable.cancellable_t option ->
    (File_info.file_info_t, GError.t) result

  method query_filesystem_info_finish :
    Async_result.async_result_t -> (File_info.file_info_t, GError.t) result

  method query_info :
    string ->
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    (File_info.file_info_t, GError.t) result

  method query_info_finish :
    Async_result.async_result_t -> (File_info.file_info_t, GError.t) result

  method query_settable_attributes :
    Cancellable.cancellable_t option ->
    (Raw.File_attribute_info_list.t, GError.t) result

  method query_writable_namespaces :
    Cancellable.cancellable_t option ->
    (Raw.File_attribute_info_list.t, GError.t) result

  method read :
    Cancellable.cancellable_t option ->
    (File_input_stream.file_input_stream_t, GError.t) result

  method read_finish :
    Async_result.async_result_t ->
    (File_input_stream.file_input_stream_t, GError.t) result

  method replace :
    string option ->
    bool ->
    Enums.filecreateflags ->
    Cancellable.cancellable_t option ->
    (File_output_stream.file_output_stream_t, GError.t) result

  method replace_finish :
    Async_result.async_result_t ->
    (File_output_stream.file_output_stream_t, GError.t) result

  method replace_readwrite :
    string option ->
    bool ->
    Enums.filecreateflags ->
    Cancellable.cancellable_t option ->
    (File_io_stream.file_io_stream_t, GError.t) result

  method replace_readwrite_finish :
    Async_result.async_result_t ->
    (File_io_stream.file_io_stream_t, GError.t) result

  method resolve_relative_path : string -> file_t

  method set_attribute_byte_string :
    string ->
    string ->
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result

  method set_attribute_int32 :
    string ->
    Int32.t ->
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result

  method set_attribute_int64 :
    string ->
    int64 ->
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result

  method set_attribute_string :
    string ->
    string ->
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result

  method set_attribute_uint32 :
    string ->
    UInt32.t ->
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result

  method set_attribute_uint64 :
    string ->
    UInt64.t ->
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result

  method set_attributes_from_info :
    File_info.file_info_t ->
    Enums.filequeryinfoflags ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result

  method set_display_name :
    string -> Cancellable.cancellable_t option -> (file_t, GError.t) result

  method set_display_name_finish :
    Async_result.async_result_t -> (file_t, GError.t) result

  method start_mountable_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method stop_mountable_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method supports_thread_contexts : unit -> bool
  method trash : Cancellable.cancellable_t option -> (bool, GError.t) result
  method trash_finish : Async_result.async_result_t -> (bool, GError.t) result

  method unmount_mountable_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method unmount_mountable_with_operation_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method as_file : Raw.File.t
end

and file_enumerator_t = object
  method close : Cancellable.cancellable_t option -> (bool, GError.t) result
  method close_finish : Async_result.async_result_t -> (bool, GError.t) result
  method get_child : File_info.file_info_t -> file_t
  method get_container : unit -> file_t
  method has_pending : unit -> bool
  method is_closed : unit -> bool

  method next_file :
    Cancellable.cancellable_t option ->
    (File_info.file_info_t option, GError.t) result

  method next_files_finish :
    Async_result.async_result_t -> (File_info.file_info_t list, GError.t) result

  method set_pending : bool -> unit
  method as_file_enumerator : Raw.File_enumerator.t
end

and file_monitor_t = object
  method on_changed :
    ?after:bool ->
    callback:
      (file:file_t ->
      other_file:file_t option ->
      event_type:Enums.filemonitorevent ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method cancel : unit -> bool
  method emit_event : file_t -> file_t option -> Enums.filemonitorevent -> unit
  method is_cancelled : unit -> bool
  method set_rate_limit : int -> unit
  method as_file_monitor : Raw.File_monitor.t
end

and mount_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_pre_unmount :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_unmounted :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method can_eject : unit -> bool
  method can_unmount : unit -> bool
  method eject_finish : Async_result.async_result_t -> (bool, GError.t) result

  method eject_with_operation_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method get_default_location : unit -> file_t
  method get_drive : unit -> drive_t option
  method get_icon : unit -> Icon.icon_t
  method get_name : unit -> string
  method get_root : unit -> file_t
  method get_sort_key : unit -> string option
  method get_symbolic_icon : unit -> Icon.icon_t
  method get_uuid : unit -> string option
  method get_volume : unit -> volume_t option

  method guess_content_type_finish :
    Async_result.async_result_t -> (string array, GError.t) result

  method guess_content_type_sync :
    bool -> Cancellable.cancellable_t option -> (string array, GError.t) result

  method is_shadowed : unit -> bool
  method remount_finish : Async_result.async_result_t -> (bool, GError.t) result
  method shadow : unit -> unit
  method unmount_finish : Async_result.async_result_t -> (bool, GError.t) result

  method unmount_with_operation_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method unshadow : unit -> unit
  method as_mount : Raw.Mount.t
end

and volume_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_removed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method can_eject : unit -> bool
  method can_mount : unit -> bool
  method eject_finish : Async_result.async_result_t -> (bool, GError.t) result

  method eject_with_operation_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method enumerate_identifiers : unit -> string array
  method get_activation_root : unit -> file_t option
  method get_drive : unit -> drive_t option
  method get_icon : unit -> Icon.icon_t
  method get_identifier : string -> string option
  method get_mount : unit -> mount_t option
  method get_name : unit -> string
  method get_sort_key : unit -> string option
  method get_symbolic_icon : unit -> Icon.icon_t
  method get_uuid : unit -> string option
  method mount_finish : Async_result.async_result_t -> (bool, GError.t) result
  method should_automount : unit -> bool
  method as_volume : Raw.Volume.t
end

class app_info : Raw.App_info.t -> app_info_t

and app_launch_context : Raw.App_launch_context.t -> app_launch_context_t

and drive : Raw.Drive.t -> drive_t

and file : Raw.File.t -> file_t

and file_enumerator : Raw.File_enumerator.t -> file_enumerator_t

and file_monitor : Raw.File_monitor.t -> file_monitor_t

and mount : Raw.Mount.t -> mount_t

and volume : Raw.Volume.t -> volume_t

val new_ : unit -> app_launch_context_t
