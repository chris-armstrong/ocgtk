(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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


class file (obj : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t) : file_t = object (self)

  method append_to : Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_output_stream.file_output_stream_t, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_output_stream.file_output_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.append_to obj flags cancellable)

  method append_to_finish : GAsync_result.async_result_t -> (GFile_output_stream.file_output_stream_t, GError.t) result =
    fun res ->
      let res = res#as_async_result in
      Result.map (fun ret -> new GFile_output_stream.file_output_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.append_to_finish obj res)

  method build_attribute_list_for_copy : Gio_enums.filecopyflags -> GCancellable.cancellable_t option -> (string, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.build_attribute_list_for_copy obj flags cancellable)

  method copy_attributes : file_t -> Gio_enums.filecopyflags -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun destination flags cancellable ->
      let destination = destination#as_file in
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.copy_attributes obj destination flags cancellable)

  method copy_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun res ->
      let res = res#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.copy_finish obj res)

  method create : Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_output_stream.file_output_stream_t, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_output_stream.file_output_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.create obj flags cancellable)

  method create_finish : GAsync_result.async_result_t -> (GFile_output_stream.file_output_stream_t, GError.t) result =
    fun res ->
      let res = res#as_async_result in
      Result.map (fun ret -> new GFile_output_stream.file_output_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.create_finish obj res)

  method create_readwrite : Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_io_stream.file_io_stream_t, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_io_stream.file_io_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.create_readwrite obj flags cancellable)

  method create_readwrite_finish : GAsync_result.async_result_t -> (GFile_io_stream.file_io_stream_t, GError.t) result =
    fun res ->
      let res = res#as_async_result in
      Result.map (fun ret -> new GFile_io_stream.file_io_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.create_readwrite_finish obj res)

  method delete : GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.delete obj cancellable)

  method delete_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.delete_finish obj result)

  method dup : unit -> file_t =
    fun () ->
      new  file(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.dup obj)

  method eject_mountable_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.eject_mountable_finish obj result)

  method eject_mountable_with_operation_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.eject_mountable_with_operation_finish obj result)

  method enumerate_children : string -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (file_enumerator_t, GError.t) result =
    fun attributes flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new file_enumerator ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.enumerate_children obj attributes flags cancellable)

  method enumerate_children_finish : GAsync_result.async_result_t -> (file_enumerator_t, GError.t) result =
    fun res ->
      let res = res#as_async_result in
      Result.map (fun ret -> new file_enumerator ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.enumerate_children_finish obj res)

  method equal : file_t -> bool =
    fun file2 ->
      let file2 = file2#as_file in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.equal obj file2)

  method find_enclosing_mount : GCancellable.cancellable_t option -> (mount_t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new mount ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.find_enclosing_mount obj cancellable)

  method find_enclosing_mount_finish : GAsync_result.async_result_t -> (mount_t, GError.t) result =
    fun res ->
      let res = res#as_async_result in
      Result.map (fun ret -> new mount ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.find_enclosing_mount_finish obj res)

  method get_basename : unit -> string option =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_basename obj)

  method get_child : string -> file_t =
    fun name ->
      new  file(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_child obj name)

  method get_child_for_display_name : string -> (file_t, GError.t) result =
    fun display_name ->
      Result.map (fun ret -> new file ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_child_for_display_name obj display_name)

  method get_parent : unit -> file_t option =
    fun () ->
      Option.map (fun ret -> new file ret) (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_parent obj)

  method get_parse_name : unit -> string =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_parse_name obj)

  method get_path : unit -> string option =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_path obj)

  method get_relative_path : file_t -> string option =
    fun descendant ->
      let descendant = descendant#as_file in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_relative_path obj descendant)

  method get_uri : unit -> string =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_uri obj)

  method get_uri_scheme : unit -> string option =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_uri_scheme obj)

  method has_parent : file_t option -> bool =
    fun parent ->
      let parent = Option.map (fun (c) -> c#as_file) parent in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.has_parent obj parent)

  method has_prefix : file_t -> bool =
    fun prefix ->
      let prefix = prefix#as_file in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.has_prefix obj prefix)

  method has_uri_scheme : string -> bool =
    fun uri_scheme ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.has_uri_scheme obj uri_scheme)

  method hash : unit -> int =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.hash obj)

  method is_native : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.is_native obj)

  method make_directory : GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.make_directory obj cancellable)

  method make_directory_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.make_directory_finish obj result)

  method make_directory_with_parents : GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.make_directory_with_parents obj cancellable)

  method make_symbolic_link : string -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun symlink_value cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.make_symbolic_link obj symlink_value cancellable)

  method make_symbolic_link_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.make_symbolic_link_finish obj result)

  method monitor : Gio_enums.filemonitorflags -> GCancellable.cancellable_t option -> (file_monitor_t, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new file_monitor ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.monitor obj flags cancellable)

  method monitor_directory : Gio_enums.filemonitorflags -> GCancellable.cancellable_t option -> (file_monitor_t, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new file_monitor ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.monitor_directory obj flags cancellable)

  method monitor_file : Gio_enums.filemonitorflags -> GCancellable.cancellable_t option -> (file_monitor_t, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new file_monitor ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.monitor_file obj flags cancellable)

  method mount_enclosing_volume_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.mount_enclosing_volume_finish obj result)

  method mount_mountable_finish : GAsync_result.async_result_t -> (file_t, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      Result.map (fun ret -> new file ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.mount_mountable_finish obj result)

  method move_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.move_finish obj result)

  method open_readwrite : GCancellable.cancellable_t option -> (GFile_io_stream.file_io_stream_t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_io_stream.file_io_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.open_readwrite obj cancellable)

  method open_readwrite_finish : GAsync_result.async_result_t -> (GFile_io_stream.file_io_stream_t, GError.t) result =
    fun res ->
      let res = res#as_async_result in
      Result.map (fun ret -> new GFile_io_stream.file_io_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.open_readwrite_finish obj res)

  method peek_path : unit -> string option =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.peek_path obj)

  method poll_mountable_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.poll_mountable_finish obj result)

  method query_default_handler : GCancellable.cancellable_t option -> (GApp_info_and__app_launch_context.app_info_t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GApp_info_and__app_launch_context.app_info ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_default_handler obj cancellable)

  method query_default_handler_finish : GAsync_result.async_result_t -> (GApp_info_and__app_launch_context.app_info_t, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      Result.map (fun ret -> new GApp_info_and__app_launch_context.app_info ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_default_handler_finish obj result)

  method query_exists : GCancellable.cancellable_t option -> bool =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_exists obj cancellable)

  method query_file_type : Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> Gio_enums.filetype =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_file_type obj flags cancellable)

  method query_filesystem_info : string -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result =
    fun attributes cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_info.file_info ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_filesystem_info obj attributes cancellable)

  method query_filesystem_info_finish : GAsync_result.async_result_t -> (GFile_info.file_info_t, GError.t) result =
    fun res ->
      let res = res#as_async_result in
      Result.map (fun ret -> new GFile_info.file_info ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_filesystem_info_finish obj res)

  method query_info : string -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result =
    fun attributes flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_info.file_info ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_info obj attributes flags cancellable)

  method query_info_finish : GAsync_result.async_result_t -> (GFile_info.file_info_t, GError.t) result =
    fun res ->
      let res = res#as_async_result in
      Result.map (fun ret -> new GFile_info.file_info ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_info_finish obj res)

  method query_settable_attributes : GCancellable.cancellable_t option -> (File_attribute_info_list.t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_settable_attributes obj cancellable)

  method query_writable_namespaces : GCancellable.cancellable_t option -> (File_attribute_info_list.t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_writable_namespaces obj cancellable)

  method read : GCancellable.cancellable_t option -> (GFile_input_stream.file_input_stream_t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_input_stream.file_input_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.read obj cancellable)

  method read_finish : GAsync_result.async_result_t -> (GFile_input_stream.file_input_stream_t, GError.t) result =
    fun res ->
      let res = res#as_async_result in
      Result.map (fun ret -> new GFile_input_stream.file_input_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.read_finish obj res)

  method replace : string option -> bool -> Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_output_stream.file_output_stream_t, GError.t) result =
    fun etag make_backup flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_output_stream.file_output_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.replace obj etag make_backup flags cancellable)

  method replace_finish : GAsync_result.async_result_t -> (GFile_output_stream.file_output_stream_t, GError.t) result =
    fun res ->
      let res = res#as_async_result in
      Result.map (fun ret -> new GFile_output_stream.file_output_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.replace_finish obj res)

  method replace_readwrite : string option -> bool -> Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_io_stream.file_io_stream_t, GError.t) result =
    fun etag make_backup flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_io_stream.file_io_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.replace_readwrite obj etag make_backup flags cancellable)

  method replace_readwrite_finish : GAsync_result.async_result_t -> (GFile_io_stream.file_io_stream_t, GError.t) result =
    fun res ->
      let res = res#as_async_result in
      Result.map (fun ret -> new GFile_io_stream.file_io_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.replace_readwrite_finish obj res)

  method resolve_relative_path : string -> file_t =
    fun relative_path ->
      new  file(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.resolve_relative_path obj relative_path)

  method set_attribute_byte_string : string -> string -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun attribute value flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.set_attribute_byte_string obj attribute value flags cancellable)

  method set_attribute_int32 : string -> Int32.t -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun attribute value flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.set_attribute_int32 obj attribute value flags cancellable)

  method set_attribute_int64 : string -> int64 -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun attribute value flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.set_attribute_int64 obj attribute value flags cancellable)

  method set_attribute_string : string -> string -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun attribute value flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.set_attribute_string obj attribute value flags cancellable)

  method set_attribute_uint32 : string -> UInt32.t -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun attribute value flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.set_attribute_uint32 obj attribute value flags cancellable)

  method set_attribute_uint64 : string -> UInt64.t -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun attribute value flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.set_attribute_uint64 obj attribute value flags cancellable)

  method set_attributes_from_info : GFile_info.file_info_t -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun info flags cancellable ->
      let info = info#as_file_info in
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.set_attributes_from_info obj info flags cancellable)

  method set_display_name : string -> GCancellable.cancellable_t option -> (file_t, GError.t) result =
    fun display_name cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new file ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.set_display_name obj display_name cancellable)

  method set_display_name_finish : GAsync_result.async_result_t -> (file_t, GError.t) result =
    fun res ->
      let res = res#as_async_result in
      Result.map (fun ret -> new file ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.set_display_name_finish obj res)

  method start_mountable_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.start_mountable_finish obj result)

  method stop_mountable_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.stop_mountable_finish obj result)

  method supports_thread_contexts : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.supports_thread_contexts obj)

  method trash : GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.trash obj cancellable)

  method trash_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.trash_finish obj result)

  method unmount_mountable_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.unmount_mountable_finish obj result)

  method unmount_mountable_with_operation_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.unmount_mountable_with_operation_finish obj result)

    method as_file = obj
