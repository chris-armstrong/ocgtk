(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type app_info_t = object
    method add_supports_type : string -> (bool, GError.t) result
    method can_delete : unit -> bool
    method can_remove_supports_type : unit -> bool
    method delete : unit -> bool
    method dup : unit -> app_info_t
    method get_commandline : unit -> string option
    method get_description : unit -> string option
    method get_display_name : unit -> string
    method get_executable : unit -> string
    method get_icon : unit -> GIcon.icon_t option
    method get_id : unit -> string option
    method get_name : unit -> string
    method get_supported_types : unit -> string array
    method launch : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t list option -> app_launch_context_t option -> (bool, GError.t) result
    method launch_uris : string list option -> app_launch_context_t option -> (bool, GError.t) result
    method remove_supports_type : string -> (bool, GError.t) result
    method set_as_default_for_extension : string -> (bool, GError.t) result
    method set_as_default_for_type : string -> (bool, GError.t) result
    method set_as_last_used_for_type : string -> (bool, GError.t) result
    method should_show : unit -> bool
    method supports_files : unit -> bool
    method supports_uris : unit -> bool
    method as_app_info : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.t
end

and app_launch_context_t = object
    inherit Gapp_launch_context_signals.app_launch_context_signals
    method get_environment : unit -> string array
    method launch_failed : string -> unit
    method setenv : string -> string -> unit
    method unsetenv : string -> unit
    method as_app_launch_context : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_launch_context.t
end

and drive_t = object
    inherit Gdrive_signals.drive_signals
    method can_eject : unit -> bool
    method can_poll_for_media : unit -> bool
    method can_start : unit -> bool
    method can_start_degraded : unit -> bool
    method can_stop : unit -> bool
    method enumerate_identifiers : unit -> string array
    method get_icon : unit -> GIcon.icon_t
    method get_identifier : string -> string option
    method get_name : unit -> string
    method get_sort_key : unit -> string option
    method get_start_stop_type : unit -> Gio_enums.drivestartstoptype
    method get_symbolic_icon : unit -> GIcon.icon_t
    method get_volumes : unit -> App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.t list
    method has_media : unit -> bool
    method has_volumes : unit -> bool
    method is_media_check_automatic : unit -> bool
    method is_media_removable : unit -> bool
    method is_removable : unit -> bool
    method as_drive : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.t
end

and file_t = object
    method append_to : Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_output_stream.file_output_stream_t, GError.t) result
    method build_attribute_list_for_copy : Gio_enums.filecopyflags -> GCancellable.cancellable_t option -> (string, GError.t) result
    method create : Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_output_stream.file_output_stream_t, GError.t) result
    method create_readwrite : Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_io_stream.file_io_stream_t, GError.t) result
    method delete : GCancellable.cancellable_t option -> (bool, GError.t) result
    method dup : unit -> file_t
    method enumerate_children : string -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (file_enumerator_t, GError.t) result
    method find_enclosing_mount : GCancellable.cancellable_t option -> (mount_t, GError.t) result
    method get_basename : unit -> string option
    method get_child : string -> file_t
    method get_child_for_display_name : string -> (file_t, GError.t) result
    method get_parent : unit -> file_t option
    method get_parse_name : unit -> string
    method get_path : unit -> string option
    method get_uri : unit -> string
    method get_uri_scheme : unit -> string option
    method has_uri_scheme : string -> bool
    method hash : unit -> int
    method is_native : unit -> bool
    method make_directory : GCancellable.cancellable_t option -> (bool, GError.t) result
    method make_directory_with_parents : GCancellable.cancellable_t option -> (bool, GError.t) result
    method make_symbolic_link : string -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method monitor : Gio_enums.filemonitorflags -> GCancellable.cancellable_t option -> (file_monitor_t, GError.t) result
    method monitor_directory : Gio_enums.filemonitorflags -> GCancellable.cancellable_t option -> (file_monitor_t, GError.t) result
    method monitor_file : Gio_enums.filemonitorflags -> GCancellable.cancellable_t option -> (file_monitor_t, GError.t) result
    method open_readwrite : GCancellable.cancellable_t option -> (GFile_io_stream.file_io_stream_t, GError.t) result
    method peek_path : unit -> string option
    method query_default_handler : GCancellable.cancellable_t option -> (app_info_t, GError.t) result
    method query_exists : GCancellable.cancellable_t option -> bool
    method query_file_type : Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> Gio_enums.filetype
    method query_filesystem_info : string -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result
    method query_info : string -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result
    method query_settable_attributes : GCancellable.cancellable_t option -> (File_attribute_info_list.t, GError.t) result
    method query_writable_namespaces : GCancellable.cancellable_t option -> (File_attribute_info_list.t, GError.t) result
    method read : GCancellable.cancellable_t option -> (GFile_input_stream.file_input_stream_t, GError.t) result
    method replace : string option -> bool -> Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_output_stream.file_output_stream_t, GError.t) result
    method replace_readwrite : string option -> bool -> Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_io_stream.file_io_stream_t, GError.t) result
    method resolve_relative_path : string -> file_t
    method set_attribute_byte_string : string -> string -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method set_attribute_string : string -> string -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method set_attributes_from_info : GFile_info.file_info_t -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method set_display_name : string -> GCancellable.cancellable_t option -> (file_t, GError.t) result
    method supports_thread_contexts : unit -> bool
    method trash : GCancellable.cancellable_t option -> (bool, GError.t) result
    method as_file : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t
