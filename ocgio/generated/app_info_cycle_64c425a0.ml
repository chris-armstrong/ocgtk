(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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

class app_info (obj : Raw.App_info.t) : app_info_t =
  object (self)
    method add_supports_type : string -> (bool, GError.t) result =
      fun content_type -> Raw.App_info.add_supports_type obj content_type

    method can_delete : unit -> bool = fun () -> Raw.App_info.can_delete obj

    method can_remove_supports_type : unit -> bool =
      fun () -> Raw.App_info.can_remove_supports_type obj

    method delete : unit -> bool = fun () -> Raw.App_info.delete obj

    method dup : unit -> app_info_t =
      fun () -> new app_info (Raw.App_info.dup obj)

    method equal : app_info_t -> bool =
      fun appinfo2 ->
        let appinfo2 = appinfo2#as_app_info in
        Raw.App_info.equal obj appinfo2

    method get_commandline : unit -> string option =
      fun () -> Raw.App_info.get_commandline obj

    method get_description : unit -> string option =
      fun () -> Raw.App_info.get_description obj

    method get_display_name : unit -> string =
      fun () -> Raw.App_info.get_display_name obj

    method get_executable : unit -> string =
      fun () -> Raw.App_info.get_executable obj

    method get_icon : unit -> Icon.icon_t option =
      fun () ->
        Option.map (fun ret -> new Icon.icon ret) (Raw.App_info.get_icon obj)

    method get_id : unit -> string option = fun () -> Raw.App_info.get_id obj
    method get_name : unit -> string = fun () -> Raw.App_info.get_name obj

    method get_supported_types : unit -> string array =
      fun () -> Raw.App_info.get_supported_types obj

    method launch :
        file_t list option ->
        app_launch_context_t option ->
        (bool, GError.t) result =
      fun files context ->
        let files = Option.map (List.map (fun c -> c#as_file)) files in
        let context = Option.map (fun c -> c#as_app_launch_context) context in
        Raw.App_info.launch obj files context

    method launch_uris :
        string list option ->
        app_launch_context_t option ->
        (bool, GError.t) result =
      fun uris context ->
        let context = Option.map (fun c -> c#as_app_launch_context) context in
        Raw.App_info.launch_uris obj uris context

    method launch_uris_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.App_info.launch_uris_finish obj result

    method remove_supports_type : string -> (bool, GError.t) result =
      fun content_type -> Raw.App_info.remove_supports_type obj content_type

    method set_as_default_for_extension : string -> (bool, GError.t) result =
      fun extension -> Raw.App_info.set_as_default_for_extension obj extension

    method set_as_default_for_type : string -> (bool, GError.t) result =
      fun content_type -> Raw.App_info.set_as_default_for_type obj content_type

    method set_as_last_used_for_type : string -> (bool, GError.t) result =
      fun content_type ->
        Raw.App_info.set_as_last_used_for_type obj content_type

    method should_show : unit -> bool = fun () -> Raw.App_info.should_show obj

    method supports_files : unit -> bool =
      fun () -> Raw.App_info.supports_files obj

    method supports_uris : unit -> bool =
      fun () -> Raw.App_info.supports_uris obj

    method as_app_info = obj
  end

and app_launch_context (obj : Raw.App_launch_context.t) : app_launch_context_t =
  object (self)
    method on_launch_failed ?(after = false) ~callback () =
      Raw.App_launch_context.on_launch_failed ~after self#as_app_launch_context
        ~callback

    method on_launch_started ?(after = false) ~callback () =
      Raw.App_launch_context.on_launch_started ~after self#as_app_launch_context
        ~callback:(fun ~info ~platform_data ->
          callback ~info:(new app_info info) ~platform_data)

    method on_launched ?(after = false) ~callback () =
      Raw.App_launch_context.on_launched ~after self#as_app_launch_context
        ~callback:(fun ~info ~platform_data ->
          callback ~info:(new app_info info) ~platform_data)

    method get_display : app_info_t -> file_t list -> string option =
      fun info files ->
        let info = info#as_app_info in
        let files = (List.map (fun c -> c#as_file)) files in
        Raw.App_launch_context.get_display obj info files

    method get_environment : unit -> string array =
      fun () -> Raw.App_launch_context.get_environment obj

    method get_startup_notify_id :
        app_info_t option -> file_t list option -> string option =
      fun info files ->
        let info = Option.map (fun c -> c#as_app_info) info in
        let files = Option.map (List.map (fun c -> c#as_file)) files in
        Raw.App_launch_context.get_startup_notify_id obj info files

    method launch_failed : string -> unit =
      fun startup_notify_id ->
        Raw.App_launch_context.launch_failed obj startup_notify_id

    method setenv : string -> string -> unit =
      fun variable value -> Raw.App_launch_context.setenv obj variable value

    method unsetenv : string -> unit =
      fun variable -> Raw.App_launch_context.unsetenv obj variable

    method as_app_launch_context = obj
  end

and drive (obj : Raw.Drive.t) : drive_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.Drive.on_changed ~after self#as_drive ~callback

    method on_disconnected ?(after = false) ~callback () =
      Raw.Drive.on_disconnected ~after self#as_drive ~callback

    method on_eject_button ?(after = false) ~callback () =
      Raw.Drive.on_eject_button ~after self#as_drive ~callback

    method on_stop_button ?(after = false) ~callback () =
      Raw.Drive.on_stop_button ~after self#as_drive ~callback

    method can_eject : unit -> bool = fun () -> Raw.Drive.can_eject obj

    method can_poll_for_media : unit -> bool =
      fun () -> Raw.Drive.can_poll_for_media obj

    method can_start : unit -> bool = fun () -> Raw.Drive.can_start obj

    method can_start_degraded : unit -> bool =
      fun () -> Raw.Drive.can_start_degraded obj

    method can_stop : unit -> bool = fun () -> Raw.Drive.can_stop obj

    method eject_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Drive.eject_finish obj result

    method eject_with_operation_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Drive.eject_with_operation_finish obj result

    method enumerate_identifiers : unit -> string array =
      fun () -> Raw.Drive.enumerate_identifiers obj

    method get_icon : unit -> Icon.icon_t =
      fun () -> new Icon.icon (Raw.Drive.get_icon obj)

    method get_identifier : string -> string option =
      fun kind -> Raw.Drive.get_identifier obj kind

    method get_name : unit -> string = fun () -> Raw.Drive.get_name obj

    method get_sort_key : unit -> string option =
      fun () -> Raw.Drive.get_sort_key obj

    method get_start_stop_type : unit -> Enums.drivestartstoptype =
      fun () -> Raw.Drive.get_start_stop_type obj

    method get_symbolic_icon : unit -> Icon.icon_t =
      fun () -> new Icon.icon (Raw.Drive.get_symbolic_icon obj)

    method get_volumes : unit -> volume_t list =
      fun () ->
        (List.map (fun ret -> new volume ret)) (Raw.Drive.get_volumes obj)

    method has_media : unit -> bool = fun () -> Raw.Drive.has_media obj
    method has_volumes : unit -> bool = fun () -> Raw.Drive.has_volumes obj

    method is_media_check_automatic : unit -> bool =
      fun () -> Raw.Drive.is_media_check_automatic obj

    method is_media_removable : unit -> bool =
      fun () -> Raw.Drive.is_media_removable obj

    method is_removable : unit -> bool = fun () -> Raw.Drive.is_removable obj

    method poll_for_media_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Drive.poll_for_media_finish obj result

    method start_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Drive.start_finish obj result

    method stop_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Drive.stop_finish obj result

    method as_drive = obj
  end

and file (obj : Raw.File.t) : file_t =
  object (self)
    method append_to :
        Enums.filecreateflags ->
        Cancellable.cancellable_t option ->
        (File_output_stream.file_output_stream_t, GError.t) result =
      fun flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new File_output_stream.file_output_stream ret)
          (Raw.File.append_to obj flags cancellable)

    method append_to_finish :
        Async_result.async_result_t ->
        (File_output_stream.file_output_stream_t, GError.t) result =
      fun res ->
        let res = res#as_async_result in
        Result.map
          (fun ret -> new File_output_stream.file_output_stream ret)
          (Raw.File.append_to_finish obj res)

    method build_attribute_list_for_copy :
        Enums.filecopyflags ->
        Cancellable.cancellable_t option ->
        (string, GError.t) result =
      fun flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File.build_attribute_list_for_copy obj flags cancellable

    method copy_attributes :
        file_t ->
        Enums.filecopyflags ->
        Cancellable.cancellable_t option ->
        (bool, GError.t) result =
      fun destination flags cancellable ->
        let destination = destination#as_file in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File.copy_attributes obj destination flags cancellable

    method copy_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun res ->
        let res = res#as_async_result in
        Raw.File.copy_finish obj res

    method create :
        Enums.filecreateflags ->
        Cancellable.cancellable_t option ->
        (File_output_stream.file_output_stream_t, GError.t) result =
      fun flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new File_output_stream.file_output_stream ret)
          (Raw.File.create obj flags cancellable)

    method create_finish :
        Async_result.async_result_t ->
        (File_output_stream.file_output_stream_t, GError.t) result =
      fun res ->
        let res = res#as_async_result in
        Result.map
          (fun ret -> new File_output_stream.file_output_stream ret)
          (Raw.File.create_finish obj res)

    method create_readwrite :
        Enums.filecreateflags ->
        Cancellable.cancellable_t option ->
        (File_io_stream.file_io_stream_t, GError.t) result =
      fun flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new File_io_stream.file_io_stream ret)
          (Raw.File.create_readwrite obj flags cancellable)

    method create_readwrite_finish :
        Async_result.async_result_t ->
        (File_io_stream.file_io_stream_t, GError.t) result =
      fun res ->
        let res = res#as_async_result in
        Result.map
          (fun ret -> new File_io_stream.file_io_stream ret)
          (Raw.File.create_readwrite_finish obj res)

    method delete : Cancellable.cancellable_t option -> (bool, GError.t) result
        =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File.delete obj cancellable

    method delete_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.File.delete_finish obj result

    method dup : unit -> file_t = fun () -> new file (Raw.File.dup obj)

    method eject_mountable_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.File.eject_mountable_finish obj result

    method eject_mountable_with_operation_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.File.eject_mountable_with_operation_finish obj result

    method enumerate_children :
        string ->
        Enums.filequeryinfoflags ->
        Cancellable.cancellable_t option ->
        (file_enumerator_t, GError.t) result =
      fun attributes flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new file_enumerator ret)
          (Raw.File.enumerate_children obj attributes flags cancellable)

    method enumerate_children_finish :
        Async_result.async_result_t -> (file_enumerator_t, GError.t) result =
      fun res ->
        let res = res#as_async_result in
        Result.map
          (fun ret -> new file_enumerator ret)
          (Raw.File.enumerate_children_finish obj res)

    method equal : file_t -> bool =
      fun file2 ->
        let file2 = file2#as_file in
        Raw.File.equal obj file2

    method find_enclosing_mount :
        Cancellable.cancellable_t option -> (mount_t, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new mount ret)
          (Raw.File.find_enclosing_mount obj cancellable)

    method find_enclosing_mount_finish :
        Async_result.async_result_t -> (mount_t, GError.t) result =
      fun res ->
        let res = res#as_async_result in
        Result.map
          (fun ret -> new mount ret)
          (Raw.File.find_enclosing_mount_finish obj res)

    method get_basename : unit -> string option =
      fun () -> Raw.File.get_basename obj

    method get_child : string -> file_t =
      fun name -> new file (Raw.File.get_child obj name)

    method get_child_for_display_name : string -> (file_t, GError.t) result =
      fun display_name ->
        Result.map
          (fun ret -> new file ret)
          (Raw.File.get_child_for_display_name obj display_name)

    method get_parent : unit -> file_t option =
      fun () -> Option.map (fun ret -> new file ret) (Raw.File.get_parent obj)

    method get_parse_name : unit -> string =
      fun () -> Raw.File.get_parse_name obj

    method get_path : unit -> string option = fun () -> Raw.File.get_path obj

    method get_relative_path : file_t -> string option =
      fun descendant ->
        let descendant = descendant#as_file in
        Raw.File.get_relative_path obj descendant

    method get_uri : unit -> string = fun () -> Raw.File.get_uri obj

    method get_uri_scheme : unit -> string option =
      fun () -> Raw.File.get_uri_scheme obj

    method has_parent : file_t option -> bool =
      fun parent ->
        let parent = Option.map (fun c -> c#as_file) parent in
        Raw.File.has_parent obj parent

    method has_prefix : file_t -> bool =
      fun prefix ->
        let prefix = prefix#as_file in
        Raw.File.has_prefix obj prefix

    method has_uri_scheme : string -> bool =
      fun uri_scheme -> Raw.File.has_uri_scheme obj uri_scheme

    method hash : unit -> int = fun () -> Raw.File.hash obj
    method is_native : unit -> bool = fun () -> Raw.File.is_native obj

    method make_directory :
        Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File.make_directory obj cancellable

    method make_directory_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.File.make_directory_finish obj result

    method make_directory_with_parents :
        Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File.make_directory_with_parents obj cancellable

    method make_symbolic_link :
        string -> Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun symlink_value cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File.make_symbolic_link obj symlink_value cancellable

    method make_symbolic_link_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.File.make_symbolic_link_finish obj result

    method monitor :
        Enums.filemonitorflags ->
        Cancellable.cancellable_t option ->
        (file_monitor_t, GError.t) result =
      fun flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new file_monitor ret)
          (Raw.File.monitor obj flags cancellable)

    method monitor_directory :
        Enums.filemonitorflags ->
        Cancellable.cancellable_t option ->
        (file_monitor_t, GError.t) result =
      fun flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new file_monitor ret)
          (Raw.File.monitor_directory obj flags cancellable)

    method monitor_file :
        Enums.filemonitorflags ->
        Cancellable.cancellable_t option ->
        (file_monitor_t, GError.t) result =
      fun flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new file_monitor ret)
          (Raw.File.monitor_file obj flags cancellable)

    method mount_enclosing_volume_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.File.mount_enclosing_volume_finish obj result

    method mount_mountable_finish :
        Async_result.async_result_t -> (file_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new file ret)
          (Raw.File.mount_mountable_finish obj result)

    method move_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.File.move_finish obj result

    method open_readwrite :
        Cancellable.cancellable_t option ->
        (File_io_stream.file_io_stream_t, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new File_io_stream.file_io_stream ret)
          (Raw.File.open_readwrite obj cancellable)

    method open_readwrite_finish :
        Async_result.async_result_t ->
        (File_io_stream.file_io_stream_t, GError.t) result =
      fun res ->
        let res = res#as_async_result in
        Result.map
          (fun ret -> new File_io_stream.file_io_stream ret)
          (Raw.File.open_readwrite_finish obj res)

    method peek_path : unit -> string option = fun () -> Raw.File.peek_path obj

    method poll_mountable_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.File.poll_mountable_finish obj result

    method query_default_handler :
        Cancellable.cancellable_t option -> (app_info_t, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new app_info ret)
          (Raw.File.query_default_handler obj cancellable)

    method query_default_handler_finish :
        Async_result.async_result_t -> (app_info_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new app_info ret)
          (Raw.File.query_default_handler_finish obj result)

    method query_exists : Cancellable.cancellable_t option -> bool =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File.query_exists obj cancellable

    method query_file_type :
        Enums.filequeryinfoflags ->
        Cancellable.cancellable_t option ->
        Enums.filetype =
      fun flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File.query_file_type obj flags cancellable

    method query_filesystem_info :
        string ->
        Cancellable.cancellable_t option ->
        (File_info.file_info_t, GError.t) result =
      fun attributes cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new File_info.file_info ret)
          (Raw.File.query_filesystem_info obj attributes cancellable)

    method query_filesystem_info_finish :
        Async_result.async_result_t -> (File_info.file_info_t, GError.t) result
        =
      fun res ->
        let res = res#as_async_result in
        Result.map
          (fun ret -> new File_info.file_info ret)
          (Raw.File.query_filesystem_info_finish obj res)

    method query_info :
        string ->
        Enums.filequeryinfoflags ->
        Cancellable.cancellable_t option ->
        (File_info.file_info_t, GError.t) result =
      fun attributes flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new File_info.file_info ret)
          (Raw.File.query_info obj attributes flags cancellable)

    method query_info_finish :
        Async_result.async_result_t -> (File_info.file_info_t, GError.t) result
        =
      fun res ->
        let res = res#as_async_result in
        Result.map
          (fun ret -> new File_info.file_info ret)
          (Raw.File.query_info_finish obj res)

    method query_settable_attributes :
        Cancellable.cancellable_t option ->
        (Raw.File_attribute_info_list.t, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File.query_settable_attributes obj cancellable

    method query_writable_namespaces :
        Cancellable.cancellable_t option ->
        (Raw.File_attribute_info_list.t, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File.query_writable_namespaces obj cancellable

    method read :
        Cancellable.cancellable_t option ->
        (File_input_stream.file_input_stream_t, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new File_input_stream.file_input_stream ret)
          (Raw.File.read obj cancellable)

    method read_finish :
        Async_result.async_result_t ->
        (File_input_stream.file_input_stream_t, GError.t) result =
      fun res ->
        let res = res#as_async_result in
        Result.map
          (fun ret -> new File_input_stream.file_input_stream ret)
          (Raw.File.read_finish obj res)

    method replace :
        string option ->
        bool ->
        Enums.filecreateflags ->
        Cancellable.cancellable_t option ->
        (File_output_stream.file_output_stream_t, GError.t) result =
      fun etag make_backup flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new File_output_stream.file_output_stream ret)
          (Raw.File.replace obj etag make_backup flags cancellable)

    method replace_finish :
        Async_result.async_result_t ->
        (File_output_stream.file_output_stream_t, GError.t) result =
      fun res ->
        let res = res#as_async_result in
        Result.map
          (fun ret -> new File_output_stream.file_output_stream ret)
          (Raw.File.replace_finish obj res)

    method replace_readwrite :
        string option ->
        bool ->
        Enums.filecreateflags ->
        Cancellable.cancellable_t option ->
        (File_io_stream.file_io_stream_t, GError.t) result =
      fun etag make_backup flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new File_io_stream.file_io_stream ret)
          (Raw.File.replace_readwrite obj etag make_backup flags cancellable)

    method replace_readwrite_finish :
        Async_result.async_result_t ->
        (File_io_stream.file_io_stream_t, GError.t) result =
      fun res ->
        let res = res#as_async_result in
        Result.map
          (fun ret -> new File_io_stream.file_io_stream ret)
          (Raw.File.replace_readwrite_finish obj res)

    method resolve_relative_path : string -> file_t =
      fun relative_path ->
        new file (Raw.File.resolve_relative_path obj relative_path)

    method set_attribute_byte_string :
        string ->
        string ->
        Enums.filequeryinfoflags ->
        Cancellable.cancellable_t option ->
        (bool, GError.t) result =
      fun attribute value flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File.set_attribute_byte_string obj attribute value flags cancellable

    method set_attribute_int32 :
        string ->
        Int32.t ->
        Enums.filequeryinfoflags ->
        Cancellable.cancellable_t option ->
        (bool, GError.t) result =
      fun attribute value flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File.set_attribute_int32 obj attribute value flags cancellable

    method set_attribute_int64 :
        string ->
        int64 ->
        Enums.filequeryinfoflags ->
        Cancellable.cancellable_t option ->
        (bool, GError.t) result =
      fun attribute value flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File.set_attribute_int64 obj attribute value flags cancellable

    method set_attribute_string :
        string ->
        string ->
        Enums.filequeryinfoflags ->
        Cancellable.cancellable_t option ->
        (bool, GError.t) result =
      fun attribute value flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File.set_attribute_string obj attribute value flags cancellable

    method set_attribute_uint32 :
        string ->
        UInt32.t ->
        Enums.filequeryinfoflags ->
        Cancellable.cancellable_t option ->
        (bool, GError.t) result =
      fun attribute value flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File.set_attribute_uint32 obj attribute value flags cancellable

    method set_attribute_uint64 :
        string ->
        UInt64.t ->
        Enums.filequeryinfoflags ->
        Cancellable.cancellable_t option ->
        (bool, GError.t) result =
      fun attribute value flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File.set_attribute_uint64 obj attribute value flags cancellable

    method set_attributes_from_info :
        File_info.file_info_t ->
        Enums.filequeryinfoflags ->
        Cancellable.cancellable_t option ->
        (bool, GError.t) result =
      fun info flags cancellable ->
        let info = info#as_file_info in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File.set_attributes_from_info obj info flags cancellable

    method set_display_name :
        string -> Cancellable.cancellable_t option -> (file_t, GError.t) result
        =
      fun display_name cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new file ret)
          (Raw.File.set_display_name obj display_name cancellable)

    method set_display_name_finish :
        Async_result.async_result_t -> (file_t, GError.t) result =
      fun res ->
        let res = res#as_async_result in
        Result.map
          (fun ret -> new file ret)
          (Raw.File.set_display_name_finish obj res)

    method start_mountable_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.File.start_mountable_finish obj result

    method stop_mountable_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.File.stop_mountable_finish obj result

    method supports_thread_contexts : unit -> bool =
      fun () -> Raw.File.supports_thread_contexts obj

    method trash : Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File.trash obj cancellable

    method trash_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.File.trash_finish obj result

    method unmount_mountable_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.File.unmount_mountable_finish obj result

    method unmount_mountable_with_operation_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.File.unmount_mountable_with_operation_finish obj result

    method as_file = obj
  end

and file_enumerator (obj : Raw.File_enumerator.t) : file_enumerator_t =
  object (self)
    method close : Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.File_enumerator.close obj cancellable

    method close_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.File_enumerator.close_finish obj result

    method get_child : File_info.file_info_t -> file_t =
      fun info ->
        let info = info#as_file_info in
        new file (Raw.File_enumerator.get_child obj info)

    method get_container : unit -> file_t =
      fun () -> new file (Raw.File_enumerator.get_container obj)

    method has_pending : unit -> bool =
      fun () -> Raw.File_enumerator.has_pending obj

    method is_closed : unit -> bool =
      fun () -> Raw.File_enumerator.is_closed obj

    method next_file :
        Cancellable.cancellable_t option ->
        (File_info.file_info_t option, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> Option.map (fun ret -> new File_info.file_info ret) ret)
          (Raw.File_enumerator.next_file obj cancellable)

    method next_files_finish :
        Async_result.async_result_t ->
        (File_info.file_info_t list, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (List.map (fun ret -> new File_info.file_info ret))
          (Raw.File_enumerator.next_files_finish obj result)

    method set_pending : bool -> unit =
      fun pending -> Raw.File_enumerator.set_pending obj pending

    method as_file_enumerator = obj
  end

and file_monitor (obj : Raw.File_monitor.t) : file_monitor_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.File_monitor.on_changed ~after self#as_file_monitor
        ~callback:(fun ~file ~other_file ~event_type ->
          callback
            ~file:(new file file)
            ~other_file:(Option.map (fun w -> new file w) other_file)
            ~event_type)

    method cancel : unit -> bool = fun () -> Raw.File_monitor.cancel obj

    method emit_event :
        file_t -> file_t option -> Enums.filemonitorevent -> unit =
      fun child other_file event_type ->
        let child = child#as_file in
        let other_file = Option.map (fun c -> c#as_file) other_file in
        Raw.File_monitor.emit_event obj child other_file event_type

    method is_cancelled : unit -> bool =
      fun () -> Raw.File_monitor.is_cancelled obj

    method set_rate_limit : int -> unit =
      fun limit_msecs -> Raw.File_monitor.set_rate_limit obj limit_msecs

    method as_file_monitor = obj
  end

and mount (obj : Raw.Mount.t) : mount_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.Mount.on_changed ~after self#as_mount ~callback

    method on_pre_unmount ?(after = false) ~callback () =
      Raw.Mount.on_pre_unmount ~after self#as_mount ~callback

    method on_unmounted ?(after = false) ~callback () =
      Raw.Mount.on_unmounted ~after self#as_mount ~callback

    method can_eject : unit -> bool = fun () -> Raw.Mount.can_eject obj
    method can_unmount : unit -> bool = fun () -> Raw.Mount.can_unmount obj

    method eject_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Mount.eject_finish obj result

    method eject_with_operation_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Mount.eject_with_operation_finish obj result

    method get_default_location : unit -> file_t =
      fun () -> new file (Raw.Mount.get_default_location obj)

    method get_drive : unit -> drive_t option =
      fun () -> Option.map (fun ret -> new drive ret) (Raw.Mount.get_drive obj)

    method get_icon : unit -> Icon.icon_t =
      fun () -> new Icon.icon (Raw.Mount.get_icon obj)

    method get_name : unit -> string = fun () -> Raw.Mount.get_name obj

    method get_root : unit -> file_t =
      fun () -> new file (Raw.Mount.get_root obj)

    method get_sort_key : unit -> string option =
      fun () -> Raw.Mount.get_sort_key obj

    method get_symbolic_icon : unit -> Icon.icon_t =
      fun () -> new Icon.icon (Raw.Mount.get_symbolic_icon obj)

    method get_uuid : unit -> string option = fun () -> Raw.Mount.get_uuid obj

    method get_volume : unit -> volume_t option =
      fun () ->
        Option.map (fun ret -> new volume ret) (Raw.Mount.get_volume obj)

    method guess_content_type_finish :
        Async_result.async_result_t -> (string array, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Mount.guess_content_type_finish obj result

    method guess_content_type_sync :
        bool ->
        Cancellable.cancellable_t option ->
        (string array, GError.t) result =
      fun force_rescan cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Mount.guess_content_type_sync obj force_rescan cancellable

    method is_shadowed : unit -> bool = fun () -> Raw.Mount.is_shadowed obj

    method remount_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Mount.remount_finish obj result

    method shadow : unit -> unit = fun () -> Raw.Mount.shadow obj

    method unmount_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Mount.unmount_finish obj result

    method unmount_with_operation_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Mount.unmount_with_operation_finish obj result

    method unshadow : unit -> unit = fun () -> Raw.Mount.unshadow obj
    method as_mount = obj
  end

and volume (obj : Raw.Volume.t) : volume_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.Volume.on_changed ~after self#as_volume ~callback

    method on_removed ?(after = false) ~callback () =
      Raw.Volume.on_removed ~after self#as_volume ~callback

    method can_eject : unit -> bool = fun () -> Raw.Volume.can_eject obj
    method can_mount : unit -> bool = fun () -> Raw.Volume.can_mount obj

    method eject_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Volume.eject_finish obj result

    method eject_with_operation_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Volume.eject_with_operation_finish obj result

    method enumerate_identifiers : unit -> string array =
      fun () -> Raw.Volume.enumerate_identifiers obj

    method get_activation_root : unit -> file_t option =
      fun () ->
        Option.map
          (fun ret -> new file ret)
          (Raw.Volume.get_activation_root obj)

    method get_drive : unit -> drive_t option =
      fun () -> Option.map (fun ret -> new drive ret) (Raw.Volume.get_drive obj)

    method get_icon : unit -> Icon.icon_t =
      fun () -> new Icon.icon (Raw.Volume.get_icon obj)

    method get_identifier : string -> string option =
      fun kind -> Raw.Volume.get_identifier obj kind

    method get_mount : unit -> mount_t option =
      fun () -> Option.map (fun ret -> new mount ret) (Raw.Volume.get_mount obj)

    method get_name : unit -> string = fun () -> Raw.Volume.get_name obj

    method get_sort_key : unit -> string option =
      fun () -> Raw.Volume.get_sort_key obj

    method get_symbolic_icon : unit -> Icon.icon_t =
      fun () -> new Icon.icon (Raw.Volume.get_symbolic_icon obj)

    method get_uuid : unit -> string option = fun () -> Raw.Volume.get_uuid obj

    method mount_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Volume.mount_finish obj result

    method should_automount : unit -> bool =
      fun () -> Raw.Volume.should_automount obj

    method as_volume = obj
  end

let new_ () : app_launch_context_t =
  new app_launch_context (Raw.App_launch_context.new_ ())