end

and file_enumerator (obj : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.t) : file_enumerator_t = object (self)

  method close : GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.close obj cancellable)

  method close_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.close_finish obj result)

  method get_child : GFile_info.file_info_t -> file_t =
    fun info ->
      let info = info#as_file_info in
      new  file(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.get_child obj info)

  method get_container : unit -> file_t =
    fun () ->
      new  file(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.get_container obj)

  method has_pending : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.has_pending obj)

  method is_closed : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.is_closed obj)

  method next_file : GCancellable.cancellable_t option -> (GFile_info.file_info_t option, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> Option.map (fun ret -> new GFile_info.file_info ret) ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.next_file obj cancellable)

  method next_files_finish : GAsync_result.async_result_t -> (File_info.t list, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.next_files_finish obj result)

  method set_pending : bool -> unit =
    fun pending ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.set_pending obj pending)

    method as_file_enumerator = obj
end
(* Signal class defined in gfile_monitor_signals.ml *)


and file_monitor (obj : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.t) : file_monitor_t = object (self)
  inherit Gfile_monitor_signals.file_monitor_signals obj

  method cancel : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.cancel obj)

  method emit_event : file_t -> file_t -> Gio_enums.filemonitorevent -> unit =
    fun child other_file event_type ->
      let child = child#as_file in
      let other_file = other_file#as_file in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.emit_event obj child other_file event_type)

  method is_cancelled : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.is_cancelled obj)

  method set_rate_limit : int -> unit =
    fun limit_msecs ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.set_rate_limit obj limit_msecs)

  method cancelled = File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.get_cancelled obj

    method as_file_monitor = obj