end

and file_enumerator_t = object
    method close : GCancellable.cancellable_t option -> (bool, GError.t) result
    method get_child : GFile_info.file_info_t -> file_t
    method get_container : unit -> file_t
    method has_pending : unit -> bool
    method is_closed : unit -> bool
    method next_file : GCancellable.cancellable_t option -> (GFile_info.file_info_t option, GError.t) result
    method set_pending : bool -> unit
    method as_file_enumerator : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.t
end

and file_monitor_t = object
    inherit Gfile_monitor_signals.file_monitor_signals
    method cancel : unit -> bool
    method is_cancelled : unit -> bool
    method set_rate_limit : int -> unit
    method cancelled : bool
    method as_file_monitor : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.t
end

and mount_t = object
    inherit Gmount_signals.mount_signals
    method can_eject : unit -> bool
    method can_unmount : unit -> bool
    method get_default_location : unit -> file_t
    method get_drive : unit -> drive_t option
    method get_icon : unit -> GIcon.icon_t
    method get_name : unit -> string
    method get_root : unit -> file_t
    method get_sort_key : unit -> string option
    method get_symbolic_icon : unit -> GIcon.icon_t
    method get_uuid : unit -> string option
    method get_volume : unit -> volume_t option
    method guess_content_type_sync : bool -> GCancellable.cancellable_t option -> (string array, GError.t) result
    method is_shadowed : unit -> bool
    method shadow : unit -> unit
    method unshadow : unit -> unit
    method as_mount : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.t
end

and volume_t = object
    inherit Gvolume_signals.volume_signals
    method can_eject : unit -> bool
    method can_mount : unit -> bool
    method enumerate_identifiers : unit -> string array
    method get_activation_root : unit -> file_t option
    method get_drive : unit -> drive_t option
    method get_icon : unit -> GIcon.icon_t
    method get_identifier : string -> string option
    method get_mount : unit -> mount_t option
    method get_name : unit -> string
    method get_sort_key : unit -> string option
    method get_symbolic_icon : unit -> GIcon.icon_t
    method get_uuid : unit -> string option
    method should_automount : unit -> bool
    method as_volume : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.t
end