end
(* Signal class defined in gmount_signals.ml *)


and mount (obj : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.t) : mount_t = object (self)
  inherit Gmount_signals.mount_signals obj

  method can_eject : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.can_eject obj)

  method can_unmount : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.can_unmount obj)

  method eject_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.eject_finish obj result)

  method eject_with_operation_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.eject_with_operation_finish obj result)

  method get_default_location : unit -> file_t =
    fun () ->
      new  file(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_default_location obj)

  method get_drive : unit -> GDrive.drive_t option =
    fun () ->
      Option.map (fun ret -> new GDrive.drive ret) (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_drive obj)

  method get_icon : unit -> GIcon.icon_t =
    fun () ->
      new  GIcon.icon(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_icon obj)

  method get_name : unit -> string =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_name obj)

  method get_root : unit -> file_t =
    fun () ->
      new  file(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_root obj)

  method get_sort_key : unit -> string option =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_sort_key obj)

  method get_symbolic_icon : unit -> GIcon.icon_t =
    fun () ->
      new  GIcon.icon(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_symbolic_icon obj)

  method get_uuid : unit -> string option =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_uuid obj)

  method get_volume : unit -> volume_t option =
    fun () ->
      Option.map (fun ret -> new volume ret) (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_volume obj)

  method guess_content_type_finish : GAsync_result.async_result_t -> (string array, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.guess_content_type_finish obj result)

  method guess_content_type_sync : bool -> GCancellable.cancellable_t option -> (string array, GError.t) result =
    fun force_rescan cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.guess_content_type_sync obj force_rescan cancellable)

  method is_shadowed : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.is_shadowed obj)

  method remount_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.remount_finish obj result)

  method shadow : unit -> unit =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.shadow obj)

  method unmount_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.unmount_finish obj result)

  method unmount_with_operation_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.unmount_with_operation_finish obj result)

  method unshadow : unit -> unit =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.unshadow obj)

    method as_mount = obj