class app_info (obj : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.t) : app_info_t = object (self)

  method add_supports_type : string -> (bool, GError.t) result =
    fun content_type ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.add_supports_type obj content_type)

  method can_delete : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.can_delete obj)

  method can_remove_supports_type : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.can_remove_supports_type obj)

  method delete : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.delete obj)

  method dup : unit -> app_info_t =
    fun () ->
      new  app_info(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.dup obj)

  method get_commandline : unit -> string option =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.get_commandline obj)

  method get_description : unit -> string option =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.get_description obj)

  method get_display_name : unit -> string =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.get_display_name obj)

  method get_executable : unit -> string =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.get_executable obj)

  method get_icon : unit -> GIcon.icon_t option =
    fun () ->
      Option.map (fun ret -> new GIcon.icon ret) (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.get_icon obj)

  method get_id : unit -> string option =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.get_id obj)

  method get_name : unit -> string =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.get_name obj)

  method get_supported_types : unit -> string array =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.get_supported_types obj)

  method launch : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t list option -> app_launch_context_t option -> (bool, GError.t) result =
    fun files context ->
      let context = Option.map (fun (c) -> c#as_app_launch_context) context in
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.launch obj files context)

  method launch_uris : string list option -> app_launch_context_t option -> (bool, GError.t) result =
    fun uris context ->
      let context = Option.map (fun (c) -> c#as_app_launch_context) context in
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.launch_uris obj uris context)

  method remove_supports_type : string -> (bool, GError.t) result =
    fun content_type ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.remove_supports_type obj content_type)

  method set_as_default_for_extension : string -> (bool, GError.t) result =
    fun extension ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.set_as_default_for_extension obj extension)

  method set_as_default_for_type : string -> (bool, GError.t) result =
    fun content_type ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.set_as_default_for_type obj content_type)

  method set_as_last_used_for_type : string -> (bool, GError.t) result =
    fun content_type ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.set_as_last_used_for_type obj content_type)

  method should_show : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.should_show obj)

  method supports_files : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.supports_files obj)

  method supports_uris : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_info.supports_uris obj)

    method as_app_info = obj
end
(* Signal class defined in gapp_launch_context_signals.ml *)


and app_launch_context (obj : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_launch_context.t) : app_launch_context_t = object (self)
  inherit Gapp_launch_context_signals.app_launch_context_signals obj

  method get_environment : unit -> string array =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_launch_context.get_environment obj)

  method launch_failed : string -> unit =
    fun startup_notify_id ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_launch_context.launch_failed obj startup_notify_id)

  method setenv : string -> string -> unit =
    fun variable value ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_launch_context.setenv obj variable value)

  method unsetenv : string -> unit =
    fun variable ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_launch_context.unsetenv obj variable)

    method as_app_launch_context = obj
end
(* Signal class defined in gdrive_signals.ml *)


and drive (obj : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.t) : drive_t = object (self)
  inherit Gdrive_signals.drive_signals obj

  method can_eject : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.can_eject obj)

  method can_poll_for_media : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.can_poll_for_media obj)

  method can_start : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.can_start obj)

  method can_start_degraded : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.can_start_degraded obj)

  method can_stop : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.can_stop obj)

  method enumerate_identifiers : unit -> string array =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.enumerate_identifiers obj)

  method get_icon : unit -> GIcon.icon_t =
    fun () ->
      new  GIcon.icon(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.get_icon obj)

  method get_identifier : string -> string option =
    fun kind ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.get_identifier obj kind)

  method get_name : unit -> string =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.get_name obj)

  method get_sort_key : unit -> string option =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.get_sort_key obj)

  method get_start_stop_type : unit -> Gio_enums.drivestartstoptype =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.get_start_stop_type obj)

  method get_symbolic_icon : unit -> GIcon.icon_t =
    fun () ->
      new  GIcon.icon(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.get_symbolic_icon obj)

  method get_volumes : unit -> App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.t list =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.get_volumes obj)

  method has_media : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.has_media obj)

  method has_volumes : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.has_volumes obj)

  method is_media_check_automatic : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.is_media_check_automatic obj)

  method is_media_removable : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.is_media_removable obj)

  method is_removable : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Drive.is_removable obj)

    method as_drive = obj
end