end
(* Signal class defined in gvolume_signals.ml *)


and volume (obj : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.t) : volume_t = object (self)
  inherit Gvolume_signals.volume_signals obj

  method can_eject : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.can_eject obj)

  method can_mount : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.can_mount obj)

  method eject_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.eject_finish obj result)

  method eject_with_operation_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.eject_with_operation_finish obj result)

  method enumerate_identifiers : unit -> string array =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.enumerate_identifiers obj)

  method get_activation_root : unit -> file_t option =
    fun () ->
      Option.map (fun ret -> new file ret) (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_activation_root obj)

  method get_drive : unit -> GDrive.drive_t option =
    fun () ->
      Option.map (fun ret -> new GDrive.drive ret) (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_drive obj)

  method get_icon : unit -> GIcon.icon_t =
    fun () ->
      new  GIcon.icon(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_icon obj)

  method get_identifier : string -> string option =
    fun kind ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_identifier obj kind)

  method get_mount : unit -> mount_t option =
    fun () ->
      Option.map (fun ret -> new mount ret) (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_mount obj)

  method get_name : unit -> string =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_name obj)

  method get_sort_key : unit -> string option =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_sort_key obj)

  method get_symbolic_icon : unit -> GIcon.icon_t =
    fun () ->
      new  GIcon.icon(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_symbolic_icon obj)

  method get_uuid : unit -> string option =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_uuid obj)

  method mount_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.mount_finish obj result)

  method should_automount : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.should_automount obj)

    method as_volume = obj
end