and file (obj : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t) : file_t = object (self)

  method append_to : Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_output_stream.file_output_stream_t, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_output_stream.file_output_stream ret)(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.append_to obj flags cancellable)

  method build_attribute_list_for_copy : Gio_enums.filecopyflags -> GCancellable.cancellable_t option -> (string, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.build_attribute_list_for_copy obj flags cancellable)

  method create : Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_output_stream.file_output_stream_t, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_output_stream.file_output_stream ret)(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.create obj flags cancellable)

  method create_readwrite : Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_io_stream.file_io_stream_t, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_io_stream.file_io_stream ret)(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.create_readwrite obj flags cancellable)

  method delete : GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.delete obj cancellable)

  method dup : unit -> file_t =
    fun () ->
      new  file(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.dup obj)

  method enumerate_children : string -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (file_enumerator_t, GError.t) result =
    fun attributes flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new file_enumerator ret)(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.enumerate_children obj attributes flags cancellable)

  method find_enclosing_mount : GCancellable.cancellable_t option -> (mount_t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new mount ret)(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.find_enclosing_mount obj cancellable)

  method get_basename : unit -> string option =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_basename obj)

  method get_child : string -> file_t =
    fun name ->
      new  file(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_child obj name)

  method get_child_for_display_name : string -> (file_t, GError.t) result =
    fun display_name ->
      Result.map (fun ret -> new file ret)(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_child_for_display_name obj display_name)

  method get_parent : unit -> file_t option =
    fun () ->
      Option.map (fun ret -> new file ret) (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_parent obj)

  method get_parse_name : unit -> string =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_parse_name obj)

  method get_path : unit -> string option =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_path obj)

  method get_uri : unit -> string =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_uri obj)

  method get_uri_scheme : unit -> string option =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_uri_scheme obj)

  method has_uri_scheme : string -> bool =
    fun uri_scheme ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.has_uri_scheme obj uri_scheme)

  method hash : unit -> int =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.hash obj)

  method is_native : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.is_native obj)

  method make_directory : GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.make_directory obj cancellable)

  method make_directory_with_parents : GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.make_directory_with_parents obj cancellable)

  method make_symbolic_link : string -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun symlink_value cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.make_symbolic_link obj symlink_value cancellable)

  method monitor : Gio_enums.filemonitorflags -> GCancellable.cancellable_t option -> (file_monitor_t, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new file_monitor ret)(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.monitor obj flags cancellable)

  method monitor_directory : Gio_enums.filemonitorflags -> GCancellable.cancellable_t option -> (file_monitor_t, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new file_monitor ret)(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.monitor_directory obj flags cancellable)

  method monitor_file : Gio_enums.filemonitorflags -> GCancellable.cancellable_t option -> (file_monitor_t, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new file_monitor ret)(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.monitor_file obj flags cancellable)

  method open_readwrite : GCancellable.cancellable_t option -> (GFile_io_stream.file_io_stream_t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_io_stream.file_io_stream ret)(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.open_readwrite obj cancellable)

  method peek_path : unit -> string option =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.peek_path obj)

  method query_default_handler : GCancellable.cancellable_t option -> (app_info_t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new app_info ret)(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_default_handler obj cancellable)

  method query_exists : GCancellable.cancellable_t option -> bool =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_exists obj cancellable)

  method query_file_type : Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> Gio_enums.filetype =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_file_type obj flags cancellable)

  method query_filesystem_info : string -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result =
    fun attributes cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_info.file_info ret)(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_filesystem_info obj attributes cancellable)

  method query_info : string -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result =
    fun attributes flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_info.file_info ret)(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_info obj attributes flags cancellable)

  method query_settable_attributes : GCancellable.cancellable_t option -> (File_attribute_info_list.t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_settable_attributes obj cancellable)

  method query_writable_namespaces : GCancellable.cancellable_t option -> (File_attribute_info_list.t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_writable_namespaces obj cancellable)

  method read : GCancellable.cancellable_t option -> (GFile_input_stream.file_input_stream_t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_input_stream.file_input_stream ret)(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.read obj cancellable)

  method replace : string option -> bool -> Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_output_stream.file_output_stream_t, GError.t) result =
    fun etag make_backup flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_output_stream.file_output_stream ret)(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.replace obj etag make_backup flags cancellable)

  method replace_readwrite : string option -> bool -> Gio_enums.filecreateflags -> GCancellable.cancellable_t option -> (GFile_io_stream.file_io_stream_t, GError.t) result =
    fun etag make_backup flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_io_stream.file_io_stream ret)(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.replace_readwrite obj etag make_backup flags cancellable)

  method resolve_relative_path : string -> file_t =
    fun relative_path ->
      new  file(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.resolve_relative_path obj relative_path)

  method set_attribute_byte_string : string -> string -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun attribute value flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.set_attribute_byte_string obj attribute value flags cancellable)

  method set_attribute_string : string -> string -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun attribute value flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.set_attribute_string obj attribute value flags cancellable)

  method set_attributes_from_info : GFile_info.file_info_t -> Gio_enums.filequeryinfoflags -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun info flags cancellable ->
      let info = info#as_file_info in
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.set_attributes_from_info obj info flags cancellable)

  method set_display_name : string -> GCancellable.cancellable_t option -> (file_t, GError.t) result =
    fun display_name cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new file ret)(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.set_display_name obj display_name cancellable)

  method supports_thread_contexts : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.supports_thread_contexts obj)

  method trash : GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.trash obj cancellable)

    method as_file = obj
end

and file_enumerator (obj : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.t) : file_enumerator_t = object (self)

  method close : GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.close obj cancellable)

  method get_child : GFile_info.file_info_t -> file_t =
    fun info ->
      let info = info#as_file_info in
      new  file(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.get_child obj info)

  method get_container : unit -> file_t =
    fun () ->
      new  file(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.get_container obj)

  method has_pending : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.has_pending obj)

  method is_closed : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.is_closed obj)

  method next_file : GCancellable.cancellable_t option -> (GFile_info.file_info_t option, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> Option.map (fun ret -> new GFile_info.file_info ret) ret)(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.next_file obj cancellable)

  method set_pending : bool -> unit =
    fun pending ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.set_pending obj pending)

    method as_file_enumerator = obj
end
(* Signal class defined in gfile_monitor_signals.ml *)


and file_monitor (obj : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.t) : file_monitor_t = object (self)
  inherit Gfile_monitor_signals.file_monitor_signals obj

  method cancel : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.cancel obj)

  method is_cancelled : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.is_cancelled obj)

  method set_rate_limit : int -> unit =
    fun limit_msecs ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.set_rate_limit obj limit_msecs)

  method cancelled = App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.get_cancelled obj

    method as_file_monitor = obj
end
(* Signal class defined in gmount_signals.ml *)


and mount (obj : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.t) : mount_t = object (self)
  inherit Gmount_signals.mount_signals obj

  method can_eject : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.can_eject obj)

  method can_unmount : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.can_unmount obj)

  method get_default_location : unit -> file_t =
    fun () ->
      new  file(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_default_location obj)

  method get_drive : unit -> drive_t option =
    fun () ->
      Option.map (fun ret -> new drive ret) (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_drive obj)

  method get_icon : unit -> GIcon.icon_t =
    fun () ->
      new  GIcon.icon(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_icon obj)

  method get_name : unit -> string =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_name obj)

  method get_root : unit -> file_t =
    fun () ->
      new  file(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_root obj)

  method get_sort_key : unit -> string option =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_sort_key obj)

  method get_symbolic_icon : unit -> GIcon.icon_t =
    fun () ->
      new  GIcon.icon(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_symbolic_icon obj)

  method get_uuid : unit -> string option =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_uuid obj)

  method get_volume : unit -> volume_t option =
    fun () ->
      Option.map (fun ret -> new volume ret) (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_volume obj)

  method guess_content_type_sync : bool -> GCancellable.cancellable_t option -> (string array, GError.t) result =
    fun force_rescan cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.guess_content_type_sync obj force_rescan cancellable)

  method is_shadowed : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.is_shadowed obj)

  method shadow : unit -> unit =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.shadow obj)

  method unshadow : unit -> unit =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.unshadow obj)

    method as_mount = obj
end
(* Signal class defined in gvolume_signals.ml *)


and volume (obj : App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.t) : volume_t = object (self)
  inherit Gvolume_signals.volume_signals obj

  method can_eject : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.can_eject obj)

  method can_mount : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.can_mount obj)

  method enumerate_identifiers : unit -> string array =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.enumerate_identifiers obj)

  method get_activation_root : unit -> file_t option =
    fun () ->
      Option.map (fun ret -> new file ret) (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_activation_root obj)

  method get_drive : unit -> drive_t option =
    fun () ->
      Option.map (fun ret -> new drive ret) (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_drive obj)

  method get_icon : unit -> GIcon.icon_t =
    fun () ->
      new  GIcon.icon(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_icon obj)

  method get_identifier : string -> string option =
    fun kind ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_identifier obj kind)

  method get_mount : unit -> mount_t option =
    fun () ->
      Option.map (fun ret -> new mount ret) (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_mount obj)

  method get_name : unit -> string =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_name obj)

  method get_sort_key : unit -> string option =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_sort_key obj)

  method get_symbolic_icon : unit -> GIcon.icon_t =
    fun () ->
      new  GIcon.icon(App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_symbolic_icon obj)

  method get_uuid : unit -> string option =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_uuid obj)

  method should_automount : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.should_automount obj)

    method as_volume = obj
end
let new_ () : app_launch_context_t =
  new app_launch_context (App_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.App_launch_context.new_ ())

